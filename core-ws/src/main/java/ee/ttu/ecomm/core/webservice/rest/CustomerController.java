package ee.ttu.ecomm.core.webservice.rest;

import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;
import ee.ttu.ecomm.core.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * RESTful webservice adapter implemented as Spring MVC controller
 */
@Controller
@RequestMapping("customers")
public class CustomerController {

    @Resource
    CustomerService customerService;

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Customer> findCustomers(Customer customer) {
        return customerService.findCustomers(customer);
    }

    @RequestMapping(value = "/{customerId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public Customer getCustomer(@PathVariable("customerId") long customerId) {
        return customerService.getCustomer(customerId);
    }

    @RequestMapping(value = "/", method = RequestMethod.POST, produces = "application/json")
    public void createCustomer(@RequestBody Customer customer) {
        customerService.saveCustomer(customer);
    }

    @RequestMapping(value = "/{customerId}", method = RequestMethod.PUT, produces = "application/json")
    public void updateCustomer(@PathVariable("customerId") long customerId, @RequestBody Customer customer) {
        customer.setId(customerId);
        customerService.saveCustomer(customer);
    }

    @RequestMapping(value = "/{customerId}/addresses", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Address> findAddresses(@PathVariable("customerId") long customerId) {
        return customerService.findAddresses(customerId);
    }

    @RequestMapping(value = "/{customerId}/addresses/{addressId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public Address getAddress(@PathVariable("customerId") long customerId, @PathVariable("addressId") long addressId) {
        return customerService.getAddress(customerId, addressId);
    }

    @RequestMapping(value = "/{customerId}/addresses/", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public void createAddress(@PathVariable("customerId") long customerId, @RequestBody Address address) {
        customerService.saveAddress(customerId, address);
    }

    @RequestMapping(value = "/{customerId}/addresses/{addressId}", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public void updateAddress(@PathVariable("customerId") long customerId, @PathVariable("addressId") long addressId, @RequestBody Address address) {
        address.setId(addressId);
        customerService.saveAddress(customerId, address);
    }

}
