module Divisor4Bits (
    input [3:0] dividend, // Entrada do dividendo de 4 bits
    input [3:0] divisor,  // Entrada do divisor de 4 bits
    output Q0,            // Saída do bit 0 do quociente
    output Q1,            // Saída do bit 1 do quociente
    output Q2,            // Saída do bit 2 do quociente
    output Q3             // Saída do bit 3 do quociente
);

    reg [3:0] dividend_reg; // Registrador para armazenar o dividendo
    reg [3:0] quotient_reg; // Registrador para armazenar o quociente
    reg [3:0] remainder;    // Registrador para armazenar o resto
    integer i;              // Variável para controle do loop

    always @(*) begin
        // Inicializa os registradores
        dividend_reg = dividend;
        quotient_reg = 4'b0000;
        remainder = 4'b0000;

        // Lógica de divisão
        for (i = 0; i < 4; i = i + 1) begin
            remainder = {remainder[2:0], dividend_reg[3]}; // Desloca o resto para a esquerda e adiciona o próximo bit do dividendo
            quotient_reg = {quotient_reg[2:0], ~((remainder >= divisor) ? 1'b0 : 1'b1)}; // Desloca o quociente para a esquerda e adiciona o bit calculado

            if (remainder >= divisor) begin
                remainder = remainder - divisor; // Subtrai o divisor do resto se for possível
            end

            dividend_reg = {dividend_reg[2:0], 1'b0}; // Desloca o dividendo para a esquerda
        end
    end

    // Saídas individuais para cada bit do quociente
    assign Q0 = quotient_reg[0];
    assign Q1 = quotient_reg[1];
    assign Q2 = quotient_reg[2];
    assign Q3 = quotient_reg[3];

endmodule