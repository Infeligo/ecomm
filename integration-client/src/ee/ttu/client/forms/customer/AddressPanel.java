package ee.ttu.client.forms.customer;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SpringLayout;

import ee.ttu.ecomm.client.SpringUtilities;
import ee.ttu.ecomm.client.domain.Address;

public class AddressPanel extends JPanel {

	private Address addressItem = new Address();

	private final JLabel zipLabel = new JLabel("Zip:", JLabel.TRAILING);
	private final JTextField zip = new JTextField(16);

	private final JLabel houseLabel = new JLabel("House:", JLabel.TRAILING);
	private final JTextField house = new JTextField(16);

	private final JLabel addressLabel = new JLabel("Address:", JLabel.TRAILING);
	private final JTextField address = new JTextField(16);

	private final JLabel countryLabel = new JLabel("Country:", JLabel.TRAILING);
	private final JTextField country = new JTextField(16);

	public AddressPanel() {
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		add(createButtonsPanel());
		add(createMainPanel());
		setBorder(BorderFactory.createTitledBorder("Address"));
	}

	public AddressPanel(Address address) {
		this();
		if (address != null) {
			addressItem = address;
			refreshUI(address);	
		}
	}

	public void refreshUI(Address addressItem) {
		zip.setText(addressItem.getZip());
		house.setText(addressItem.getHouse());
		address.setText(addressItem.getAddress());
		country.setText(addressItem.getCountry());
	}
	
	public Address getUpdatedAddress() {
		Address result = new Address();
		result.setZip(zip.getText());
		result.setHouse(house.getText());
		result.setAddress(address.getText());
		result.setCountry(country.getText());
		return result;
	}
	
	public void onDelete(Address address) {}

	private JPanel createButtonsPanel() {
		JPanel result = new JPanel();
		result.setLayout(new FlowLayout(FlowLayout.RIGHT));
		JButton deleteButton = new JButton("X"); 
		deleteButton.addActionListener(new ActionListener() {			
			@Override public void actionPerformed(ActionEvent e) {
				onDelete(addressItem);
			}
		});
		result.add(deleteButton);
		return result;
	}

	private JPanel createMainPanel() {
		JPanel result = new JPanel();
		result.setLayout(new SpringLayout());

		result.add(zipLabel);
		zipLabel.setLabelFor(zip);
		result.add(zip);

		result.add(houseLabel);
		houseLabel.setLabelFor(house);
		result.add(house);

		result.add(addressLabel);
		addressLabel.setLabelFor(address);
		result.add(address);

		result.add(countryLabel);
		countryLabel.setLabelFor(country);
		result.add(country);

		SpringUtilities.makeCompactGrid(result, 4, 2, 0, 0, 10, 10);
		return result;
	}
}
