package ee.ttu.ecomm.core.webservice.rest;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;
import ee.ttu.ecomm.core.service.CustomerService;

/**
 * RESTful webservice adapter implemented as Spring MVC controller
 */
@Controller
@RequestMapping("customers")
public class CustomerRestfulService {

    @Resource
    CustomerService customerService;

    @RequestMapping(value = "", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Customer> findCustomers(String name) {
        return customerService.findCustomers();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public Customer getCustomerById(@PathVariable("id") long customerId) {
        return customerService.getCustomerById(customerId);
    }

    @RequestMapping(value = "/{id}/addresses", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Address> getCustomerAddresses(@PathVariable("id") long customerId) {
        return customerService.getCustomerAddresses(customerId);
    }
    
    
    @RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Customer updateCustomer(@RequestBody Customer customer) {
    	customerService.saveOrUpdate(customer);
        return customer;
    }    

}
