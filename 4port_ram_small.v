// 4-read-port RAM

module ram (
	input clk,
	input [4:0] addr1, addr2, addr3, addr4,
	input wstrobe,
	input rstrobe,
	input [$clog2(RAM_SIZE) - 1:0] wdata,
	output reg [WORD_SIZE - 1:0] rdata1, rdata2, rdata3, rdata4
);

localparam RAM_SIZE = 32;
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
	end
end

endmodule
