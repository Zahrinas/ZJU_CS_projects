package Homework2;

import static java.lang.Character.isDigit;
import java.util.ArrayList;

class Quiz {
    private static final int[] MatchOfDigit={6, 2, 5, 5, 4, 5, 6, 3, 7, 6};
    //0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    private static final int[][] TransferAdd={
        { 0, -1, -1, -1, -1, -1, -1, -1,  1, -1},
        { 4,  0, -1,  3,  2, -1, -1,  1,  5,  4},
        {-1, -1,  0, -1, -1, -1, -1, -1,  2, -1},
        {-1, -1, -1,  0, -1, -1, -1, -1,  2,  1},
        {-1, -1, -1, -1,  0, -1, -1, -1,  3,  2},
        {-1, -1, -1, -1, -1,  0,  1, -1,  2,  1},
        {-1, -1, -1, -1, -1, -1,  0, -1,  1, -1},
        { 3, -1, -1,  2, -1, -1, -1,  0,  4,  3},
        {-1, -1, -1, -1, -1, -1, -1, -1,  0, -1},
        {-1, -1, -1, -1, -1, -1, -1, -1,  1,  0}
    };
    private static final int[][] TransferRmv={
        { 0,  4, -1, -1, -1, -1, -1,  3, -1, -1},
        {-1,  0, -1, -1, -1, -1, -1, -1, -1, -1},
        {-1, -1,  0, -1, -1, -1, -1, -1, -1, -1},
        {-1,  3, -1,  0, -1, -1, -1, -1, -1, -1},
        {-1,  2, -1, -1,  0, -1, -1, -1, -1, -1},
        {-1, -1, -1, -1, -1,  0, -1, -1, -1, -1},
        {-1, -1, -1, -1, -1,  1,  0, -1, -1, -1},
        {-1,  1, -1, -1, -1, -1, -1,  0, -1, -1},
        { 1,  5,  2,  2,  3,  2,  1,  4,  0,  1},
        {-1,  4, -1,  1,  2,  1, -1,  3, -1,  0}
    };
    private static final int[][] TransferSame={
        {6, 2, 4, 4, 3, 4, 5, 3, 6, 5},
        {2, 2, 1, 2, 2, 1, 1, 2, 2, 2},
        {4, 1, 5, 4, 2, 3, 4, 2, 5, 4},
        {4, 2, 4, 5, 3, 4, 4, 3, 5, 5},
        {3, 2, 2, 3, 4, 3, 3, 2, 4, 4},
        {4, 1, 3, 4, 3, 5, 5, 2, 5, 5},
        {5, 1, 4, 4, 3, 5, 6, 2, 6, 5},
        {3, 2, 2, 3, 2, 2, 2, 3, 3, 3},
        {6, 2, 5, 5, 4, 5, 6, 3, 7, 6},
        {5, 2, 4, 5, 4, 5, 5, 3, 6, 6}
    };
    
    private int MaxDigit, LeftNums, QuizType, MatchCnt;
    private String Sol, Topic;
    
    String TopicString() {
        return Topic;
    }

    String SolutionString() {
        return Sol;
    }
    
    Quiz(int MD, int LN, int QT, int MC) {
        MaxDigit =  1;
        LeftNums = LN;
        QuizType = QT;
        MatchCnt = MC;
        for(int i = 0; i < MD; ++i){
            MaxDigit *= 10;
        }
        int Tryment = 0;
        while(true){
            if(++Tryment >= 10){
                Sol = "";
                return;
            }
            int a = (int)(Math.random() * MaxDigit);
            int b = (int)(Math.random() * MaxDigit);
            if(LeftNums == 2){
                if(a + b < MaxDigit / 10 || a + b >= MaxDigit) continue;
                Sol = (a + "+" + b + "=" + (a + b));
                if(Gen(a, b, 0)) return;
            }else{
                int c = (int)(Math.random() * MaxDigit);
                if(a + b + c < MaxDigit / 10 || a + b + c >= MaxDigit) continue;
                Sol = (a + "+" + b + "+" + c + "=" + (a + b + c));
                if(Gen(a, b, c)) return;
            }
        }
    }
    
    private boolean Gen(int a, int b,int c) {
        ArrayList<String> AL = new ArrayList();
        for(int i = 0; i < MaxDigit; ++i){
            if(LeftNums == 2){
                Topic = i + "+" + b + "=" + (a + b);
                if(TopicMatch(Topic)) AL.add(Topic);
                Topic = a + "+" + i + "=" + (a + b);
                if(TopicMatch(Topic)) AL.add(Topic);
                Topic = a + "+" + b + "=" + i;
                if(TopicMatch(Topic)) AL.add(Topic);
            }else{
                Topic = i + "+" + b + "+" + c + "=" + (a + b + c);
                if(TopicMatch(Topic)) AL.add(Topic);
                Topic = a + "+" + i + "+" + c + "=" + (a + b + c);
                if(TopicMatch(Topic)) AL.add(Topic);
                Topic = a + "+" + b + "+" + i + "=" + (a + b + c);
                if(TopicMatch(Topic)) AL.add(Topic);
                Topic = a + "+" + b + "+" + c + "=" + i;
                if(TopicMatch(Topic)) AL.add(Topic);
            }
            if(!AL.isEmpty()){
                Topic = AL.get((int)(AL.size() * Math.random()));
                return true;
            }
        }
        for(int i = 0; i < MaxDigit; ++i){
            for(int j = 0; j < MaxDigit; ++j){
                if(LeftNums == 2){
                    Topic = i + "+" + j + "=" + (a + b);
                    if(TopicMatch(Topic)) AL.add(Topic);
                    Topic = i + "+" + b + "=" + j;
                    if(TopicMatch(Topic)) AL.add(Topic);
                    Topic = a + "+" + i + "=" + j;
                    if(TopicMatch(Topic)) AL.add(Topic);
                }else{
                    Topic = i + "+" + j + "+" + c + "=" + (a + b + c);
                    if(TopicMatch(Topic)) AL.add(Topic);
                    Topic = i + "+" + b + "+" + j + "=" + (a + b + c);
                    if(TopicMatch(Topic)) AL.add(Topic);
                    Topic = i + "+" + b + "+" + c + "=" + j;
                    if(TopicMatch(Topic)) AL.add(Topic);
                    Topic = a + "+" + i + "+" + j + "=" + (a + b + c);
                    if(TopicMatch(Topic)) AL.add(Topic);
                    Topic = a + "+" + i + "+" + c + "=" + j;
                    if(TopicMatch(Topic)) AL.add(Topic);
                    Topic = a + "+" + b + "+" + i + "=" + j;
                    if(TopicMatch(Topic)) AL.add(Topic);
                }
                if(!AL.isEmpty()){
                    Topic = AL.get((int)(AL.size() * Math.random()));
                    return true;
                }
            }
        }
        return false;
    }

    boolean CorrectSolve(String arg) {
        return arg.equals(Sol);
    }

    private boolean TopicMatch(String arg) {
        if(Sol.length() != arg.length()) return false;
        for(int i = 0; i < arg.length(); ++i){
            if(isDigit(Sol.charAt(i)) && !isDigit(arg.charAt(i))) return false;
            if(!isDigit(Sol.charAt(i)) && isDigit(arg.charAt(i))) return false;
        }
        return CalcMatch(arg) == MatchCnt;
    }

    private int CalcMatch(String arg) {
        int ret = 0;
        if(QuizType == 1){
            int Added = 0, Rmved = 0;
            for(int i = 0; i < arg.length(); ++i) if(isDigit(arg.charAt(i))){
                Added += MatchOfDigit[arg.charAt(i) - '0'] - TransferSame[Sol.charAt(i) - '0'][arg.charAt(i) - '0'];
                Rmved += MatchOfDigit[Sol.charAt(i) - '0'] - TransferSame[Sol.charAt(i) - '0'][arg.charAt(i) - '0'];
            }
            if(Added != Rmved) return -1;
            else ret = Added;
        }else if(QuizType == 2){
            for(int i = 0; i < arg.length(); ++i) if(isDigit(arg.charAt(i))){
                if(TransferAdd[Sol.charAt(i) - '0'][arg.charAt(i) - '0'] == -1) return -1;
                ret += TransferAdd[Sol.charAt(i) - '0'][arg.charAt(i) - '0'];
            }
        }else{
            for(int i = 0; i < arg.length(); ++i) if(isDigit(arg.charAt(i))){
                if(TransferRmv[Sol.charAt(i) - '0'][arg.charAt(i) - '0'] == -1) return -1;
                ret += TransferRmv[Sol.charAt(i) - '0'][arg.charAt(i) - '0'];
            }
        }
        return ret;
    }
}