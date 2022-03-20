module fadder(s,ca,a,b,c);
input a,b,c;
output s,ca;
assign s=a^b^c;
assign ca=(a&b)|(b&c)|(c&a);
endmodule 
