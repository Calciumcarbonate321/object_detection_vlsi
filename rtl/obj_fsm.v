module obj_fsm (
    input wire clk,
    input wire reset,
    input wire L,
    input wire R,
    input wire F,
    output reg left_object,
    output reg right_object,
    output reg front_object
);

// State encoding
localparam IDLE = 2'b00;
localparam LEFT = 2'b01;
localparam RIGHT = 2'b10;
localparam FRONT = 2'b11;

reg [1:0] current_state, next_state;

// State register
always @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

// Next state logic
always @(*) begin
    case (current_state)
        IDLE: begin
            if (L)
                next_state = LEFT;
            else if (R)
                next_state = RIGHT;
            else if (F)
                next_state = FRONT;
            else
                next_state = IDLE;
        end
        LEFT: begin
            if (!L)
                next_state = IDLE;
            else
                next_state = LEFT;
        end
        RIGHT: begin
            if (!R)
                next_state = IDLE;
            else
                next_state = RIGHT;
        end
        FRONT: begin
            if (!F)
                next_state = IDLE;
            else
                next_state = FRONT;
        end
        default: next_state = IDLE;
    endcase
end

// Output logic
always @(*) begin
    left_object = (current_state == LEFT);
    right_object = (current_state == RIGHT);
    front_object = (current_state == FRONT);
end

endmodule