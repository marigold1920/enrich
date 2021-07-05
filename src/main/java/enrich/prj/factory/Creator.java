package enrich.prj.factory;

import java.io.IOException;

import org.springframework.data.jpa.repository.JpaRepository;

import enrich.prj.crawler.ICrawler;
import enrich.prj.entity.Domain;
import enrich.prj.entity.PageMarker;
import enrich.prj.entity.Product;

public abstract class Creator {
    public abstract ICrawler createCrawler(PageMarker marker);
    
    public final <T extends JpaRepository<Product, ?>> void start(T repository, Domain page) throws IOException, InterruptedException {
        createCrawler(page.getMarker()).execute(repository);
    }
}
