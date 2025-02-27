`default_nettype none

module tt_um_ciro #( parameter MAX_COUNT = 24'd10_000_000 ) ( 
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  
  // Invertir reset
  wire rst;
  assign rst = ~rst_n;
    
  // Configurar bidireccional como salidas
  assign uio_oe = 8'b11111111;
  
  // Mandar todos los leds a cero
  assign uo_out[7:0] = 8'b00000000;
  
  // Instanciacion de modulo
  top mod_top ( 
    .clk_i(clk),
    .rst_i(rst),
    .up_i(ui_in[0]),
    .cnt_o(uio_out[4:0]),
    .time_o(uio_out[5]),
    .max_o(uio_out[6]),
    .min_o(uio_out[7])
);
  
endmodule