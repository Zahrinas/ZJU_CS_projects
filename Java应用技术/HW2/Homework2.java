package Homework2;

import java.util.Scanner;

public class Homework2 {
    static Scanner scan = new Scanner(System.in);
    public static void main(String[] args) {
        int MaxDigit = scan.nextInt();
        int LeftNums = scan.nextInt();
        int QuizType = scan.nextInt();
        int MatchCnt = scan.nextInt();
        scan.nextLine();                                                        //获取用户给出的题目参数
        Quiz Q = new Quiz(MaxDigit, LeftNums, QuizType, MatchCnt);              //生成题目
        if(Q.SolutionString().isEmpty()){
            System.out.println("Cannot generate a quiz!");
            return;
        }                                                                       //检测题目是否生成成功，不成功则直接退出
        System.out.println(Q.TopicString());                                    //输出题目
        while(true){
            String ans = scan.nextLine();
            if(Q.CorrectSolve(ans)){
                System.out.println("Correct!");
                break;                                                          //正确答案
            }else if(ans.isEmpty()){
                System.out.println(Q.SolutionString());
                break;                                                          //直接回车，输出正确答案
            }else{
                System.out.println("Wrong answer, try another solution?");
            }                                                                   //错误答案
        }
    }
}
