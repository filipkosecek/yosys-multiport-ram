/*
 * single-port RAM
 */

module ram (
	input clk,
	input [4:0] addr,
	input wstrobe,
	input rstrobe,
	input [$clog2(RAM_SIZE) - 1:0] wdata,
	output reg [WORD_SIZE - 1:0] rdata
);

localparam RAM_SIZE = 32;
localparam WORD_SIZE = 8;

(* no_rw_check *)
reg [WORD_SIZE - 1:0] mem [RAM_SIZE - 1:0];

always @ (posedge clk) begin
	if (wstrobe)
		mem[addr] <= wdata;
	else if (rstrobe) begin
		rdata <= mem[addr];
	end
end

endmodule
