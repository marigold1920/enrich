package enrich.prj.controller;

import java.io.IOException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import enrich.prj.service.ICrawlerService;

@RestController
@RequestMapping(value = "/crawlers")
public class CrawlerController {
    private final ICrawlerService crawlerService;

    public CrawlerController(ICrawlerService crawlerService) {
        this.crawlerService = crawlerService;
    }

    @GetMapping
    public void crawle() throws IOException, InterruptedException {
        crawlerService.crawl();
    }
}
