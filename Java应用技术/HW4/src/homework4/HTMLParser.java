package homework4;

import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

class HTMLParser {
    private static int maxPage = 100;
    private static long sleepTime = 1000;
    private static final String mainpage = "https://iask.sina.com.cn";
    
    static void build1(String url, int pageCnt) throws InterruptedException {
        Thread.sleep(sleepTime);
        System.out.println("读取页数" + pageCnt);
        try{
            Document doc = Jsoup.connect(mainpage + url).get();
            Elements list = doc.getElementsByClass("question-title fl");
            for(Element elmt : list){
                build2(elmt.firstElementChild().attr("href"));
            }
            Elements page = doc.getElementsByClass("btn-page");
            for(Element btn : page){
                if(pageCnt < maxPage && btn.text().equals("下一页")){
                    build1(btn.attr("href"), pageCnt + 1);
                }
            }
        }catch(IOException ex){
            System.out.println("重试");
            build1(url, pageCnt);
        }
    }
    
    private static void build2(String url) throws InterruptedException{
        Thread.sleep(sleepTime);
        try{
            Document doc = Jsoup.connect(mainpage + url).get();
            String title = doc.getElementsByClass("title-f22").text();
            if(title.isEmpty()) return;
            String ans = doc.getElementsByClass("answer_text").first().text();
            if(ans.isEmpty()) return;
            IndexBuilder.addDocument(title, ans);
            System.out.print(mainpage + url);
            System.out.println("读取完成");
        }catch(IOException ex){
            System.out.print(mainpage + url);
            System.out.println("读取失败；重试……");
            build2(url);
        }
    }

    static void setMaxPage(int page) {
        maxPage = page;
    }
}