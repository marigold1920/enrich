package enrich.prj.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;

@Entity
@Table(name = "attribute_expressions")
@Data
public class AttributeExpression implements Serializable {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    private Integer id;

    @Column(name = "key_name", length = 20)
    private String key;

    @Column(name = "attribute", length = 20)
    private String attribute;

    @Column(name = "expression", length = 70)
    private String expression;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "page", referencedColumnName = "id")
    private Page page;
}