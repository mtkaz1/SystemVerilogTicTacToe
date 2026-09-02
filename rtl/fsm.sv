module fsm(input logic clk, input logic start, input logic reset, input logic move_req, 
            input logic win, input logic draw, input logic valid,
            output logic [1:0] player_value, output logic w_e, output logic game_done); 

        typedef enum logic [1:0]
        {IDLE,
        PLAYER1,
        PLAYER2,
        GAME_DONE} state_t;

        state_t state, next_state;


        always_ff @(posedge clk)
            begin
                if(reset)
                    state <= IDLE;
                else
                    state <= next_state;
            end

        always_comb
            begin
                case(state)
                    IDLE:
                        begin
                            if(start)
                                next_state = PLAYER1;
                            else
                                next_state = IDLE;
                        end
                    
                    PLAYER1:
                        begin
                            if(win || draw)
                                next_state = GAME_DONE;
                            else if(move_req && valid)
                                next_state = PLAYER2;
                            else
                                next_state = PLAYER1;
                        end
                    
                    PLAYER2:    
                        begin
                            if(win || draw)
                                next_state = GAME_DONE; 
                            else if(move_req && valid)
                                next_state = PLAYER1;
                            else
                                next_state = PLAYER2;
                        end
                    
                    GAME_DONE:
                        begin
                            if(reset)
                                next_state = IDLE;
                            else
                                next_state = GAME_DONE;
                        end
                endcase
endmodule
