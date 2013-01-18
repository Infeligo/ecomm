package ee.ttu.client.forms.customer;

import java.util.List;

import javax.swing.JDialog;
import javax.swing.SwingUtilities;

import ee.ttu.client.forms.search.SearchDialog;
import ee.ttu.ecomm.client.ClientDatasource;
import ee.ttu.ecomm.client.MainFrame;
import ee.ttu.ecomm.client.domain.Address;
import ee.ttu.ecomm.client.domain.Customer;

public class CustomerDialog extends JDialog {

	private SearchDialog dialog;
	
	private final CustomerPanel customerPanel = new CustomerPanel() {
		@Override public void onSave(final Customer customer, final java.util.List<Address> addresses, final java.util.List<Address> addressesToRemove) {
			MainFrame.getBean(ClientDatasource.class).save(customer, new ClientDatasource.ClientDatasourceCallback<Customer>() {						
				@Override public void onResult(Customer result) {
					SwingUtilities.invokeLater(new Runnable() {
						@Override public void run() {							
							MainFrame.getBean(ClientDatasource.class).saveAddresses(customer, addresses, addressesToRemove, new ClientDatasource.ClientDatasourceCallback<Customer>() {						
								@Override public void onResult(Customer result) {
									SwingUtilities.invokeLater(new Runnable() {
										@Override public void run() {
											dispose();
											if (dialog != null && dialog.isVisible()) {
												dialog.refreshSeachResults();
											}
										}
									});
								}
								@Override public void onError(final String message) {
									SwingUtilities.invokeLater(new Runnable() {							
										@Override public void run() {
											throw new RuntimeException("failed to save address : " + message);
										}
									});
								}
							});
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
	
	public CustomerDialog(Customer existing, SearchDialog dialog) {
		this();
		setTitle("Customer modification");
		customerPanel.refreshUI(existing);
		this.dialog = dialog;
	}

	public void refreshUI(List<Address> result) {
		customerPanel.refreshUI(result);
	}

}
