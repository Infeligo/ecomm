package ee.ttu.ecomm.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import ee.ttu.ecomm.client.domain.Address;
import ee.ttu.ecomm.client.domain.Customer;

public class SpringRestClient {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
    private RestTemplate restTemplate;
    private String url = "http://localhost:8080/core-ws";            

    public void setRestTemplate(RestTemplate template) {
    	restTemplate = template;
    }
    
    public void setUrl(String url) {
    	this.url = url;
    }
    
    public List<Customer> getCustomers(Customer example) {
    	return restTemplate.postForObject(url  + "/customers/search", example, CustomerList.class);
    }
    
    public List<Address> getAddresses(Customer customer) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("id", String.valueOf(customer.getId()));
    	return restTemplate.getForObject(url  + "/customers/{id}/addresses/", AddressesList.class, map);
    }
    
    public Customer save(Customer customer) {    	
    	return restTemplate.postForObject(url  + "/customers/update", customer, Customer.class);    	
    }
    
    public Address save(Customer customer, Address address) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("id", String.valueOf(customer.getId()));
    	return restTemplate.postForObject(url  + "/customers/{id}/addresses/update", address, Address.class, map);    	
    }
    
    public Address deleteAddress(Customer customer, Address address) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("id", String.valueOf(customer.getId()));
    	return restTemplate.postForObject(url  + "/customers/{id}/addresses/delete", address, Address.class, map);   	
    }
    
	/** Returns the message body converters. These converters are used to convert from and to HTTP requests and responses. */
	private List<HttpMessageConverter<?>> getMessageConverters() {
		return restTemplate.getMessageConverters();
	}
    
    public static class CustomerList extends ArrayList<Customer> {}
    public static class AddressesList extends ArrayList<Address> {}
    
}