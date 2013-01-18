package ee.ttu.client.forms.customer;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JPanel;

import ee.ttu.ecomm.client.domain.Address;
import ee.ttu.ecomm.client.domain.Customer;

public class CustomerPanel extends JPanel {
	
	private CustomerDetailsPanel customerDetailsPanel = new CustomerDetailsPanel();
	private List<AddressPanel> addressPanels = new ArrayList<AddressPanel>();	
		
	private List<Address> addresses = new ArrayList<Address>();
	private List<Address> addressesToRemove = new ArrayList<Address>();
	
	public CustomerPanel() {
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		add(new ButtonsPanel());
		add(customerDetailsPanel);
	}
	
	public void refreshUI(Customer customer) {
		customerDetailsPanel.refreshUI(customer);
		refreshUI();
	}
	
	public void refreshUI(List<Address> addresses) {
		for (AddressPanel panel: this.addressPanels) {
			remove(panel);
		}
		this.addressPanels.clear();
		
		this.addresses =  addresses;
		for (Address address: addresses) {
			AddressPanel addressPanel = createAddressPanel(address);
			this.addressPanels.add(addressPanel);
			add(addressPanel);
		}
		refreshUI();
	}
	
	public void refreshUI() {
		revalidate();
		repaint();
	}
	
	public void onSave(Customer customer, List<Address> addresses, List<Address> addressesToRemove) {}
	
	private AddressPanel createAddressPanel(Address address) {
		return new AddressPanel(address) {
			@Override public void onDelete(Address address) {
				if (address.getId() != null) {
					addressesToRemove.add(address);
				}
				addressPanels.remove(this);
				CustomerPanel.this.remove(this);
				CustomerPanel.this.refreshUI();
			}
		};
	}
	private class ButtonsPanel extends JPanel {
		
		public ButtonsPanel() {
			setLayout(new FlowLayout(FlowLayout.RIGHT));
			add(createClearButon());
			add(createSaveButon());
			add(createAddAddressButon());
		}
		
		public JButton createClearButon() {
			JButton result = new JButton("Revert");
			result.addActionListener(new ActionListener() {
				@Override public void actionPerformed(ActionEvent e) {
					refreshUI(customerDetailsPanel.getCustomer());
					refreshUI(addresses);
					addressesToRemove.clear();
				}
			});
			return result;
		}
		
		public JButton createSaveButon() {
			JButton result = new JButton("Save");
			result.addActionListener(new ActionListener() {
				@Override public void actionPerformed(ActionEvent e) {
					Customer customer = customerDetailsPanel.getUpdatedCustomer();
					List<Address> addresses = new ArrayList<Address>();
					for (AddressPanel addressPanel: addressPanels) {
						addresses.add(addressPanel.getUpdatedAddress());
					}
					onSave(customer, addresses, addressesToRemove);		
				}
			});
			return result;
		}
		
		public JButton createAddAddressButon() {
			JButton result = new JButton("Add Address");
			result.addActionListener(new ActionListener() {
				@Override public void actionPerformed(ActionEvent e) {
					AddressPanel addressPanel = createAddressPanel(null);
					CustomerPanel.this.add(addressPanel);
					CustomerPanel.this.addressPanels.add(addressPanel);
					refreshUI();
				}
			});
			return result;
		}
	} 
}
