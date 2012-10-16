package ee.ttu.ecomm.core.service;

import com.avaje.ebean.Ebean;
import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Override
    public List<Customer> findCustomers() {
        return Ebean.find(Customer.class).findList();
    }

    @Override
    public Customer getCustomerById(long id) {
        return Ebean.find(Customer.class, id);
    }

    @Override
    public List<Address> getCustomerAddresses(Long customerId) {
        return Ebean.find(Address.class).findList();
    }
}
