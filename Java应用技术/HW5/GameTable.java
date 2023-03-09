package homework5;

public final class GameTable{
    private int[][] d = new int[3][3];
    private int turn;
    
    GameTable(){
        turn = (int) (2 * Math.random()) + 1;
    }
    
    GameTable(int cond, int t){
        restoreFrom(cond);
        turn = t;
    }
    
    int getTurn(){
        return turn;
    }
    
    int condition(){
        int ret = 0;
        for(int i = 0; i < 3; ++i){
            for(int j = 0; j < 3; ++j){
                ret *= 10;
                ret += d[i][j];
            }
        }
        return ret;
    }
    
    void restoreFrom(int cond){
        for(int j = 2; j >= 0; --j){
            for(int i = 2; i >= 0; --i){
                d[i][j] = cond % 10;
                cond /= 10;
            }
        }
    }
    
    void tryStep(int player, int x, int y){
        if(turn == player && d[x][y] == 0){
            d[x][y] = player;
            turn = 3 - turn;
        }
    }
    
    boolean finished(){
        if(d[0][0] != 0 && d[0][0] == d[0][1] && d[0][1] == d[0][2]) return true;
        if(d[1][0] != 0 && d[1][0] == d[1][1] && d[1][1] == d[1][2]) return true;
        if(d[2][0] != 0 && d[2][0] == d[2][1] && d[2][1] == d[2][2]) return true;
        if(d[0][0] != 0 && d[0][0] == d[1][0] && d[1][0] == d[2][0]) return true;
        if(d[0][1] != 0 && d[0][1] == d[1][1] && d[1][1] == d[2][1]) return true;
        if(d[0][2] != 0 && d[0][2] == d[1][2] && d[1][2] == d[2][2]) return true;
        if(d[0][0] != 0 && d[0][0] == d[1][1] && d[1][1] == d[2][2]) return true;
        if(d[2][0] != 0 && d[2][0] == d[1][1] && d[1][1] == d[0][2]) return true;
        for(int i = 0; i < 3; ++i){
            for(int j = 0; j < 3; ++j){
                if(d[i][j] == 0) return false;
            }
        }
        return true;
    }
    
    int getWinner(){
        if(d[0][0] != 0 && d[0][0] == d[0][1] && d[0][1] == d[0][2]) return d[0][0];
        if(d[1][0] != 0 && d[1][0] == d[1][1] && d[1][1] == d[1][2]) return d[1][0];
        if(d[2][0] != 0 && d[2][0] == d[2][1] && d[2][1] == d[2][2]) return d[2][0];
        if(d[0][0] != 0 && d[0][0] == d[1][0] && d[1][0] == d[2][0]) return d[0][0];
        if(d[0][1] != 0 && d[0][1] == d[1][1] && d[1][1] == d[2][1]) return d[0][1];
        if(d[0][2] != 0 && d[0][2] == d[1][2] && d[1][2] == d[2][2]) return d[0][2];
        if(d[0][0] != 0 && d[0][0] == d[1][1] && d[1][1] == d[2][2]) return d[0][0];
        if(d[2][0] != 0 && d[2][0] == d[1][1] && d[1][1] == d[0][2]) return d[2][0];
        return 0;
    }
}
