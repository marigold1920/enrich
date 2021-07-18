package enrich.prj.crawler;

import enrich.prj.entity.Product;
import org.jsoup.Jsoup;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.concurrent.TimeUnit;

public final class CellPhoneCrawler extends ICrawler {
    Collection<Product> fetchPage() throws IOException, InterruptedException {
        var products = new ArrayList<Product>();
        var currentPage = page.getPaginationLink();

        while (!currentPage.isBlank()) {
            var document = Jsoup.connect(currentPage).get();
            var productLinks = document.select(page.getMapExpressions().get("productLink").getExpression()).eachAttr("href");

            for (String link : productLinks) {
                products.add(fetchDetails(link));
                TimeUnit.SECONDS.sleep(10);
            }

            currentPage = document.getElementsMatchingOwnText("Tiếp").attr("href");
        }

        return products;
    }

    Product fetchDetails(String link) {
        try {
            var expressions = page.getMapExpressions();
            var document = Jsoup.connect(link).get();
            var details = document.selectFirst(expressions.get("productDetails").getExpression());

            var name = document.selectFirst(expressions.get("name").getExpression()).text();
            var image = document.selectFirst(expressions.get("image").getExpression()).attr("data-src");
            var price = Integer.parseInt(details.select(expressions.get("price").getExpression()).text().replaceAll("\\D+", ""));
            var colors = details.select(expressions.get("colors").getExpression()).eachText();
            var promotions = details.select(expressions.get("promotions").getExpression()).eachText();
            var rom = Short.parseShort(details.selectFirst(expressions.get("rom").getExpression()).text().replaceAll("\\D+", ""));
            // var ram = Short.parseShort(document.selectFirst(expressions.get("ram").getExpression()).text().replaceAll("\\D+", ""));
            var ram = Short.parseShort(document.selectFirst("td:matches(\\d+(.)*GB)").text().replaceAll("\\D+", ""));

            return new Product(null, link, name, image, price, ram, rom, colors, promotions, page.getDomain());
        } catch (Exception error) {
            return null;
        }
    }
}
