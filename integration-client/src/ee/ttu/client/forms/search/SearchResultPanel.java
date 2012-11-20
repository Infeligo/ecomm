package ee.ttu.client.forms.search;

import java.util.List;

import javax.swing.BorderFactory;
import javax.swing.JPanel;

import ee.ttu.ecomm.client.domain.Customer;

public class SearchResultPanel extends JPanel {

	public void onCustomerSelection(Customer example) {
	}

	public void refreshUI(final List<Customer> result) {
		removeAll();
		add(new CustomerTable(result) {
			@Override
			public void onCustomerSelection(Customer example) {
				SearchResultPanel.this.onCustomerSelection(example);
			}
		});
		setBorder(BorderFactory.createTitledBorder("Customers"));
		revalidate();
		repaint();
	}

}
