package ee.ttu.ecomm.core.service;

import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;

import java.util.List;

public interface CustomerService {

    List<Customer> findCustomers();
    List<Address> getCustomerAddresses(Long customerId);

}