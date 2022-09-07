module ClkDiv #(
parameter div_ratio_width = 5
) (
input wire                               i_ref_clk,
input wire                               i_rst_n,
input wire                               i_clk_en,
input wire  [div_ratio_width-1:0]        i_div_ratio,
output reg                               o_div_clk            
);

reg  [div_ratio_width-2:0]   Count ;
wire [div_ratio_width-2:0]   edge_high ;  
wire [div_ratio_width-2:0]   edge_low ;                                                                        



always @(posedge i_ref_clk or negedge i_rst_n ) 
begin
    if (!i_rst_n) begin
        Count <= 0;
	    o_div_clk <= 0;	
    end else if (i_clk_en & (i_div_ratio != 'd0) & (i_div_ratio != 'd1)) begin
        case (i_div_ratio[0])
            1'b0:begin           // even div_ratio
                if (Count == (i_div_ratio>>1)) begin
                    Count <= 0;                                        
                    o_div_clk <= ~ o_div_clk;                               
                end else begin
                    Count <= Count + 1'd1;
                end 
            end


            1'b1:begin          // odd div_ratio
                if (Count == (i_div_ratio>>1)) begin
                    Count <= 0;                                        
                    o_div_clk <= ~ o_div_clk;                               
                end else begin
                    Count <= Count + 1'd1;
                end 
            end
        endcase
end   

assign o_div_clk = !(i_clk_en & (i_div_ratio != 'd0) & (i_div_ratio != 'd1)) ? 

endmodule