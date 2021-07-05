package enrich.prj.factory;

import enrich.prj.crawler.CellPhoneScrawler;
import enrich.prj.crawler.DDTMCralwer;
import enrich.prj.crawler.ICrawler;
import enrich.prj.crawler.SDCrawler;
import enrich.prj.entity.PageMarker;

public class CrawlerCreator extends Creator {
    public ICrawler createCrawler(PageMarker marker) {
        switch (marker) {
            case CPS: 
                return new CellPhoneScrawler();
            case DDTM:
                return new DDTMCralwer();
            case SD:
                return new SDCrawler();
            default:
                return null;
        }
    }
}
