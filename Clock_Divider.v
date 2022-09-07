module ClkDiv #(
parameter div_ratio_width = 5
) (
input wire                               i_ref_clk,
input wire                               i_rst_n,
input wire                               i_clk_en,
input wire  [div_ratio_width-1:0]        i_div_ratio,
output reg                               o_div_clk            
);





endmodule