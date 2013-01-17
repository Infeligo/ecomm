package ee.ttu.ecomm.core.webservice.soap;

import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Contract;
import ee.ttu.ecomm.core.domain.Customer;
import org.springframework.beans.BeanUtils;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;

public class ContractCreateDTO {

    Long addressId;
    String name;
    String description;
    Date validFrom;
    int period;
    BigDecimal valueAmount;
    Long customerId;

    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
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

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
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

        // Set customer
        Customer customer = new Customer();
        customer.setId(this.getCustomerId());
        contract.setCustomer(customer);

        // Set address
        Address address = new Address();
        Long addressId = this.getAddressId();
        address.setId(addressId);
        contract.setAddress(address);

        // Set valid to date
        contract.setValidTo(calculateValidTo(getValidFrom(), getPeriod()));
        return contract;
    }

    public static Date calculateValidTo(Date validFrom, int period) {
        assert validFrom != null;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(validFrom);
        calendar.add(Calendar.MONTH, period);
        return calendar.getTime();
    }

}
