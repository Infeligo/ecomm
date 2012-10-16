package ee.ttu.ecomm.core.webservice.soap;

import ee.ttu.ecomm.core.service.CustomerService;
import org.springframework.stereotype.Service;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;

import javax.annotation.Resource;

//@Service
public class CustomerSoapService {

    @Resource
    CustomerService customerService;

    @PayloadRoot(namespace = "http://ttu.ee/ecomm/schemas", localPart = "CustomerRequest")
    public Object findCustomers() {
        return customerService.findCustomers();
    }

    public Object getCustomerAddress() {
        return customerService.getCustomerAddresses(null);
    }

}
