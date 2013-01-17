package ee.ttu.ecomm.core.webservice.soap;

import ee.ttu.ecomm.core.domain.Contract;

import java.math.BigDecimal;
import java.util.Date;

public class ContractUpdateDTO {

    Long id;
    String name;
    String description;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void updateContract(Contract contract) {
        contract.setName(this.getName());
        contract.setDescription(this.getDescription());
    }


}
