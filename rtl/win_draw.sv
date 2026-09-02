module win_draw(input [17:0] board_state, 
                output logic win, output logic draw);


    always_comb
        begin
            // there are 8 ways to win on a 3x3 tic tac toe board , 3 horizontal, 3 vertical and 2 diagonal

            //player one win conditions
            win = (board_state[1:0] == 2'b01 && board_state[3:2] == 2'b01 && board_state[5:4] == 2'b01) || //horizontal win for p1
                  (board_state[7:6] == 2'b01 && board_state[9:8] == 2'b01 && board_state[11:10] == 2'b01) || //row 2 horizontal win for p1
                  (board_state[13:12] == 2'b01 && board_state[15:14] == 2'b01 && board_state[17:16] == 2'b01) || //row 3 horizontal win for p1
                  (board_state[1:0] == 2'b01 && board_state[7:6] == 2'b01 && board_state[13:12] == 2'b01) || //column 1 vertical win for p1
                  (board_state[3:2] == 2'b01 && board_state[9:8] == 2'b01 && board_state[15:14] == 2'b01) || //column 2 vertical win for p1
                  (board_state[5:4] == 2'b01 && board_state[11:10] == 2'b01 && board_state[17:16] == 2'b01) || //column 3 vertical win for p1
                  (board_state[1:0] == 2'b01 && board_state[9:8] == 2'b01 && board_state[17:16] == 2'b01) || //diagonal win for p1
                  (board_state[5:4] == 2'b01 && board_state[9:8] == 2'b01 && board_state[13:12] == 2'b01); //diagonal win for p1

            //player 2 win conditions
            win = win || (board_state[1:0] == 2'b10 && board_state[3:2] == 2'b10 && board_state[5:4] == 2'b10) || //horizontal win for p2
                         (board_state[7:6] == 2'b10 && board_state[9:8] == 2'b10 && board_state[11:10] == 2'b10) || //row 2 horizontal win for p2
                         (board_state[13:12] == 2'b10 && board_state[15:14] == 2'b10 && board_state[17:16] == 2'b10) || //row 3 horizontal win for p2
                         (board_state[1:0] == 2'b10 && board_state[7:6] == 2'b10 && board_state[13:12] == 2'b10) || //column 1 vertical win for p2
                         (board_state[3:2] == 2'b10 && board_state[9:8] == 2'b10 && board_state[15:14] == 2'b10) || //column 2 vertical win for p2
                         (board_state[5:4] == 2'b10 && board_state[11:10] == 2'b10 && board_state[17:16] == 2'b10) || //column 3 vertical win for p2
                         (board_state[1:0] == 2'b10 && board_state[9:8] == 2'b10 && board_state[17:16] == 2'b10) || //diagonal win for p2
                         (board_state[5:4] == 2'b10 && board_state[9:8] == 2'b10 && board_state[13:12] == 2'b10); //diagonal win for p2

            //draw condition
            draw = (board_state[1:0] != 2'b00 && board_state[3:2] != 2'b00 && board_state[5:4] != 2'b00 &&
                    board_state[7:6] != 2'b00 && board_state[9:8] != 2'b00 && board_state[11:10] != 2'b00 &&
                    board_state[13:12] != 2'b00 && board_state[15:14] != 2'b00 && board_state[17:16] != 2'b00) && !win;
                    
