module obj_top_module (
    input wire clk,
    input wire reset,
    input wire L,
    input wire R,
    input wire F,
    output wire left_object_detected,
    output wire right_object_detected,
    output wire front_object_detected
);

obj_fsm dut (
    .clk(clk),
    .reset(reset),
    .L(L),
    .R(R),
    .F(F),
    .left_object(left_object_detected),
    .right_object(right_object_detected),
    .front_object(front_object_detected)
);

endmodule