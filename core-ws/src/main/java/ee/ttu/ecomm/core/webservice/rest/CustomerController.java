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
    
    @RequestMapping(value = "/search", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<Customer> searchCustomers(@RequestBody Customer customer) {
        return customerService.searchCustomers(customer);
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Customer saveOrUpdate(@RequestBody Customer customer) {
    	customerService.saveOrUpdate(customer);
        return customer;
    }
        
    @RequestMapping(value = "/{customerId}/addresses/update", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Address saveOrUpdate(@PathVariable("customerId") long customerId, @RequestBody Address address) {
    	address.setCustomer(customerId);
    	customerService.saveOrUpdate(address);
        return address;
    }
    
    @RequestMapping(value = "/{customerId}/addresses/delete", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Address deleteAddress(@RequestBody Address address) {
    	customerService.delete(address);
    	return address;
    }
    

}
