package enrich.prj.entity;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "domains")
@Getter
@Setter
public class Domain implements Serializable {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    private Integer id;

    @Column(name = "name", length = 30)
    private String name;

    @Column(name = "base_url", length = 100)
    private String baseUrl;

    @Column(name = "logo", length = 100)
    private String logo;

    @Enumerated(EnumType.STRING)
    private PageMarker marker;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "domain", orphanRemoval = true)
    private Collection<Page> pages;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "domain")
    private Collection<Product> products;
}
