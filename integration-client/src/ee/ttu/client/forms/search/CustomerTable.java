package ee.ttu.client.forms.search;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Date;
import java.util.List;

import javax.swing.JTable;
import javax.swing.event.TableModelListener;
import javax.swing.table.TableModel;

import ee.ttu.ecomm.client.domain.Customer;

public class CustomerTable extends JTable {

	public CustomerTable(final List<Customer> customers) {		
		setModel(new TableModel() {
			@Override
			public void setValueAt(Object aValue, int rowIndex, int columnIndex) { 
			}
			
			@Override
			public void removeTableModelListener(TableModelListener l) {
			}
			
			@Override
			public boolean isCellEditable(int rowIndex, int columnIndex) {
				return false;
			}
			
			@Override
			public Object getValueAt(int rowIndex, int columnIndex) {
				Customer c = customers.get(rowIndex);
				switch (columnIndex) {
					case 0: return c.getFirstName();
					case 1: return c.getLastName();
					case 2: return c.getIdentityCode();
					case 3: return c.getBirthDate();
				}
				return null;
			}
			
			@Override
			public int getRowCount() {
				return customers.size();
			}
			
			@Override
			public String getColumnName(int columnIndex) {
				switch (columnIndex) {
				case 0: return "First name";
				case 1: return "Last name";
				case 2: return "Identification Code";
				case 3: return "Birth date";
				}
				return null;
			}
			
			@Override
			public int getColumnCount() {
				return 4;
			}
			
			@Override
			public Class<?> getColumnClass(int columnIndex) {
				switch (columnIndex) {
					case 0: return String.class;
					case 1: return String.class;
					case 2: return String.class;
					case 3: return Date.class;
				}
				return String.class;
			}
			
			@Override
			public void addTableModelListener(TableModelListener l) {
				
			}
		});
		
		addMouseListener(new MouseAdapter() {
			@Override public void mouseClicked(MouseEvent e) {
				if (e.getClickCount() == 2) {
					int selectedRow = CustomerTable.this.getSelectedRow();
					Customer customer = customers.get(selectedRow);
					onCustomerSelection(customer);
				}
			}
		});
	}
	
	public void onCustomerSelection(Customer example) {}
	
	
}
