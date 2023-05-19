`timescale 1ns / 1ps

module six_bits_four_inputs_adder(
    input [5:0] a,
    input [5:0] b,
    input [5:0] c,
    input [5:0] d,
    input       cin,
    output[7:0] e,
    output      cout );
    
    wire    [6:0]   sum1, sum2;
    wire    cin2;
    
    assign  cin2 = 1'b0;
    
    six_bits_fast_add   adder_low_1(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum1)
        );
    six_bits_fast_add   adder_low_2(
        .a(c),
        .b(d),
        .cin(cin2),
        .sum(sum2)
        );
    seven_bits_fast_add adder_up(
        .a(sum1),
        .b(sum2),
        .cin(cin2),
        .sum(e),
        .cout(cout)
        );
   
endmodule
