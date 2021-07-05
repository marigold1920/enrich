package enrich.prj.entity;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "products")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product implements Serializable {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    private Integer productId;

    @Column(name  = "product_link", length = 100)
    private String productLink;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "image_url", length = 250)
    private String imageUrl;

    @Column(name = "price")
    private int price;

    @Column(name = "ram")
    private short ram;

    @Column(name = "rom")
    private short rom;

    @Column(name = "colors")
    @ElementCollection
    private Collection<String> colors;

    @Column(name = "promotions")
    @ElementCollection
    private Collection<String> promotions;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "domain", referencedColumnName = "id")
    private Domain domain;
}
