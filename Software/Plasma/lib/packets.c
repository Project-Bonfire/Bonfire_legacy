#include "packets.h"

/*
 * Calculates parity of a flit.
 *
 * flit: flit without parity bit
 * return: If there is an even number of '1'-s in the flit, returns '0', else '1'
 */

unsigned int parity_check(unsigned int flit)
{

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
 * dstAddr:		 Address of the destination node (4-bit)
 * packetLength: Length of the packet in flits (including the header and tail, 12 bits)
 *
 * Return:		 Payload part of the header (28 bits)
 */

 unsigned int build_header(unsigned int dstAddr, unsigned int packetLength)
 {

 	return ((dstAddr << DST_ADDR_OFFSET) | \
 	    (packetLength << PACKET_LENGTH_OFFSET));
 }

/*
 * Builds the flit by adding flit type and parity bit to the payload
 *
 * flitType:	Type of the flit (header || body || tail - 3-bit, one-hot)
 * payLoad:		Flit's payload (28)
 *
 * Return:		Flit contents
 */

unsigned int build_flit (int flitType, unsigned int payload) {

	unsigned int flit = 0 | \
			(payload << PAYLOAD_OFFSET) | \
			(flitType << FLIT_TYPE_OFFSET);

	unsigned int parity = parity_check(flit);

	return flit | parity;

}

unsigned int header_decode(unsigned int header, int *packetID, int *srcAddr, int *dstAddr, int *packetLength, int noc_size)
{

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

	}
	else if (*srcAddr > noc_size)
	{
		return HEADER_INVALID_SRC_ADDR;

	}
	else if (*dstAddr > noc_size)
	{
		return HEADER_INVALID_DST_ADDR;

	}
	else if (dstAddr == srcAddr)
	{
		return HEADER_SRC_ADDR_IS_DST_ADDR;

	}
	else if (*packetLength < 2)
	{ //Minimal packet = header + tail
		return HEADER_INVALID_LENGTH;

	}
	else
	{
		return HEADER_OK;
	}

}
