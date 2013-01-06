package ee.ttu.ecomm.core.webservice.soap;

import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;
import ee.ttu.ecomm.core.service.CustomerService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import java.util.List;

@Component
@WebService(serviceName = "CustomerService")
public class CustomerEndpoint {

    @Resource
    CustomerService customerService;

    @WebMethod
    public List<Customer> findCustomers(@WebParam(name = "query") String query) {
        return customerService.findCustomers(query);
    }

    @WebMethod
    public Customer getCustomer(@WebParam(name = "id") long customerId) {
        return customerService.getCustomer(customerId);
    }

    @WebMethod
    public List<Address> findAddresses(@WebParam(name = "customerId") long customerId) {
        return customerService.findAddresses(customerId);
    }

    @WebMethod
    public Address getAddress(@WebParam(name = "customerId") long customerId,
                              @WebParam(name = "addressId") long addressId) {
        return customerService.getAddress(customerId, addressId);
    }

}
