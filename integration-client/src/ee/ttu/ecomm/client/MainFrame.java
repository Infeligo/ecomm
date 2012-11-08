package ee.ttu.ecomm.client;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

import org.springframework.beans.factory.BeanFactory;

import ee.ttu.client.forms.customer.CustomerDialog;
import ee.ttu.client.forms.search.SearchDialog;

public class MainFrame extends JFrame {
		
	private static BeanFactory FACTORY;
	
	public static <T> T getBean(Class<T> clazz) {
		return FACTORY.getBean(clazz);
	}
	
	public MainFrame(BeanFactory factory) {
		MainFrame.FACTORY = factory;
		
		setLayout(new FlowLayout(FlowLayout.CENTER));
		add(createMainPanel());
	}
	
	
	
	private JPanel createMainPanel() {
		JPanel result = new JPanel();
		result.setLayout(new FlowLayout(FlowLayout.CENTER));
		result.add(createNewCustomerButton());
		result.add(createSearchButton());
		result.setBorder(BorderFactory.createTitledBorder("Choose action to perform"));
		return result;
	}
	
	private JButton createSearchButton() {
		JButton result = new JButton("Search");
		result.addActionListener(new ActionListener() {			
			@Override
			public void actionPerformed(ActionEvent e) {
				new SearchDialog(MainFrame.this).setVisible(true);				
			}
		});		
		return result;
	}
	
	private JButton createNewCustomerButton() {
		JButton result = new JButton("Create customer");
		result.addActionListener(new ActionListener() {			
			@Override
			public void actionPerformed(ActionEvent e) {
				new CustomerDialog();				
			}
		});
		
		return result;
	}

}
