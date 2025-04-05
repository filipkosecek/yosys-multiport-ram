/*
 * Dve citania a dva zapisy nezvladne, dve citania a jeden zapis uz ano
 */

module bram (
	input clk,
	input [4:0] addr1, addr2, addr3, addr4,
	input wstrobe,
	input [(REG_SIZE - 1):0] wdata1,
	output reg [(REG_SIZE - 1):0] rdata1, rdata2, rdata3, rdata4
);

parameter REG_SIZE = 32;

(* no_rw_check *)
reg [(REG_SIZE - 1):0] mem [31:0];

always @ (posedge clk) begin
	if (wstrobe)
		mem[addr1] <= wdata1;
end

always @ (posedge clk) begin
	rdata1 <= mem[addr1];
	rdata2 <= mem[addr2];
	rdata3 <= mem[addr3];
	rdata4 <= mem[addr4];
end

initial begin
	$readmemh("mem.hex", mem, 0, 31);
end

endmodule
