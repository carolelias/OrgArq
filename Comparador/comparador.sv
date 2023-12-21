module Comparador4Bits (
    input [3:0] A,
    input [3:0] B,
    output iguais,
    output maior,
    output menor
);

    wire [3:0] vetorIgual;
    wire [3:0] vetorMaior;

    // Implementação das comparações bit a bit
    assign vetorIgual = ~(A ^ B);
    assign vetorMaior = A & ~B;

    assign iguais = (vetorIgual[3] & vetorIgual[2] & vetorIgual[1] & vetorIgual[0]);

    // Verifica se A é maior que B
    assign maior = vetorMaior[3] | (vetorMaior[2] & vetorIgual[3]) | (vetorMaior[1] & vetorIgual[3] & vetorIgual[2]) | (vetorMaior[0] & vetorIgual[3] & vetorIgual[2] & vetorIgual[1]);

    // Verifica se A é menor que B
    assign menor = ~(iguais | maior);
  
endmodule