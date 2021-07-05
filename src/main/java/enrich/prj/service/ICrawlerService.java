package enrich.prj.service;

import java.io.IOException;

public interface ICrawlerService {
    void crawl() throws IOException, InterruptedException;
}
