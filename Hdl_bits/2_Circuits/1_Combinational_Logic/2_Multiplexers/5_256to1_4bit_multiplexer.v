module top_module(
    input   [1023:0]  in,
    input   [   7:0] sel,
    output  [   3:0] out
);



// assign out=in[sel*4+3:sel*4];
// Vector indices can be variable,
//  as long as the synthesizer can figure out
//   that the width of the bits being selected 
//   is constant.   It's not always good at this. 
//   An error saying "... is not a constant" means 
// it couldn't prove that the select width is constant. In particular, 
// in[ sel*4+3 : sel*4 ] does not work.



// assign out=in[sel*4+3 -:4];
assign out={in[sel*4+3],in[sel*4+2],in[sel*4+1],in[sel*4+0]};

endmodule