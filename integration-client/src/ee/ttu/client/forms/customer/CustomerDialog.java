package ee.ttu.client.forms.customer;

import java.util.List;

import javax.swing.JDialog;
import javax.swing.SwingUtilities;

import ee.ttu.ecomm.client.ClientDatasource;
import ee.ttu.ecomm.client.MainFrame;
import ee.ttu.ecomm.client.domain.Address;
import ee.ttu.ecomm.client.domain.Customer;

public class CustomerDialog extends JDialog {

	private final CustomerPanel customerPanel = new CustomerPanel() {
		@Override public void onSave(Customer customer, java.util.List<Address> addresses) {
			MainFrame.getBean(ClientDatasource.class).save(customer, new ClientDatasource.ClientDatasourceCallback<Customer>() {						
				@Override public void onResult(Customer result) {
					SwingUtilities.invokeLater(new Runnable() {							
						@Override public void run() {
							dispose();
						}
					});							
				}						
				@Override public void onError(final String message) {
					SwingUtilities.invokeLater(new Runnable() {							
						@Override public void run() {
							throw new RuntimeException("failed to save customer : " + message);
						}
					});
				}
			});
		};
		@Override public void refreshUI() {
			super.refreshUI();
			CustomerDialog.this.pack();
		};
	};
	
	public CustomerDialog() {
		setResizable(false);
		add(customerPanel);
		pack();
		setTitle("Customer creation");
		setVisible(true);
	}
	
	public CustomerDialog(Customer existing) {
		this();
		setTitle("Customer modification");
		customerPanel.refreshUI(existing);		
	}

	public void refreshUI(List<Address> result) {
		customerPanel.refreshUI(result);
	}

}
