module top_module ( input a, input b, output out );
    wire wa, wb, wc; // Define wires for connections

    // Connect by position
    mod_a instance1 ( wa, wb, wc );

    // Connect by name
    mod_a instance2 ( .out(wc), .in1(wa), .in2(wb) );

    // Connect top-level ports to wires
    assign wa = a;
    assign wb = b;
    assign out = wc;
endmodule
