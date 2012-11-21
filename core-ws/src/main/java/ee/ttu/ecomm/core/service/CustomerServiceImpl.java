package ee.ttu.ecomm.core.service;

import com.avaje.ebean.Ebean;
import com.avaje.ebean.ExampleExpression;
import com.avaje.ebean.ExpressionList;
import com.avaje.ebean.validation.NotNull;
import com.avaje.ebeaninternal.server.expression.DefaultExampleExpression;
import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Override
    public List<Customer> findCustomers(Customer example) {
        if (example == null) throw new IllegalArgumentException("Example can not be bull");
        return Ebean.find(Customer.class).where().iexampleLike(example).findList();
    }

    @Override
    public Customer getCustomer(long id) {
        return Ebean.find(Customer.class, id);
    }

    @Override
    public void saveCustomer(Customer customer) {
        Ebean.save(customer);
    }

    @Override
    public List<Address> findAddresses(long customerId) {
        return Ebean.find(Address.class).where().eq("customer", customerId).findList();
    }

    @Override
    public Address getAddress(long customerId, long addressId) {
        return null;
    }

    @Override
    public void saveAddress(long customerId, Address address) {
        Ebean.save(address);
    }

    @Override
    public void deleteAddress(long customerId, long addressId) {
        Address address = getAddress(customerId, addressId);
        Ebean.delete(address);
    }

}
