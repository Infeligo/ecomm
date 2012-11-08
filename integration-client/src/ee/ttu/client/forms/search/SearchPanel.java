package ee.ttu.client.forms.search;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JPanel;

import ee.ttu.client.forms.customer.CustomerDetailsPanel;
import ee.ttu.ecomm.client.domain.Customer;

public class SearchPanel extends JPanel {	
	
	private final CustomerDetailsPanel customerDetailsPanel;
	public SearchPanel() {
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		
		add(customerDetailsPanel = createSearchPanelMain());
		add(createSearchPanelButtons());
	}	
	
	public void doSearch(Customer example) {}	
	
	private JPanel createSearchPanelButtons() {
		JPanel result = new JPanel();
		result.setLayout(new FlowLayout(FlowLayout.RIGHT));
		JButton searchBtn = new JButton("Search");
		searchBtn.addActionListener(new ActionListener() {			
			@Override public void actionPerformed(ActionEvent e) {
				doSearch(customerDetailsPanel.getUpdatedCustomer());
			}			
		});
		result.add(searchBtn);
		return result;
	}
	
	private CustomerDetailsPanel createSearchPanelMain() {
		return new CustomerDetailsPanel();
	}
		
}
