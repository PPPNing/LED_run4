module moore_fsm #(
  parameter s0 = 2'b00,
  parameter s1 = 2'b01,
  parameter s2 = 2'b11,
  parameter s3 = 2'b10
)(
  input clk,
  input reset,
  output reg [3:0] y
);

reg [1:0] cur_state, nex_state;

  always @(posedge clk, negedge reset) begin
    if(!reset)
      cur_state <= s0;
    else
      cur_state <= nex_state;
  end

  always @(*) begin
    case(cur_state)
      s0: begin
        y = 4'b0001;
        nex_state = s1;
      end
      s1: begin
        y = 4'b0010;
        nex_state = s2;
      end
      s2: begin
        y = 4'b0100;
        nex_state = s3;
      end
      s3: begin
        y = 4'b1000;
        nex_state = s0;
      end
      default: begin
        y = 4'b0000;
        nex_state = s0;
      end
    endcase
  end
  
endmodule 