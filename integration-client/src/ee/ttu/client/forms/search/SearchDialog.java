package ee.ttu.client.forms.search;

import java.awt.BorderLayout;
import java.util.List;

import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.SwingUtilities;

import ee.ttu.client.forms.customer.CustomerDialog;
import ee.ttu.ecomm.client.ClientDatasource;
import ee.ttu.ecomm.client.MainFrame;
import ee.ttu.ecomm.client.domain.Address;
import ee.ttu.ecomm.client.domain.Customer;

public class SearchDialog extends JDialog {
		  
	private final SearchPanel searchPanel;
	private final SearchResultPanel searchResultPanel;
	
	public SearchDialog(JFrame owner) {
		super(owner);
		setTitle("Search");
		setLayout(new BorderLayout());
		add(searchPanel = createSearchPanel(), BorderLayout.NORTH);
		add(searchResultPanel = createSearchResultPanel(), BorderLayout.SOUTH);
		pack();
	}
	
	public void refreshSeachResults() {
		searchPanel.forceSearch();
	}
	
	private SearchPanel createSearchPanel() {
		return new SearchPanel() {			
			@Override public void doSearch(Customer example) {
				MainFrame.getBean(ClientDatasource.class).fetch(example, new ClientDatasource.ClientDatasourceCallback<List<Customer>>() {						
					@Override public void onResult(final List<Customer> result) {
						SwingUtilities.invokeLater(new Runnable() {							
							@Override public void run() {
								searchResultPanel.refreshUI(result);
								pack();
							}
						});						
					}						
					@Override public void onError(final String message) {
						SwingUtilities.invokeLater(new Runnable() {							
							@Override public void run() {
								throw new RuntimeException("failed to perform search : " + message);
							}
						});
					}
				});
				
			}
		};
	}
	
	
	private SearchResultPanel createSearchResultPanel() {
		return new SearchResultPanel() {			
			@Override
			public void onCustomerSelection(Customer customer) {
				final CustomerDialog customerDialog = new CustomerDialog(customer, SearchDialog.this);
				customerDialog.setVisible(true);
				customerDialog.toFront();
				MainFrame.getBean(ClientDatasource.class).fetchAddresses(customer, new ClientDatasource.ClientDatasourceCallback<List<Address>>() {					
					@Override
					public void onResult(List<Address> result) {
						customerDialog.refreshUI(result);
					}
					@Override
					public void onError(String message) {						
						throw new RuntimeException("failed to get addresses : " + message);
					}
				});
			}
		};
		
	}
	

}
