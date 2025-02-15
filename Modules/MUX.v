`timescale 1ns / 1ps

module model_1(sel, inp, out);
input [3:0]sel; //4-bit select bit to take input between 2 to 9 from the user
input [4:0]inp; //5-bit variable input for which we have to determine divisibility
output reg out; //output 1 or 0 depending on whether the 5-bit input is a multiple of select or not
always @(sel, inp)
begin
case(sel) //to know determine the number in select, hardware implementation may involve using a multiplexer
4'b0010:
out = (inp[0] == 0)?1'b1:1'b0; //multiple of two if LSB is 0 (used conditional operator which is equivalent to if-else for concise coding)
4'b0011:
out = (inp == 5'b00000 || inp==5'b00011 || inp==5'b00110 || inp==5'b01001 || inp==5'b01100 || inp==5'b01111 || inp==5'b10010 || inp==5'b10101 || inp==5'b11000 || inp==5'b11011 || inp==5'b11110)? 1'b1:1'b0;
4'b0100:
out = (inp[0] == 0 && inp[1] == 0)?1'b1:1'b0; //multiple of 4 if LSB and the next bit both are 0
4'b0101:
out = (inp == 5'b00000 || inp==5'b00101 || inp==5'b01010 || inp==5'b01111 || inp==5'b10100 || inp==5'b11001 || inp==5'b11110)?1'b1:1'b0;
4'b0110:
out = (inp == 5'b00000 || inp==5'b00110 || inp==5'b01100 || inp==5'b10010 || inp==5'b11000 || inp==5'b11110)?1'b1:1'b0;
4'b0111:
out = (inp == 5'b00000 || inp==5'b00111 || inp==5'b01110 || inp==5'b10101 || inp==5'b11100)?1'b1:1'b0;
4'b1000:
out = (inp[0] == 0 && inp[1] == 0 && inp[2] == 0)?1'b1:1'b0; //multiple of 8 if LSB and the consecutive 2 bits are also 0
4'b1001:
out = (inp == 5'b00000 || inp==5'b01001 || inp==5'b10010 || inp==5'b11011)?1'b1:1'b0;
endcase
end
endmodule
