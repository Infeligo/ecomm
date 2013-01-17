package ee.ttu.ecomm.events;

import org.apache.activemq.command.ActiveMQTextMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;
import java.util.HashSet;
import java.util.Set;

public class EventListener implements MessageListener, EventProcessorHub {

    private static final Logger logger = LoggerFactory.getLogger(EventListener.class);

    protected Set<EventProcessor> eventProcessors = new HashSet<EventProcessor>();

    /**
     * Implementation of <code>MessageListener</code>.
     */
    public void onMessage(Message message) {
        logger.info("Got message", message);
        try {
            ActiveMQTextMessage textMessage = (ActiveMQTextMessage)message;
            String msg = textMessage.getText();
            logger.info("Processed message '{}'.  value={}", msg);
            broadcastMessage(msg);

        } catch (JMSException e) {
            logger.error(e.getMessage(), e);
        }
    }

    protected void broadcastMessage(String message) {
        for (EventProcessor eventProcessor : eventProcessors) {
            eventProcessor.processEvent(message);
        }
    }

    @Override
    public void addEventProcessor(EventProcessor eventProcessor) {
        eventProcessors.add(eventProcessor);
    }

    @Override
    public void removeEventProcessor(EventProcessor eventProcessor) {
        eventProcessors.remove(eventProcessor);
    }
}
