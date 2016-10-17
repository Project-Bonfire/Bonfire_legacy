

/***************************** Include Files *******************************/
#include "NoC_NI_AXI.h"

/************************** Function Definitions ***************************/
u32 NoC_NI_AXI_recv(u32 base_addr) {
  u32 return_value = NoC_NI_AXI_mReadReg(base_addr, RX_OFFSET);
  NoC_NI_AXI_mWriteReg(base_addr, DATA_VALID_OFFSET, 1);

  return return_value;
}

void NoC_NI_AXI_send(u32 base_addr, u32 data) {
  NoC_NI_AXI_mWriteReg(base_addr, TX_OFFSET, data);
  NoC_NI_AXI_mWriteReg(base_addr, SEND_ENABLE_OFFSET, 1);
}
