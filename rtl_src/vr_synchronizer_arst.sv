module vr_synchronizer_arst #(
    parameter     WIDTH    = 1   ,
    parameter     DEPTH    = 2   ,
    parameter bit INIT_VAL = 1'b0
  ) (
    input                   dst_clk,
    input                   rstn   ,
    input       [WIDTH-1:0] din    ,
    output wire [WIDTH-1:0] dout
  );

  logic [WIDTH-1:0] cdcr[DEPTH-1:0];
  int               i              ;

  assign dout = cdcr[DEPTH-1];

  always_ff @(posedge dst_clk or negedge rstn) begin
    if (!rstn) begin
      for (i = 0; i < DEPTH; i = i + 1) begin
        cdcr[i] <= '{WIDTH{INIT_VAL}};
      end
    end
    else begin
      for (i = 1; i < DEPTH; i = i + 1) begin
        cdcr[i] <= cdcr[i-1];
      end

      cdcr[0] <= din;
    end
  end

endmodule
