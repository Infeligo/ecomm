package ee.ttu.ecomm.core.service;

import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;

import java.util.List;

public interface CustomerService {

    List<Customer> findCustomers(Customer example);

    List<Customer> findCustomers(String query);

    Customer getCustomer(long id);

    List<Address> findAddresses(long customerId);

    Address getAddress(long customerId, long addressId);
    
    
    public List<Customer> searchCustomers(Customer example);
    void saveOrUpdate(Customer customer);    
    void saveOrUpdate(Address address);
    void delete(Address address);
    

}
