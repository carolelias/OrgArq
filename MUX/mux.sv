module Mux(
    input A,	  // Entradas de dados
  	input B,
  	input C,
  	input D,
    input S0,     // Entradas de seleção
  	input S1,
    output y          // Saída do MUX
);
  		wire Ay = A & ~S1 & ~S0;
  		wire By = B & ~S1 & S0;
    	wire Cy = C & S1 & ~S0;
    	wire Dy = D & S1 & S0;

    	assign y = Ay | By | Cy | Dy;

endmodule
