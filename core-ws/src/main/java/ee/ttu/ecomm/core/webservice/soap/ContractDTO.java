package ee.ttu.ecomm.core.webservice.soap;

import ee.ttu.ecomm.core.domain.Contract;
import ee.ttu.ecomm.core.domain.Customer;
import org.springframework.beans.BeanUtils;

import java.math.BigDecimal;
import java.util.Date;

public class ContractDTO {

    Long id;
    String contractNumber;
    String name;
    String description;
    Date validFrom;
    Date validTo;
    String note;
    BigDecimal valueAmount;
    Long customerId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContractNumber() {
        return contractNumber;
    }

    public void setContractNumber(String contractNumber) {
        this.contractNumber = contractNumber;
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

    public Date getValidFrom() {
        return validFrom;
    }

    public void setValidFrom(Date validFrom) {
        this.validFrom = validFrom;
    }

    public Date getValidTo() {
        return validTo;
    }

    public void setValidTo(Date validTo) {
        this.validTo = validTo;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public BigDecimal getValueAmount() {
        return valueAmount;
    }

    public void setValueAmount(BigDecimal valueAmount) {
        this.valueAmount = valueAmount;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Contract toContract() {
        Contract contract = new Contract();
        BeanUtils.copyProperties(this, contract);
        Customer customer = new Customer();
        customer.setId(this.getCustomerId());
        contract.setCustomer(customer);
        return contract;
    }

}
