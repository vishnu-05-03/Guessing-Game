`include "guess.v"
`timescale 1ns/1ns

module guess_game_tb;
    reg [9:0] G;
    reg clk;
    reg reset;
    wire [9:0] LED;
    wire wrong;

    guess_game dut(clk,reset,G,wrong,LED);

    initial begin
    $dumpfile("guess_game.vcd");
    $dumpvars();
    end

    initial begin 
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset=1;
        G = 10'b0000000000;
        #1 reset=0;
        #90 G = 10'b1000000000;
        #10 G = 10'b0000000000;
        #10 G = 10'b0000000001;
        #10 G = 10'b0000000000;
        #10 G = 10'b0000000010;
        #10 G = 10'b0000000000;
        #10 G = 10'b0000000000;
        #10 G = 10'b0000000010;
        #10 $finish;
    end
endmodule