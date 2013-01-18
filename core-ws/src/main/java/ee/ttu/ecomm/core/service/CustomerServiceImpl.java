package ee.ttu.ecomm.core.service;

import com.avaje.ebean.Ebean;
import com.avaje.ebean.ExampleExpression;
import com.avaje.ebean.ExpressionList;
import com.avaje.ebean.Junction;
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
    public List<Address> findAddresses(long customerId) {
        return Ebean.find(Address.class).where().eq("customer", customerId).findList();
    }

    @Override
    public Address getAddress(long customerId, long addressId) {
        return null;
    }

	@Override
	public void saveOrUpdate(Customer customer) {
		if (customer.getId() == null) {
			Ebean.save(customer);
            jmsTemplate.convertAndSend("Created customer " + customer.getFullName() + " (ID=" + customer.getId() + ")");
		} else {
			Ebean.update(customer);
            jmsTemplate.convertAndSend("Updated customer " + customer.getFullName() + " (ID=" + customer.getId() + ")");
		}
	}
	
	@Override
	public void saveOrUpdate(Address address) {
		if (address.getId() == null) {
			Ebean.save(address);
            jmsTemplate.convertAndSend("Saved address ID=" + address.getId() + " for customer ID=" + address.getCustomer());
		} else {
			Ebean.update(address);
            jmsTemplate.convertAndSend("Updated address ID=" + address.getId() + " for customer ID=" + address.getCustomer());
		}
	}
	
    @Override
    public List<Customer> searchCustomers(Customer example) {
        ExpressionList<Customer> query = Ebean.find(Customer.class).where();

        if (example != null) {
        	Junction<Customer> disjunction = query.conjunction();
        	if (org.springframework.util.StringUtils.hasLength(example.getFirstName())) {
        		disjunction.ilike("firstName", "%" + example.getFirstName() + "%");
        	}
        	if (org.springframework.util.StringUtils.hasLength(example.getLastName())) {
        		disjunction.ilike("lastName", "%" + example.getLastName() + "%");
        	}
        	if (org.springframework.util.StringUtils.hasLength(example.getIdentityCode())) {
        		disjunction.ilike("identityCode", "%" + example.getIdentityCode() + "%");
        	}
        	if (example.getBirthDate() != null) {
        		disjunction.eq("birthDate", example.getBirthDate());
        	}
        }        

        return query.findList();
        
    }

	@Override
	public void delete(Address address) {
		Ebean.delete(address);
        jmsTemplate.convertAndSend("Deleted address ID=" + address.getId() + " for customer ID=" + address.getCustomer());
	}

}
