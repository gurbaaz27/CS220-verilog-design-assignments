`define TICK #2 
module registerfile(clk,read_adr1 ,read_adr2, write_adr ,data , valid ,read1 , read2 );

    input clk;
    input [4:0]read_adr1;
    input [4:0]read_adr2;
    input [4:0]write_adr;
    input [15:0]data;
    input valid;

    reg [15:0] regfile [31:0];
    output [15:0] read1;
    output [15:0] read2;
    wire [15:0] read1;
    wire [15:0] read2;
    reg [5:0] i;
    initial begin
          for (i = 0; i < 32; i = i + 1) begin
            regfile [i] = 0; 
          end 
          for (i = 0; i < 32; i = i + 1) begin
             $display("val=%d",regfile[i]);
          end 
          
    end

    assign read1 =  regfile[read_adr1]  ;
    assign read2 =  regfile[read_adr2]  ;

    always @(posedge clk) begin
       // $display("read1=%d , read2=%d",regfile[read_adr1], regfile[read_adr2]);
        if(valid == 1'b1) begin
            regfile[write_adr] <= `TICK data;
        end
    end


endmodule