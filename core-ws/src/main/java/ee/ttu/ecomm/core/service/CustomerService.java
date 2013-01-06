package ee.ttu.ecomm.core.service;

import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;

import java.util.List;

public interface CustomerService {

    List<Customer> findCustomers(Customer example);

    List<Customer> findCustomers(String query);

    Customer getCustomer(long id);

    void saveCustomer(Customer customer);

    List<Address> findAddresses(long customerId);

    Address getAddress(long customerId, long addressId);

    void saveAddress(long customerId, Address address);

    void deleteAddress(long customerId, long addressId);

}
