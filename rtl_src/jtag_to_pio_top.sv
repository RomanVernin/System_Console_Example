module jtag_to_pio_top #(
parameter PIO_WIDTH = 8
)
(
(*chip_pin = "r8" *) input clk_i,
(*chip_pin = "e1" *) input rstn_i,

(*chip_pin = "L3, B1, F3, D1, A11, B13, A13, A15" *) output[PIO_WIDTH-1:0] pio_o 

);


  //rst_sync
  logic rstn_sync;
  vr_synchronizer_arst #(
    .WIDTH   (1),
    .DEPTH   (2),
    .INIT_VAL(1'b0)
  ) 
  u_rst_sync (
    .dst_clk(clk_i     ),
    .rstn   (rstn_i    ),
    .din    ('1        ),
    .dout   (rstn_sync )
  );

  
	jtag_to_pio_pd u0 (
		.clk_i_clk       (clk_i     ), //   clk_i.clk
		.pio_o_export    (pio_o     ), //   pio_o.export
		.reset_i_reset_n (rstn_sync )  // reset_i.reset_n
	);



endmodule