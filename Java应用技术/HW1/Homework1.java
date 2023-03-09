//This Program is to convert a Decimal number to its Hexadecimal form.
package Homework1;

import java.util.Scanner;

public class Homework1 {
    static Scanner scan = new Scanner(System.in);
    public static void main(String[] args) {
        System.out.print("输入一个十进制整数：");
        int i = scan.nextInt();
        System.out.print("转换后的十六进制数：");
        System.out.println(Integer.toString(i, 16));
        System.exit(0);
    }
}
