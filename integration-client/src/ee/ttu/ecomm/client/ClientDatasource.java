package ee.ttu.ecomm.client;

import java.util.List;

import ee.ttu.ecomm.client.domain.Address;
import ee.ttu.ecomm.client.domain.Customer;

public class ClientDatasource {
	
	private SpringRestClient springRestClient;
	
	public void setSpringRestClient(SpringRestClient springRestClient) {
		this.springRestClient = springRestClient;
	}

	public void fetch(Customer example, ClientDatasourceCallback<List<Customer>> callBack) {
		try {
			callBack.onResult(springRestClient.getCustomers(example));	
		} catch (Exception e) {
			callBack.onError(e.getMessage());
		}
	}
	
	public void fetchAddresses(Customer customer, ClientDatasourceCallback<List<Address>> callBack) {
		try {
			callBack.onResult(springRestClient.getAddresses(customer));	
		} catch (Exception e) {
			callBack.onError(e.getMessage());
		}
	}
		
	public void save(Customer customer, ClientDatasourceCallback<Customer> callBack) {
		try {
			springRestClient.save(customer);
			callBack.onResult(customer);
		} catch (Exception e) {
			callBack.onError(e.getMessage());
		}
	}
	
	public void saveAddresses(Customer customer, List<Address> addresses, List<Address> addresseToRemove, ClientDatasourceCallback<Customer> callBack) {
		for (Address address: addresses) {
			try {
				springRestClient.save(customer, address);	
			} catch (Exception e) {
				callBack.onError(e.getMessage());
			}
		} 
		for (Address address: addresseToRemove) {
			try {
				springRestClient.deleteAddress(customer, address);	
			} catch (Exception e) {
				callBack.onError(e.getMessage());
			}
		} 		
		callBack.onResult(customer);
	}
	
	
	public static interface ClientDatasourceCallback<T> {
		public void onError(String message);
		public void onResult(T result);
	} 
}
