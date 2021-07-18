package enrich.prj.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonNaming(PropertyNamingStrategies.LowerCamelCaseStrategy.class)
public class ProductDto {
    private Integer productId;
    private String productLink;
    private String name;
    private String imageUrl;
    private int price;
    private short ram;
    private short rom;
    private Collection<String> colors;
    private Collection<String> promotions;
    private DomainDto domain;
}
