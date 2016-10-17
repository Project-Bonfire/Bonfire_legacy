#include "packetizer.h"

/*
 * Calculates parity of a flit.
 *
 * flit: flit without parity bit
 * return: If there is an even number of '1'-s in the flit, returns '0', else '1'
 */

unsigned int parity_check(u32 flit){

	unsigned int parity = 0;

	while (flit)
    {
        parity = !parity;
        flit = flit & (flit - 1);
    }

	return parity;
}

/*
 * Builds payload part of header flit.
 *
 * packetID:	 Counter specifying the packet ID (one-hot, 8-bit)
 * srcAddr:		 Address of the source node (4-bit)
 * dstAddr:		 Address of the destination node (4-bit)
 * packetLength: Length of the packet in flits (including the header and tail, 12 bits)
 *
 * Return:		 Payload part of the header (28 bits)
 */

u32 build_header(int packetID, int srcAddr, int dstAddr, int packetLength){

	return packetID | \
			(srcAddr << SRC_ADDR_OFFSET) | \
			(dstAddr << DST_ADDR_OFFSET) | \
			(packetLength << PACKET_LENGTH_OFFSET);

}

/*
 * Builds the flit by adding flit type and parity bit to the payload
 *
 * flitType:	Type of the flit (header || body || tail - 3-bit, one-hot)
 * payLoad:		Flit's payload (28)
 *
 * Return:		Flit contents
 */

u32 build_flit (int flitType, u32 payload) {

	u32 flit = 0 | \
			(payload << PAYLOAD_OFFSET) | \
			(flitType << FLIT_TYPE_OFFSET);

	u32 parity = parity_check(flit);

	return flit | parity;

}

int header_decode(u32 header, int *packetID, int *srcAddr, int *dstAddr, int *packetLength){

	int i;
	int oneCounter = 0;

	*packetID = (header & FLIT_ID_MASK);
	*srcAddr = (header & FLIT_SCR_ADDR_MASK) >> SRC_ADDR_OFFSET;
	*dstAddr = (header & FLIT_DST_ADDR_MASK) >> DST_ADDR_OFFSET;
	*packetLength = (header & FLIT_LENGHT_MASK) >> PACKET_LENGTH_OFFSET;


	for (i = 0; i < SIZEOF_PACKET_ID; i++)
    {
		//Count 1-s in packageID
		oneCounter += (*packetID & (1 << i)) != 0 ? 1 : 0;
    }

	if (oneCounter != 1){ //Not one-hot
		return HEADER_INVALID_ID;

	} else if (*srcAddr > XPAR_NOC_NI_AXI_NUM_INSTANCES){
		return HEADER_INVALID_SRC_ADDR;

	} else if (*dstAddr > XPAR_NOC_NI_AXI_NUM_INSTANCES){
		return HEADER_INVALID_DST_ADDR;

	} else if (dstAddr == srcAddr){
		return HEADER_SRC_ADDR_IS_DST_ADDR;

	} else if (*packetLength < 2){ //Minimal packet = header + tail
		return HEADER_INVALID_LENGTH;

	} else {
		return HEADER_OK;
	}

}
