/*
Copyright (C) Karl Janson 2016

Example program for using the project bonfire AXI network interface (NI).
=========================================================================

It expects the NI to be connected to the Zinq processing system over AXI and
with its router input and output ports connected together, so that a loopback
connection is formed.

The example program sends data to the AXI and reads it back from the same NI
(over the loopback connection) and prints it on a screen when the interrupt happens.

Connection diagram:
===================

       +--------------+ Router out
   AXI |              |------------>+
 <====>|      NI      |             |
       |              |<------------+
       +--------------+ Router in
*/

#include <stdio.h>
#include <stdlib.h>
#include "xil_exception.h"
#include "xparameters.h"
#include "xscugic.h"
#include "NoC_NI_AXI.h"

/************************** Constant Definitions *****************************/

#define INTC_DEVICE_ID		XPAR_SCUGIC_0_DEVICE_ID
#define NI_0_IRQ_ID			XPAR_FABRIC_NOC_NI_AXI_0_AXI_RX_IRQ_INTR
#define NI_0_BASEADDR		XPAR_NOC_NI_AXI_0_S00_AXI_BASEADDR
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
	status = XScuGic_Connect(&interrupt_controller, NI_0_IRQ_ID,
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

	return_value = NoC_NI_AXI_recv(NI_0_BASEADDR);

	printf("Receiving data using IRQ: %lu\r\n", return_value);
	XScuGic_Disable(&interrupt_controller, NI_0_IRQ_ID);
}

/*
 * Code related to sending data
 */
void main_loop(){

	int i;
	for (i = 0; i < NUM_OF_ITERATIONS; i++){
		printf("Sending number %d\r\n", i);
		NoC_NI_AXI_send(NI_0_BASEADDR, i);

		//Enable interrupts for NI 0
		XScuGic_Enable(&interrupt_controller, NI_0_IRQ_ID);
	}
	printf("Data sent\r\n");


}
