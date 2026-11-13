package $PACKAGE_BASE.model;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "$MAIN_ENTITY_TABLE")
public class $MAIN_ENTITY {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String identificador;
    private String descricao;
    private BigDecimal valorTotal;
    private String status = "CRIADO";

    public ${MAIN_ENTITY}() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getIdentificador() { return identificador; }
    public void setIdentificador(String identificador) { this.identificador = identificador; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public BigDecimal getValorTotal() { return valorTotal; }
    public void setValorTotal(BigDecimal valorTotal) { this.valorTotal = valorTotal; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
