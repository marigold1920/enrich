package enrich.prj.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PostLoad;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "pages")
@Getter
@Setter
public class Page implements Serializable {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    private Integer id;

    @Column(name = "pagination_link", length = 100)
    private String paginationLink;

    @ManyToOne
    @JoinColumn(name = "domain", referencedColumnName = "id")
    private Domain domain;

    @OneToMany(mappedBy = "page")
    private Collection<AttributeExpression> expressions;

    @Transient
    private Map<String, AttributeExpression> mapExpressions;

    @PostLoad
    private void mapExpressionsToKeyAndValue() {
        if (expressions == null || expressions.isEmpty())
            return;
        var mapExpressions = expressions.stream()
                .collect(Collectors.toMap(AttributeExpression::getKey, Function.identity()));
        this.setMapExpressions(mapExpressions);
    }
}
