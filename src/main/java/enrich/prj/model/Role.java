package enrich.prj.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Entity(name = "roles")
public class Role implements Serializable {

    @Id
    @Column(name = "code", length = 15)
    private String code;

    @Column(name = "role_name", length = 20)
    private String roleName;
}
