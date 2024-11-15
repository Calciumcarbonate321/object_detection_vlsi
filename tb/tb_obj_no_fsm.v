`timescale 1ns/1ps

module tb_obj_no_fsm;
    // Testbench signals
    reg reset;
    reg front_sensor;
    reg left_sensor;
    reg right_sensor;
    reg back_sensor;
    
    wire front_detected;
    wire left_detected;
    wire right_detected;
    wire back_detected;
    wire front_right_detected;
    wire front_left_detected;
    wire back_right_detected;
    wire back_left_detected;
    
    // Instantiate the module under test
    obj_no_fsm uut (
        .reset(reset),
        .front_sensor(front_sensor),
        .left_sensor(left_sensor),
        .right_sensor(right_sensor),
        .back_sensor(back_sensor),
        .front_detected(front_detected),
        .left_detected(left_detected),
        .right_detected(right_detected),
        .back_detected(back_detected),
        .front_right_detected(front_right_detected),
        .front_left_detected(front_left_detected),
        .back_right_detected(back_right_detected),
        .back_left_detected(back_left_detected)
    );
    
    // Test stimulus
    initial begin
        // Initialize all inputs to 0
        reset = 1;
        front_sensor = 0;
        left_sensor = 0;
        right_sensor = 0;
        back_sensor = 0;
        #10;
        
        // Test 1: Reset condition
        $display("Test 1: Reset condition");
        $display("Outputs: F=%b, L=%b, R=%b, B=%b, FR=%b, FL=%b, BR=%b, BL=%b\n",
                front_detected, left_detected, right_detected, back_detected,
                front_right_detected, front_left_detected, 
                back_right_detected, back_left_detected);
        
        // Remove reset
        reset = 0;
        #10;
        
        // Test 2: Single sensor (Front)
        front_sensor = 1;
        #10;
        $display("Test 2: Front sensor only");
        $display("Inputs: F=%b, L=%b, R=%b, B=%b", 
                front_sensor, left_sensor, right_sensor, back_sensor);
        $display("Outputs: F=%b, L=%b, R=%b, B=%b, FR=%b, FL=%b, BR=%b, BL=%b\n",
                front_detected, left_detected, right_detected, back_detected,
                front_right_detected, front_left_detected, 
                back_right_detected, back_left_detected);
        
        // Test 3: Front-Right combination
        right_sensor = 1;
        #10;
        $display("Test 3: Front-Right combination");
        $display("Inputs: F=%b, L=%b, R=%b, B=%b", 
                front_sensor, left_sensor, right_sensor, back_sensor);
        $display("Outputs: F=%b, L=%b, R=%b, B=%b, FR=%b, FL=%b, BR=%b, BL=%b\n",
                front_detected, left_detected, right_detected, back_detected,
                front_right_detected, front_left_detected, 
                back_right_detected, back_left_detected);
                
        // Test 4: Back-Left combination
        front_sensor = 0;
        right_sensor = 0;
        back_sensor = 1;
        left_sensor = 1;
        #10;
        $display("Test 4: Back-Left combination");
        $display("Inputs: F=%b, L=%b, R=%b, B=%b", 
                front_sensor, left_sensor, right_sensor, back_sensor);
        $display("Outputs: F=%b, L=%b, R=%b, B=%b, FR=%b, FL=%b, BR=%b, BL=%b\n",
                front_detected, left_detected, right_detected, back_detected,
                front_right_detected, front_left_detected, 
                back_right_detected, back_left_detected);
  
    end
    
endmodule
