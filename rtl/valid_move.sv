module valid_move( input logic [3:0] position,
                    input logic [17:0] board_state,
                    output logic valid);
                


                    always_comb
                        begin
                            case(position)
                                4'b0000: valid = (board_state[1:0] == 2'b00) ? 1'b1 : 1'b0; //block 1 on the board
                                4'b0001: valid = (board_state[3:2] == 2'b00) ? 1'b1 : 1'b0; //block 2 on the board
                                4'b0010: valid = (board_state[5:4] == 2'b00) ? 1'b1 : 1'b0; //block 3 on the board
                                4'b0011: valid = (board_state[7:6] == 2'b00) ? 1'b1 : 1'b0; //block4 on the board
                                4'b0100: valid = (board_state[9:8] == 2'b00) ? 1'b1 : 1'b0; //block 5 on the board
                                4'b0101: valid = (board_state[11:10] == 2'b00) ? 1'b1 : 1'b0; //block 6 on the board
                                4'b0110: valid = (board_state[13:12] == 2'b00) ? 1'b1 : 1'b0; //block 7 on the board
                                4'b0111: valid = (board_state[15:14] == 2'b00) ? 1'b1 : 1'b0; //block 8 on the board
                                4'b1000: valid = (board_state[17:16] == 2'b00) ? 1'b1 : 1'b0; //block 9 on the board
                                default: valid = 'bx; //If position isn't valid, we treat it as a floating
                                