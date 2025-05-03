// generic n-port RAM implementation

`ifndef N_PORTS
`define N_PORTS 4
`endif

`ifndef RAM_SIZE
`define RAM_SIZE 32
`endif

`ifndef WORD_SIZE
`define WORD_SIZE 32
`endif

module ram (
	input clk,
	input [ADDR_SIZE * `N_PORTS - 1:0] addr,
	input wstrobe,
	input rstrobe,
	input [`WORD_SIZE - 1:0] wdata,
	output reg [`WORD_SIZE * `N_PORTS - 1:0] rdata
);

localparam ADDR_SIZE = $clog2(`RAM_SIZE);

(* no_rw_check *)
(* ram_style = "block" *)
reg [`WORD_SIZE - 1:0] mem [`RAM_SIZE - 1:0];

integer i;
always @ (posedge clk) begin
	if (wstrobe)
		mem[addr[ADDR_SIZE - 1:0]] <= wdata;
	if (rstrobe) begin
		for (i = 0; i < `N_PORTS; i = i + 1) begin
			rdata[i * `WORD_SIZE +: `WORD_SIZE] <= mem[addr[((i+1) * ADDR_SIZE):(i * ADDR_SIZE)]];
		end
	end
end

endmodule
