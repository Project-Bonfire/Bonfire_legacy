/*
Copyright (C) Karl Janson 2016

Example program for testing the Project Bonfire router
=========================================================================

*/

#include <stdio.h>
#include <stdlib.h>
#include "xil_exception.h"
#include "xparameters.h"
#include "xscugic.h"
#include "NoC_NI_AXI.h"
#include "packetizer.h"

/************************** Constant Definitions *****************************/

#define INTC_DEVICE_ID		XPAR_SCUGIC_0_DEVICE_ID
#define NI_L_IRQ_ID			XPAR_FABRIC_NOC_NI_AXI_L_AXI_RX_IRQ_INTR
#define NI_L_BASEADDR		XPAR_NOC_NI_AXI_L_S00_AXI_BASEADDR

#define NI_W_IRQ_ID			XPAR_FABRIC_NOC_NI_AXI_W_AXI_RX_IRQ_INTR
#define NI_W_BASEADDR		XPAR_NOC_NI_AXI_W_S00_AXI_BASEADDR

#define NI_E_IRQ_ID			XPAR_FABRIC_NOC_NI_AXI_E_AXI_RX_IRQ_INTR
#define NI_E_BASEADDR		XPAR_NOC_NI_AXI_E_S00_AXI_BASEADDR

#define NI_S_IRQ_ID			XPAR_FABRIC_NOC_NI_AXI_S_AXI_RX_IRQ_INTR
#define NI_S_BASEADDR		XPAR_NOC_NI_AXI_S_S00_AXI_BASEADDR

#define NI_N_IRQ_ID			XPAR_FABRIC_NOC_NI_AXI_N_AXI_RX_IRQ_INTR
#define NI_N_BASEADDR		XPAR_NOC_NI_AXI_N_S00_AXI_BASEADDR

#define NUM_OF_ITERATIONS	64

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/
int setup_irq(u16 xscugic_device_id);
void ni_0_irq_handler(void *callback_ref);
void main_loop();

/************************** Variable Definitions *****************************/

XScuGic interrupt_controller; 	     /* Instance of the Interrupt Controller */
static XScuGic_Config *gic_config;    /* The configuration parameters of the
                                       controller */

/****************************** Start of code ********************************/

int main(void)
{
	int status;

	/* Set up the interrupt */
	status = setup_irq(INTC_DEVICE_ID);

	if (status != XST_SUCCESS) {
		printf("Initialization sequence failed!\r\n");

		return XST_FAILURE;

	} else {
		printf("Initialization sequence completed successfully\r\n");

		main_loop();
		return XST_SUCCESS;
	}
}

/*
 * Setup the interrupt system.
 *
 * @param u16 xscugic_device_id: Id of the interrupt controller device
 * @return: XST_SUCCESS upon successful IRQ init, XST_FAILURE in case of errors.
 */
int setup_irq(u16 xscugic_device_id)
{
	int status;

	/********** General IRQ setup **********/

	/* Initialize the interrupt controller driver */
	gic_config = XScuGic_LookupConfig(xscugic_device_id);
	if (NULL == gic_config) {
		return XST_FAILURE;
	}

	status = XScuGic_CfgInitialize(&interrupt_controller, gic_config,
					gic_config->CpuBaseAddress);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Perform a self-test correctly if the IRQ controller*/
	status = XScuGic_SelfTest(&interrupt_controller);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/* Connect the interrupt controller interrupt handler to the hardware
	 	interrupt handling logic in the ARM processor.*/

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler,
			&interrupt_controller);

	/* Enable interrupts in the ARM */
	Xil_ExceptionEnable();


	/********** NI specific IRQ setup **********/

	/* Connect the IRQ handler function */
	status = XScuGic_Connect(&interrupt_controller, NI_W_IRQ_ID,
			   (Xil_ExceptionHandler)ni_0_irq_handler,
			   (void *)&interrupt_controller);

	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

/*
 * IRQ hander function for NI 0.
 * Reads the data from the NI when the interrupt is received.
 *
 * @param u16 xscugic_device_id: Id of the interrupt controller device
 * @return: XST_SUCCESS upon successful IRQ init, XST_FAILURE in case of errors.
 */
void ni_0_irq_handler(void *callback_ref)
{
	u32 return_value = 0;

	return_value = NoC_NI_AXI_recv(NI_W_BASEADDR);

	printf("Receiving data using IRQ: %lu\r\n", return_value);
	XScuGic_Disable(&interrupt_controller, NI_W_IRQ_ID);
}

/*
 * Code related to sending data
 */
void main_loop(){

	u32 header = build_header(1, 0, 1, 3);
	u32 header_flit = build_flit(FLIT_TYPE_HEADER, header);

	printf("The header in dec is: %lu\n", header_flit);

	NoC_NI_AXI_send(NI_L_BASEADDR, header_flit);

	//Enable interrupts for NI 0
	XScuGic_Enable(&interrupt_controller, NI_W_IRQ_ID);
	printf("Data sent\r\n");



	u32 return_value = 0;

	return_value = NoC_NI_AXI_recv(NI_N_BASEADDR);

	printf("Receiving data from North: %lu\r\n", return_value);


	return_value = 0;

	return_value = NoC_NI_AXI_recv(NI_E_BASEADDR);

	printf("Receiving data from East: %lu\r\n", return_value);


	return_value = 0;

	return_value = NoC_NI_AXI_recv(NI_W_BASEADDR);

	printf("Receiving data from West: %lu\r\n", return_value);


	return_value = 0;

	return_value = NoC_NI_AXI_recv(NI_S_BASEADDR);

	printf("Receiving data from South: %lu\r\n", return_value);


	return_value = 0;

	return_value = NoC_NI_AXI_recv(NI_L_BASEADDR);

	printf("Receiving data from local: %lu\r\n", return_value);

}
 
