package com.c23c_601_2.daoNK;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class ItboardDAO {
	 
	public List<String> headLines() {
		List<String> headlines = new ArrayList<>();

        try {
            String url = "https://news.naver.com/breakingnews/section/105/283";
            Document document = Jsoup.connect(url).get();
            Elements headlinesElements = document.select("div.sa_text > a");
            headlinesElements.forEach(headline -> headlines.add(headline.text()));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return headlines;
    }
}
