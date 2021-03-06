module upcountto9(Reset, Clock, Enable, Salida, carry);

    input Reset, Clock, Enable;
    output reg [3:0] Salida;
    output reg carry;

    initial
    begin
        Salida <= 4'b0000;
        carry <= 0;
    end 

    always @(posedge Reset or posedge Clock) 
        if(Reset)
            Salida <= 4'b0000; //Si Reset es 1 pongo un 0 en binario de 4 bits
            else if (Enable && Salida < 4'b1001) //Si no llegue al 9, sigo contando
                begin
					Salida <= Salida + 1;
					carry<=0;
                end
					else if (Enable && (Salida == 4'b1001)) //Si llegue al 9, reinicio
                    begin 
						    Salida <= 4'b0000;
							carry<=1;
							end
endmodule