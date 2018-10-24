`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 12:22:06 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(reset, input1, input2, sign, exp, frac, sign_out, exp_out, frac_out);
    input           reset;
    input           input1, input2;
    input           sign;
    input   [3:0]   exp;
    input   [7:0]   frac;
    output          sign_out;
    output  [3:0]   exp_out;
    output  [7:0]   frac_out;
    //input       [3:0] a;
    //input       [3:0] b;
    //output      [3:0] sum;
    
    reg sign1, sign2;
    reg [3:0] exp1, exp2;
    reg [7:0] frac1, frac2;
//  sign_mag_add                (a, b, sum);
    //sign_mag_add    sma         (a, b, sum);
    
    always@(posedge input1, posedge reset)
    begin
        if(reset)
        begin
            sign1 <= 0;
            exp1 <= 0;
            frac1 <= 0;
        end
        
        else
        begin
            sign1 = sign;
            exp1 = exp;
            frac1 = frac;
        end
    end
    
    always@(posedge input2, posedge reset)
    begin
        if(reset)
        begin
            sign2 <= 0;
            exp2 <= 0;
            frac2 <= 0;
        end
        
        else
        begin
            sign2 = sign;
            exp2 = exp;
            frac2 = frac;
        end
    end
    
//  fp_adder                    (sign1, sign2, exp1, exp2, frac1, frac2, sign_out, exp_out, frac_out);
    fp_adder        fpa         (sign1, sign2, exp1, exp2, frac1, frac2, sign_out, exp_out, frac_out);

endmodule
