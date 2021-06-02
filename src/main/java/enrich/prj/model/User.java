package enrich.prj.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity(name = "users")
public class User implements Serializable {

    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    @Column(name = "id")
    private Integer userId;

    @Column(name = "username", unique = true, length = 30)
    private String username;

    @Column(name = "password", length = 256)
    private String password;

    @Column(name = "display_name", length = 50)
    private String displayName;

    @ManyToOne(fetch = FetchType.LAZY)
    private Role role;
}
