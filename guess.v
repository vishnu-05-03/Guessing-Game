`timescale 1ns/1ns
module guess_game (clk,reset,G,wrong,LED);

// This is input terminal for making guesses. The pattern dozesn't proceed until the all the guess keys are low.
input [9:0] G;

// This output shows the led pattern which shifts by one bit to right while the all input pins are negated.
output [9:0] LED;
reg [9:0] LED;

// This output is asserted whenever the wrong guess is made.
output wrong;
reg wrong;

// clock pulse.
input clk;

// the pattern starts from first when this input is asserted.
input reset;

reg [10:0]state;
reg [10:0]nxtstate;

// state assignment.
parameter s1= 11'b00000000010 , s2 = 11'b00000000100, s3 = 11'b00000001000, s4 = 11'b00000010000, sok = 11'b00000000000, serr = 11'b00000000001 ,s5= 11'b00000100000 , s6 = 11'b00001000000, s7 = 11'b00010000000, s8 = 11'b00100000000, s9 = 11'b01000000000, s10 = 11'b10000000000 ;

always@(posedge clk or posedge reset) begin
    if(reset) begin
        state<=s1;
    end
    else begin 
        state <= nxtstate;
    end
end

always @(G or state) begin
    case(state)
        s1: begin
            LED <= state[10:1];
            if ( G == 10'b0000000000 ) nxtstate <= s2 ;
            else if (G==state[10:1]) nxtstate <= sok ;
            else nxtstate <= serr;
        end
        s2: begin
            LED <= state[10:1];
            if ( G == 10'b0000000000 ) nxtstate <= s3 ; 
            else if (G==state[10:1]) nxtstate <= sok;
            else nxtstate <= serr ;
        end
        s3: begin
            LED <= state[10:1];
            if ( G == 10'b0000000000 ) nxtstate <= s4 ;
            else if (G==state[10:1]) nxtstate <= sok;
            else nxtstate <= serr ;
        end
        s4: begin
            LED <= state[10:1];
            if ( G == 10'b0000000000 ) nxtstate <= s5 ;
            else if (G==state[10:1]) nxtstate <= sok;
            else nxtstate <= serr ;
        end
        s5: begin
            LED <= state[10:1];
            if ( G == 10'b0000000000 ) nxtstate <= s6 ;
            else if (G==state[10:1]) nxtstate <= sok;
            else nxtstate <= serr ;
        end
        s6: begin
            LED <= state[10:1];
            if ( G == 10'b0000000000 ) nxtstate <= s7 ;
            else if (G==state[10:1]) nxtstate <= sok;
            else nxtstate <= serr ;
        end
        s7: begin
            LED <= state[10:1];
            if ( G == 10'b0000000000 ) nxtstate <= s8 ;
            else if (G==state[10:1]) nxtstate <= sok;
            else nxtstate <= serr ;
        end
        s8: begin
            LED <= state[10:1];
            if ( G == 10'b0000000000 ) nxtstate <= s9 ;
            else if (G==state[10:1]) nxtstate <= sok;
            else nxtstate <= serr ;
        end
        s9: begin
            LED <= state[10:1];
            if ( G == 10'b0000000000 ) nxtstate <= s10 ;
            else if (G==state[10:1]) nxtstate <= sok;
            else nxtstate <= serr ;
        end
        s10: begin
            LED <= state[10:1];
            if ( G == 10'b0000000000 ) nxtstate <= s1 ;
            else if (G==state[10:1]) nxtstate <= sok;
            else nxtstate <= serr ;
        end
        sok: begin
            if ( G == 10'b0000000000 ) nxtstate <= s1 ;
            else nxtstate <= sok;
        end
        serr: begin 
            if ( G == 10'b0000000000 ) nxtstate <= s1 ;
            else nxtstate <= serr;
        end
    endcase

    wrong <= state[0] ;

end
    
endmodule