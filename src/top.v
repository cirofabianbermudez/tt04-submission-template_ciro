// Author: Ciro Fabian Bermudez Marquez
// Name: .v
//
// Description:

module top ( 
  input        clk_i,
  input        rst_i,
  input        up_i,
  output [4:0] cnt_o,
  output       time_o,
  output       max_o,
  output       min_o
);
  
  wire en;
  
  clk_div #(.Width(26), .MaxVal(50_000_000)) mod_clk_div (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .max_tick_o(en)
  );
  
  ff_toggle mod_ff_toggle (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .en_i(en),
    .q_o(time_o)
  );
  
  counter #(.Width(5)) mod_counter (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .en_i(en),
    .up_i(up_i),
    .cnt_o(cnt_o),
    .max_tick_o(max_o),
    .min_tick_o(min_o)
  );

endmodule