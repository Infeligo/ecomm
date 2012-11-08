package ee.ttu.ecomm.client;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import javax.swing.WindowConstants;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext appContext = new ClassPathXmlApplicationContext(
				new String[] { "app-context.xml" });
		final BeanFactory factory = (BeanFactory) appContext;

		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				final MainFrame frame = new MainFrame(factory);
				Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
					public void uncaughtException(Thread t, Throwable e) {
						new AWTExceptionHandler().handle(frame, e);
					}
				});

				frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
				frame.pack();
				frame.setVisible(true);
			}
		});

	}

	public static class AWTExceptionHandler {
		public void handle(JFrame frame, Throwable t) {
			try {
				JOptionPane.showMessageDialog(frame,
						"Error: " + t.getMessage(), "Error",
						JOptionPane.ERROR_MESSAGE);
			} catch (Throwable tt) {
				// don't let the exception get thrown out, will cause infinite
				// looping!
			}
		}
	}
}
