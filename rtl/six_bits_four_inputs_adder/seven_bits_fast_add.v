module seven_bits_fast_add(
  input  [6:0]a,b,    
  input       cin,   
  output [7:0]sum,  
  output	 cout 
);
  wire	 [6:0]  g,p;   
  wire   [7:0]  c;    
  assign  p = a | b; 
  assign  g = a & b;
  assign  c[0] = cin; 
  assign  c[1] = g[0]|(p[0]&c[0]);
  assign  c[2] = g[1]|(p[1]&(g[0]|(p[0]&c[0])));
  assign  c[3] = g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))));
  assign  c[4] = g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))));
  assign  c[5] = g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))));
  assign  c[6] = g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))));
  assign  c[7] = g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))));
  assign  sum[6:0] =a ^b^ c[6:0];  
  assign  cout = c[7];  
  assign  sum[7]=c[7];
endmodule