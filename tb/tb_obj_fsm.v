module tb_obj_fsm;

    // Inputs
    reg clk;
    reg reset;
    reg L;
    reg R;
    reg F;

    // Outputs
    wire left_object;
    wire right_object;
    wire front_object;

    // Instantiate the Unit Under Test (UUT)
    obj_fsm uut (
        .clk(clk),
        .reset(reset),
        .L(L),
        .R(R),
        .F(F),
        .left_object(left_object),
        .right_object(right_object),
        .front_object(front_object)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100MHz clock
    end

    // Test scenario
    initial begin
        // Initialize inputs
        reset = 1;
        L = 0;
        R = 0;
        F = 0;

        // Wait for global reset
        #100;
        reset = 0;

        // Test case 1: Left object detected
        #10 L = 1;
        #20 L = 0;

        // Test case 2: Right object detected
        #10 R = 1;
        #20 R = 0;

        // Test case 3: Front object detected
        #10 F = 1;
        #20 F = 0;

        // Test case 4: Multiple objects detected simultaneously
        #10 L = 1; R = 1; F = 1;
        #20 L = 0; R = 0; F = 0;

        // Test case 5: Objects detected in sequence
        #10 L = 1;
        #20 L = 0; R = 1;
        #20 R = 0; F = 1;
        #20 F = 0;

        // Test case 6: Reset during object detection
        #10 L = 1;
        #10 reset = 1;
        #10 reset = 0;
        #10 L = 0;

        // End simulation
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t, Reset=%b, L=%b, R=%b, F=%b, Left_Obj=%b, Right_Obj=%b, Front_Obj=%b",
                 $time, reset, L, R, F, left_object, right_object, front_object);
    end

endmodule