package ee.ttu.client.forms.customer;

import javax.swing.BorderFactory;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SpringLayout;

import net.sourceforge.jdatepicker.JDateComponentFactory;
import net.sourceforge.jdatepicker.JDatePanel;
import net.sourceforge.jdatepicker.impl.UtilDateModel;
import ee.ttu.ecomm.client.SpringUtilities;
import ee.ttu.ecomm.client.domain.Customer;

public class CustomerDetailsPanel extends JPanel {

	private final JLabel firstNameLabel = new JLabel("First name:",
			JLabel.TRAILING);
	private final JTextField firstName = new JTextField(16);

	private final JLabel lastNameLabel = new JLabel("Last Name:",
			JLabel.TRAILING);
	private final JTextField lastName = new JTextField(16);

	private final JLabel identityCodeLabel = new JLabel("Identity Code:",
			JLabel.TRAILING);
	private final JTextField identityCode = new JTextField(16);

	private final JLabel birtDateLabel = new JLabel("Date:", JLabel.TRAILING);
	private final JDatePanel birtDate = JDateComponentFactory
			.createJDatePanel(new UtilDateModel());

	private Customer customer = new Customer();

	public CustomerDetailsPanel() {
		setLayout(new SpringLayout());

		add(firstNameLabel);
		firstNameLabel.setLabelFor(firstName);
		add(firstName);

		add(lastNameLabel);
		lastNameLabel.setLabelFor(lastName);
		add(lastName);

		add(identityCodeLabel);
		identityCodeLabel.setLabelFor(identityCode);
		add(identityCode);

		add(birtDateLabel);
		birtDateLabel.setLabelFor((JComponent) birtDate);
		add((JComponent) birtDate);

		setBorder(BorderFactory.createTitledBorder("Details"));
		SpringUtilities.makeCompactGrid(this, 4, 2, 0, 0, 10, 10);
	}

	public Customer getCustomer() {
		return customer;
	}
	
	public Customer getUpdatedCustomer() {
		Customer result = new Customer();
		result.setId(getCustomer().getId());
		result.setFirstName(firstName.getText());
		result.setLastName(lastName.getText());
		result.setIdentityCode(identityCode.getText());
		result.setBirthDate(((UtilDateModel) birtDate.getModel()).getValue());
		return result;
	}

	public void refreshUI(Customer customer) {
		this.customer = customer;
		firstName.setText(customer.getFirstName());
		lastName.setText(customer.getLastName());
		identityCode.setText(customer.getIdentityCode());		
		((UtilDateModel) birtDate.getModel()).setValue(customer.getBirthDate());
	}
}
