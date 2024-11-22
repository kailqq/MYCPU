module ALU (
    input  [31:0] A,                
    input  [31:0] B,                
    input  [3:0]  ALU_operation,    
    output reg [31:0] res,          
    output zero                     
);

// zero信号在结果为0时为高电平
assign zero = (res == 32'd0) ? 1'b1 : 1'b0;

always @(*) begin
    case (ALU_operation)
        4'd0: res = A + B;           // ADD 操作
        4'd1: res = A - B;           // SUB 操作
        4'd2: res = A << B[4:0];     // SLL 操作，逻辑左移
        4'd3: res = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0; // SLT 操作，有符号比较
        4'd4: res = (A < B) ? 32'd1 : 32'd0;  // SLTU 操作，无符号比较
        4'd5: res = A ^ B;            // XOR 操作
        4'd6: res = A >> B[4:0];      // SRL 操作，逻辑右移
        4'd7: res = $signed(A) >>> B[4:0]; // SRA 操作，算术右移
        4'd8: res = A | B;            // OR 操作
        4'd9: res = A & B;            // AND 操作
        default: res = 32'dx;         // 默认输出x
    endcase
end

endmodule

