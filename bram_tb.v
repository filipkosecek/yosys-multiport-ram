module bram_tb;

localparam REG_SIZE = 32;
reg clk;
reg [4:0] addr1, addr2, addr3, addr4;
wire [(REG_SIZE - 1):0] rdata1, rdata2, rdata3, rdata4;
reg [(REG_SIZE - 1):0] wdata;
reg wstrobe;

bram #(
	.REG_SIZE(REG_SIZE)
) ram (
	.clk(clk),
	.addr1(addr1),
	.addr2(addr2),
	.addr3(addr3),
	.addr4(addr4),
	.wstrobe(wstrobe),
	.wdata1(wdata),
	.rdata1(rdata1),
	.rdata2(rdata2),
	.rdata3(rdata3),
	.rdata4(rdata4)
);

initial begin
	clk <= 0;
	addr1 <= 0;
	addr2 <= 1;
	addr3 <= 2;
	addr4 <= 3;
	#10000
	$finish;
end

initial begin
	$dumpfile("tmp.vcd");
	$dumpvars(0, bram_tb);
end

always begin
	#50
	clk <= ~clk;
end

always @ (posedge clk) begin
	addr1 <= addr2;
	addr2 <= addr3;
	addr3 <= addr4;
	addr4 <= addr4 + 1;
end

endmodule
