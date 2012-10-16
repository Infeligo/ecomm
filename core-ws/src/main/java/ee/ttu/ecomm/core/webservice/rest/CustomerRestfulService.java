package ee.ttu.ecomm.core.webservice.rest;

import ee.ttu.ecomm.core.domain.Address;
import ee.ttu.ecomm.core.domain.Customer;
import ee.ttu.ecomm.core.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

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
    public List<Customer> findCustomers() {
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

}
