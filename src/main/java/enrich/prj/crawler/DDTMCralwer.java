package enrich.prj.crawler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.concurrent.TimeUnit;

import org.jsoup.Jsoup;

import enrich.prj.entity.Product;

public final class DDTMCralwer extends ICrawler {
    Collection<Product> fetchPage() throws IOException, InterruptedException {
        var products = new ArrayList<Product>();
        var currentPage = "1";
       
        while (!currentPage.isBlank()) {
            var document = Jsoup.connect(page.getPaginationLink() + currentPage).get();
            var productLinks = document.select(page.getMapExpressions().get("productLink").getExpression()).eachAttr("href");
    
            for (String link : productLinks) {
                products.add(fetchDetails(page.getDomain().getBaseUrl() + link));
                TimeUnit.SECONDS.sleep(10);
            }
    
            currentPage = document.getElementsMatchingOwnText("»").attr("onclick").replaceAll("\\D+", "");
        }

        return products;
    }

    Product fetchDetails(String link) throws IOException {
        try {
            System.out.println(link);
            var expressions = page.getMapExpressions();
            var document = Jsoup.connect(link).get();
            var details = document.selectFirst("section.product div.container");

            var name = details.selectFirst(expressions.get("name").getExpression()).text().strip();
            var image = details.selectFirst(expressions.get("image").getExpression()).attr("data-src");
            var price = Integer.parseInt(details.selectFirst(expressions.get("price").getExpression()).text().replaceAll("\\D+", ""));
            var colors = details.select(expressions.get("colors").getExpression()).eachAttr("data-value");
            var promotions = details.select(expressions.get("promotions").getExpression()).eachText();
            // var memories = details.select(expressions.get("memories").getExpression()).eachText();
            var memories = details.select("td p:matches(\\d+(.)*GB)").eachText();
            var ram = Short.parseShort(memories.get(0).replaceAll("\\D+", ""));
            var rom = Short.parseShort(memories.get(1).split(",")[0].replaceAll("\\D+", ""));

            return new Product(null, link, name, image, price, ram, rom, colors, promotions, page.getDomain());
        } catch (Exception error) {
            return null;
        }
    }
}
