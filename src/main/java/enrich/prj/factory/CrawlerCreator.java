package enrich.prj.factory;

import enrich.prj.crawler.CellPhoneCrawler;
import enrich.prj.crawler.DDTMCrawler;
import enrich.prj.crawler.ICrawler;
import enrich.prj.crawler.SDCrawler;
import enrich.prj.entity.PageMarker;

public class CrawlerCreator extends Creator {
    public ICrawler createCrawler(PageMarker marker) {
        switch (marker) {
            case CPS: 
                return new CellPhoneCrawler();
            case DDTM:
                return new DDTMCrawler();
            case SD:
                return new SDCrawler();
            default:
                return null;
        }
    }
}
