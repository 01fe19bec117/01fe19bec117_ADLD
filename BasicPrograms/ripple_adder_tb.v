module ripple_adder_tb();
reg [3:0]a,b;
wire [3:0]sum;
wire cout;
ripple_adder DUT(.sum(sum),.cout(cout),.a(a),.b(b));
initial begin
$monitor("a=%b b=%b sum=%b cout=%b",a,b,sum,cout);
a=4'b0000;b=4'b0000;
#10 a=4'b0001;b=4'b0110;
#10 a=4'b1111;b=4'b11018'h;
#10 a=4'b0011;b=4'b0111;
#10;
end
endmodule

module ripple_adder(sum,cout,a,b);
input [3:0]a,b;
output [3:0]sum;
output cout;
wire w1,w2,w3;
fadder u1(sum[0],w1,a[0],b[0],1'b0);
fadder u2(sum[1],w2,a[1],b[1],w1);
fadder u3(sum[2],w3,a[2],b[2],w2);
fadder u4(sum[3],cout,a[3],b[3],w3);
endmodule
