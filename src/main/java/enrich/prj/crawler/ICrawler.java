package enrich.prj.crawler;

import java.io.IOException;
import java.util.Collection;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.data.jpa.repository.JpaRepository;

import enrich.prj.entity.Page;
import enrich.prj.entity.Product;
import lombok.Setter;

public abstract class ICrawler {

    @Setter
    protected Page page;

    abstract Collection<Product> fetchPage() throws IOException, InterruptedException;

    abstract Product fetchDetails(String url);

    public final <T extends JpaRepository<Product, ?>> void execute(T repository) throws IOException, InterruptedException {
        var products = fetchPage().stream()
            .filter(Objects::nonNull)
            .collect(Collectors.toList());

        repository.saveAllAndFlush(products);
    }
}
