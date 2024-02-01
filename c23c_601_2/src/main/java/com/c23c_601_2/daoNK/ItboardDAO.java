package com.c23c_601_2.daoNK;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class ItboardDAO {
	 
	public List<String> newsTitle() {
		List<String> headlines = new ArrayList<>();

        try {
            String url = "https://news.naver.com/breakingnews/section/105/283";
            Document document = Jsoup.connect(url).get();
            Elements headlinesElements = document.select("strong.sa_text_strong");
            headlinesElements.forEach(headline -> headlines.add(headline.text()));
            
        } catch (IOException e) {
            e.printStackTrace();
        }

        return headlines;
    }
	
	public List<String> newsUrl() {
		List<String> headlines2 = new ArrayList<>();
		
		try {
            String url = "https://news.naver.com/breakingnews/section/105/283";
            Document document = Jsoup.connect(url).get();
            
            Elements headlines1 = document.select("div.sa_text > a.sa_text_title");
            headlines1.forEach(headline -> {
                String hrefValue = headline.attr("href");
                headlines2.add(hrefValue);
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
        return headlines2;
    }

	public List<String> newsDate() {
		List<String> headlines3 = new ArrayList<String>();
		
		try {
            String url = "https://news.naver.com/breakingnews/section/105/283";
            Document document = Jsoup.connect(url).get();
            Elements headlines1 = document.select("div.sa_text_datetime");
            headlines1.forEach(headline -> headlines3.add(headline.text()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return headlines3;
	}
	
}
