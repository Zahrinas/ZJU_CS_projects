package homework4;

import java.io.IOException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.lucene.queryparser.classic.ParseException;
public class Main {
    public static void main(String[] args) {
        try {
            Scanner scan = new Scanner(System.in, "GBK");
            System.out.println("1：爬取网页；");
            System.out.println("2：进行查询（需要存在索引）；");
            System.out.println("输入其他数字退出");
            int mode = scan.nextInt();
            scan.nextLine();
            if(mode == 1){
                IndexBuilder.initialize();
                System.out.print("输入爬取页数（1-100）：");
                HTMLParser.setMaxPage(scan.nextInt());
                HTMLParser.build1("/c/202.html", 1);
                IndexBuilder.close();
            }else if(mode == 2){
                System.out.print("输入查询关键词（以空格隔开）：");
                String query = scan.nextLine();
                IndexBuilder.search(query);
            }else System.exit(0);
        } catch (IOException | InterruptedException | ParseException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
