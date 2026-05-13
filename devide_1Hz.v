module devide_1Hz(
  input clk,
  output clkout
);

reg [18:0] count;
reg clktemp;

  always @(posedge clk) begin
    if(count == 19'd499999)
      count <= 19'd0;
    else
      count <= count + 1'd1;
  end
  
  always @(posedge clk) begin
    if(count == 19'd499999)
      clktemp <= ~clktemp;
    else
      clktemp <= clktemp;
  end

  assign clkout = clktemp;

endmodule 