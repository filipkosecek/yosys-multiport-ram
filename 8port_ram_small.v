/*
 * 8-read-port RAM
 */

module ram (
	input clk,
	input [4:0] addr1, addr2, addr3, addr4, addr5, addr6, addr7, addr8,
	input wstrobe,
	input rstrobe,
	input [$clog2(RAM_SIZE) - 1:0] wdata,
	output reg [WORD_SIZE - 1:0] rdata1, rdata2, rdata3, rdata4, rdata5, rdata6, rdata7, rdata8
);

localparam RAM_SIZE = 64;
localparam WORD_SIZE = 8;

(* no_rw_check *)
reg [WORD_SIZE - 1:0] mem [RAM_SIZE - 1:0];

always @ (posedge clk) begin
	if (wstrobe)
		mem[addr1] <= wdata;
	else if (rstrobe) begin
		rdata1 <= mem[addr1];
		rdata2 <= mem[addr2];
		rdata3 <= mem[addr3];
		rdata4 <= mem[addr4];
		rdata5 <= mem[addr5];
		rdata6 <= mem[addr6];
		rdata7 <= mem[addr7];
		rdata8 <= mem[addr8];
	end
end

endmodule
