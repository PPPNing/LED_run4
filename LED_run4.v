module LED_run4(
  input CLK,
  input RST,
  output [3:0] LED
);

wire clk;

  devide_1Hz u1(
    .clk(CLK),
    .clkout(clk)
  );
  
  moore_fsm u2(
    .clk(clk),
    .reset(RST),
    .y(LED)
  );
  
endmodule 