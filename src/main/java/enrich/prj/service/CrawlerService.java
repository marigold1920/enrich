package enrich.prj.service;

import java.io.IOException;
import java.util.Collection;

import org.springframework.stereotype.Service;

import enrich.prj.crawler.ICrawler;
import enrich.prj.entity.Page;
import enrich.prj.factory.CrawlerCreator;
import enrich.prj.factory.Creator;
import enrich.prj.repository.PageRepository;
import enrich.prj.repository.ProductRepository;

@Service
public class CrawlerService implements ICrawlerService {
    private final PageRepository pageRepository;
    private final ProductRepository productRepository;

    public CrawlerService(PageRepository pageRepository, ProductRepository productRepository) {
        this.pageRepository = pageRepository;
        this.productRepository = productRepository;
    }

    @Override
    public void crawl() throws IOException, InterruptedException {
        Collection<Page> pages = pageRepository.findAll();
        Creator creator = new CrawlerCreator();

        for (Page page : pages) {
            creator.start(productRepository, page);
        }
    }
}
