package homework4;

import java.io.File;
import java.io.IOException;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

public class IndexBuilder {
    private static final String path = "D:/iaskIndex";
    private static IndexWriter iwr;
    
    static void initialize() throws IOException {
        File f = new File(path);
        Directory dir = FSDirectory.open(f);
        Analyzer analyzer = new IKAnalyzer();
        IndexWriterConfig conf = new IndexWriterConfig(Version.LUCENE_4_10_0, analyzer);
        iwr = new IndexWriter(dir, conf);
    }
    
    static void addDocument(String title, String ans) throws IOException {
        Document doc = new Document();
        Field f1 = new TextField("title", title, Field.Store.YES);
        Field f2 = new TextField("answer", ans, Field.Store.YES);
        doc.add(f1);
        doc.add(f2);
        iwr.addDocument(doc);
    }
    
    static void close() throws IOException{
        iwr.close();
    }
    
    static void search(String queryStr) throws ParseException, IOException {
        File f = new File(path);
        IndexSearcher searcher = new IndexSearcher(DirectoryReader.open(FSDirectory.open(f)));
        Analyzer analyzer = new IKAnalyzer();
        QueryParser parser = new QueryParser("title", analyzer);
        Query query = parser.parse(queryStr);
        TopDocs hits = searcher.search(query, 20);
        for(ScoreDoc doc : hits.scoreDocs){
            Document d=searcher.doc(doc.doc);
            System.out.println(d.get("title"));
            System.out.println(d.get("answer"));
            System.out.println();
        }
    }
}