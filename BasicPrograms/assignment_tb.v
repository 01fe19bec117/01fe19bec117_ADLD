module assignment_tb();
reg  a,b,c,d;
assignment DUT(.a(a),.b(b),.c(c),.d(d));
initial begin
$monitor("a=%b b=%b c=%b d=%b",a,b,c,d);
end
endmodule

module assignment(a,b,c,d);
input a,b,c,d;
initial begin
a=8'h4;
b=8'h6;
c=8'h3;
d=8'h5;
$display("a=0x%0h b=0x%0h c=0x%0h d=0x%0h",a,b,c,d);
end
endmodule

