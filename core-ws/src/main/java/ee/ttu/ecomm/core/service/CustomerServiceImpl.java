package ee.ttu.ecomm.core.service;

import com.avaje.ebean.Ebean;
import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {

    @Override
    public List<Customer> findCustomers() {
        return Ebean.find(Customer.class).findList();
    }

    @Override
    public List<Address> getCustomerAddresses(Long customerId) {
        return Ebean.find(Address.class).findList();
    }
}
