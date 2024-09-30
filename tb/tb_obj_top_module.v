module tb_obj_top_module;

    // Inputs
    reg clk;
    reg reset;
    reg L;
    reg R;
    reg F;

    // Outputs
    wire left_object_detected;
    wire right_object_detected;
    wire front_object_detected;

    // Instantiate the Unit Under Test (UUT)
    obj_top_module uut (
        .clk(clk),
        .reset(reset),
        .L(L),
        .R(R),
        .F(F),
        .left_object_detected(left_object_detected),
        .right_object_detected(right_object_detected),
        .front_object_detected(front_object_detected)
    );

    // Clock generation
    always #5 clk = ~clk;  // 100MHz clock

    // Test stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        L = 0;
        R = 0;
        F = 0;

        // Wait for global reset
        #100;
        reset = 0;
        #20;

        // Test case 1: No object
        #10 {L, R, F} = 3'b000;
        #20;

        // Test case 2: Left object
        #10 {L, R, F} = 3'b100;
        #20;

        // Test case 3: Right object
        #10 {L, R, F} = 3'b010;
        #20;

        // Test case 4: Front object
        #10 {L, R, F} = 3'b001;
        #20;

        // Test case 5: Left and Right objects
        #10 {L, R, F} = 3'b110;
        #20;

        // Test case 6: Left and Front objects
        #10 {L, R, F} = 3'b101;
        #20;

        // Test case 7: Right and Front objects
        #10 {L, R, F} = 3'b011;
        #20;

        // Test case 8: All objects
        #10 {L, R, F} = 3'b111;
        #20;

        // Test case 9: Return to no object
        #10 {L, R, F} = 3'b000;
        #20;

        // End simulation
  
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t, Reset=%b, L=%b, R=%b, F=%b, Left_Det=%b, Right_Det=%b, Front_Det=%b",
                 $time, reset, L, R, F, left_object_detected, right_object_detected, front_object_detected);
    end

endmodule