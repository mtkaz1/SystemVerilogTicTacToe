module board_registers(input logic clk, input logic reset, input logic w_e,
                        input logic [3:0] position, input logic [1:0] player_value,
                        output logic [17:0] board_state);



                        always_ff @(posedge clk)
                            begin
                                if(reset)
                                    board_state <= 18'b0;
                                else if(w_e)
                                    begin
                                        case(position)
                                            4'b0000: board_state[1:0] <= player_value; //block 1 on the board
                                            4'b0001: board_state[3:2] <= player_value; //block 2 on the board
                                            4'b0010: board_state[5:4] <= player_value; //block 3 on the board
                                            4'b0011: board_state[7:6] <= player_value; //block4 on the board
                                            4'b0100: board_state[9:8] <= player_value; //block 5 on the board
                                            4'b0101: board_state[11:10] <= player_value; //block 6 on the board
                                            4'b0110: board_state[13:12] <= player_value; //block 7 on the board
                                            4'b0111: board_state[15:14] <= player_value; //block 8 on the board
                                            4'b1000: board_state[17:16] <= player_value; //block 9 on the board
                                            default: board_state <= board_state; //If w_e is high but position isn't valid, we just keep the board_state as it was.
                                        endcase
                                    end
endmodule
                                        