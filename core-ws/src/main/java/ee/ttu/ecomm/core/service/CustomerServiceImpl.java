package ee.ttu.ecomm.core.service;

import com.avaje.ebean.Ebean;
import com.avaje.ebean.ExampleExpression;
import com.avaje.ebean.ExpressionList;
import com.avaje.ebean.validation.NotNull;
import com.avaje.ebeaninternal.server.expression.DefaultExampleExpression;
import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.ExpressionState;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    JmsTemplate jmsTemplate;

    @Override
    public List<Customer> findCustomers(Customer example) {
        if (example == null) throw new IllegalArgumentException("Example can not be bull");
        return Ebean.find(Customer.class).where().iexampleLike(example).findList();
    }

    @Override
    public List<Customer> findCustomers(String search) {
        if (search == null) search = "";

        String[] searchTokens = search.split(" ");
        ExpressionList<Customer> query = Ebean.find(Customer.class).where();

        for (String searchToken : searchTokens) {
            String s = searchToken.trim();
            if (s.length() == 0) continue;
            query.disjunction()
                .ilike("firstName", s.trim() + "%")
                .ilike("lastName", s.trim() + "%")
                .endJunction();
        }

        return query.findList();
    }

    @Override
    public Customer getCustomer(long id) {
        return Ebean.find(Customer.class, id);
    }

    @Override
    public void saveCustomer(Customer customer) {
        boolean isNew = customer.getId() == null;
        Ebean.save(customer);
        if (isNew) {
            jmsTemplate.convertAndSend("Created customer " + customer.getFullName() + " (ID=" + customer.getId() + ")");
        } else {
            jmsTemplate.convertAndSend("Updated customer " + customer.getFullName() + " (ID=" + customer.getId() + ")");
        }
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
        jmsTemplate.convertAndSend("Saved address ID=" + address.getId() + " for customer ID=" + customerId);
    }

    @Override
    public void deleteAddress(long customerId, long addressId) {
        Address address = getAddress(customerId, addressId);
        Ebean.delete(address);
        jmsTemplate.convertAndSend("Deleted address ID=" + addressId + " for customer ID=" + customerId);
    }

}
