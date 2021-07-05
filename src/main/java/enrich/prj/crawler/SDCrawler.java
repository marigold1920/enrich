package enrich.prj.crawler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.jsoup.Jsoup;

import enrich.prj.entity.Product;

public final class SDCrawler extends ICrawler {
    Collection<Product> fetchPage() throws IOException, InterruptedException {
        var products = new ArrayList<Product>();
        var document = Jsoup.connect(page.getPaginationLink()).get();
        var productLinks = document.select(page.getMapExpressions().get("productLink").getExpression()).eachAttr("href");

        for (String link : productLinks) {
            products.add(fetchDetails(link));
            TimeUnit.SECONDS.sleep(10);
        }

        return products;
    }

    Product fetchDetails(String link) throws IOException {
        try {
            System.out.println(link);
            var expressions = page.getMapExpressions();
            var document = Jsoup.connect(link).get();
            var details = document.selectFirst(expressions.get("productDetails").getExpression());

            var name = document.selectFirst(expressions.get("name").getExpression()).text().strip();
            var image = details.selectFirst(expressions.get("image").getExpression()).attr("src");
            var price = Integer.parseInt(details.selectFirst(expressions.get("price").getExpression()).text().replaceAll("\\D+", ""));
            var promotions = details.select(expressions.get("promotions").getExpression()).eachText();
            // var ram = Short.parseShort(document.selectFirst(expressions.get("ram").getExpression()).text().replaceAll("\\D+", ""));
            var ram = Short.parseShort(document.selectFirst("div.parameter:matches(\\d+(.)*GB)").text().replaceAll("\\D+", ""));
            var rom = Short.parseShort(details.selectFirst(expressions.get("rom").getExpression()).text().replaceAll("\\D+", ""));
            var colors = details.select(expressions.get("colors").getExpression()).eachAttr("style").stream()
                    .map(SDCrawler::getColorFromCssStyle).collect(Collectors.toList());

            return new Product(null, link, name, image, price, ram, rom, colors, promotions, page.getDomain());
        } catch (Exception error) {
            return null;
        }
    }

    private static String getColorFromCssStyle(String cssStyle) {
        final Pattern pattern = Pattern.compile("(.*)background-color:(.+)(.*)");
        final Matcher matcher = pattern.matcher(cssStyle);

        return matcher.find() ? matcher.group(2) : "";
    }
}
