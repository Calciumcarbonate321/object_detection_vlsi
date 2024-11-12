module obj_top_module(
    input wire reset,             
    input wire front_sensor,      
    input wire left_sensor,       
    input wire right_sensor,      
    input wire back_sensor,      
    output reg front_detected,   
    output reg left_detected,    
    output reg right_detected,   
    output reg back_detected,     
    output reg front_right_detected, 
    output reg front_left_detected,  
    output reg back_right_detected,  
    output reg back_left_detected   
);

    always @(*) begin
        
        if (reset) begin
            front_detected = 0;
            left_detected = 0;
            right_detected = 0;
            back_detected = 0;
            front_right_detected = 0;
            front_left_detected = 0;
            back_right_detected = 0;
            back_left_detected = 0;
        end 
        else begin
            front_detected = front_sensor && !left_sensor && !right_sensor && !back_sensor;
            left_detected = !front_sensor && left_sensor && !right_sensor && !back_sensor;
            right_detected = !front_sensor && !left_sensor && right_sensor && !back_sensor;
            back_detected = !front_sensor && !left_sensor && !right_sensor && back_sensor;
            front_right_detected = front_sensor && right_sensor && !left_sensor && !back_sensor;
            front_left_detected = front_sensor && left_sensor && !right_sensor && !back_sensor;
            back_right_detected = back_sensor && right_sensor && !left_sensor && !front_sensor;
            back_left_detected = back_sensor && left_sensor && !right_sensor && !front_sensor;
        end
    end
endmodule