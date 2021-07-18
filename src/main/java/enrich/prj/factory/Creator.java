package enrich.prj.factory;

import enrich.prj.crawler.ICrawler;
import enrich.prj.entity.Page;
import enrich.prj.entity.PageMarker;
import enrich.prj.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.io.IOException;

public abstract class Creator {
    public abstract ICrawler createCrawler(PageMarker marker);
    
    public final void start(JpaRepository<Product, ?> repository, Page page) throws IOException, InterruptedException {
        ICrawler crawler = createCrawler(page.getDomain().getMarker());

        crawler.setPage(page);
        crawler.execute(repository);
    }
}
