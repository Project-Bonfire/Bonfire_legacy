
#ifndef NOC_NI_AXI_H
#define NOC_NI_AXI_H


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"
#include "defines.h"

/* Basic usage */
/*

SENDING:
========
  ____________________________________
 |                                    |
 | Write data to be sent to TX_OFFSET |
 |____________________________________|

                   |
                   V
  ____________________________________
 |                                    |
 |    Write into SEND_ENABLE_OFFSET   |
 |         to send the data.          |
 |____________________________________|

NOTE: When writing into SEND_ENABLE_OFFSET, the value does not matter,
      it's the writing process itself that triggers the sending

RECEIVING:
==========
  ____________________________________
 |                                    |
 |          IRQ is received           |
 |____________________________________|

                   |
                   V
  ____________________________________
 |                                    |
 |    Read the data from RX_OFFSET    |
 |____________________________________|

                   |
                   V
  ____________________________________
 |                                    |
 |    Write into DATA_VALID_OFFSET    |
 |____________________________________|

 NOTE: Writing into DATA_VALID_OFFSET will signal the NI that the data is received.
        Until this step is not done, the NI will buffer the incoming flits into
        its buffer. When the buffer is full, additional new flits might get dropped.

        When writing into SEND_ENABLE_OFFSET, the value does not matter,
              it's the writing process itself that triggers the sending

NOTE 2: When reading any of the offsets besides RX_OFFSET, always the value "0" is returned.
*/


/**************************** Type Definitions *****************************/
/**
 *
 * Write a value to a NoC_NI_AXI register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the NoC_NI_AXIdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void NoC_NI_AXI_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define NoC_NI_AXI_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a NoC_NI_AXI register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the NoC_NI_AXI device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 NoC_NI_AXI_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define NoC_NI_AXI_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/

/**
 *
 * Receive a flit from a NI with base address base_addr.
 *
 * @param   base_addr is the base address of the NI the data should be read from
 *
 * @return  A flit read from the NI
 *
 */
u32 NoC_NI_AXI_recv(u32 base_addr);

/**
 *
 * Send a flit to a NI with base address base_addr.
 *
 * @param   base_addr is the base address of the NI the data should be read from
 * @param   data is the data (flit) to be sent
 *
 */

void NoC_NI_AXI_send(u32 base_addr, u32 data);

#endif // NOC_NI_AXI_H
