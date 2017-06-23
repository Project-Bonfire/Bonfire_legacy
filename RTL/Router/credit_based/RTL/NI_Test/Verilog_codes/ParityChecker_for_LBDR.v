// Copyright (C) 2016 Siavoosh Payandeh Azad

module parity_checker_for_LBDR (
								RX,
								empty,

								faulty
							   );

parameter DATA_WIDTH = 32;

input [DATA_WIDTH-1 : 0] RX;
input empty;

output reg faulty;

reg xor_all;
wire [DATA_WIDTH-2 : 0] xor_reduce_RX = RX[DATA_WIDTH-1 : 1]; // XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));

always @* begin
	if (empty == 0)
		xor_all <= ^xor_reduce_RX; // XOR_REDUCE(RX(DATA_WIDTH-1 downto 1));
	else
		xor_all <= 0;
end

always @* begin
	faulty <= 0;
	if (xor_all != RX[0])
		faulty <= 1;
end

endmodule // parity_checker_for_LBDR