package ee.ttu.ecomm.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJacksonHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import ee.ttu.ecomm.client.domain.Address;
import ee.ttu.ecomm.client.domain.Customer;

public class SpringRestClient {
	
    private RestTemplate restTemplate;
    private String url = "http://localhost:8080/core-ws";            

    public void setRestTemplate(RestTemplate template) {
    	restTemplate = template;
    }
    
    public void setUrl(String url) {
    	this.url = url;
    }
    
    public List<Customer> getCustomers() {
        return restTemplate.getForObject(url  + "/customers", CustomerList.class, new HashMap<String, String>());
    }
    
    public List<Address> getAddresses(Customer customer) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("id", String.valueOf(customer.getId()));
    	return restTemplate.getForObject(url  + "/customers/{id}/addresses", AddressesList.class, map);
    }
    
    public Customer save(Customer customer) {
    	Map<String, String> map = new HashMap<String, String>();
    	return restTemplate.postForObject(url  + "/customers/update", customer, Customer.class);
    }
    

    
    

//    private void initialize(){
//        restTemplate = new RestTemplate();
//
//        List<HttpMessageConverter<?>> mc = restTemplate.getMessageConverters();
//        //now we need to call the Jasckon Message Convert and we need to instaciate it
//	MappingJacksonHttpMessageConverter json = new MappingJacksonHttpMessageConverter();
//        
//        //we inform now whart media type the Jackson JSON Message converter must be convert
//	List<MediaType> supportedMediaTypes = new ArrayList<MediaType>();
//        supportedMediaTypes.add(new MediaType("text","javascript"));
//	json.setSupportedMediaTypes(supportedMediaTypes);
//	mc.add(json);
//	//it's tyme to add the Jackson Message Convert to the Spring RestTemplate
//        restTemplate.setMessageConverters(mc);
//   }
    
    
    public static class CustomerList extends ArrayList<Customer> {}
    public static class AddressesList extends ArrayList<Address> {}
    
}