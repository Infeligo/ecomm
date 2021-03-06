package ee.ttu.ecomm.events;

import org.eclipse.jetty.websocket.WebSocket;
import org.eclipse.jetty.websocket.WebSocketServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class MonitoringServlet extends WebSocketServlet implements EventProcessor {

    private final Set<MonitoringWebSocket> clients = new CopyOnWriteArraySet<MonitoringWebSocket>();
    private ScheduledExecutorService executorService = Executors.newSingleThreadScheduledExecutor();

    EventListener eventListener;

    @Override
    public void init() throws ServletException {
        System.out.println("Initializing servlet");
        super.init();
        WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
        eventListener = context.getBean(EventListener.class);
        eventListener.addEventProcessor(this);
        //startCheckMessages();
    }

    public void startCheckMessages() {
        executorService.scheduleAtFixedRate(new Runnable() {
            @Override
            public void run() {
                System.out.println("Running Server Message Sending");
                for (MonitoringWebSocket client : clients) {
                    System.out.println("Trying to send to Member!");
                    if (client.isOpen()) {
                        System.out.println("Sending!");
                        try {
                            client.sendMessage("Message sent at " + new Date() + "\n");
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }, 25, 25, TimeUnit.SECONDS);
    }

    @Override
    public void processEvent(String event) {
        System.out.println("Processing event");
        for (MonitoringWebSocket client : clients) {
            if (client.isOpen()) {
                System.out.println("Sending!");
                try {
                    client.sendMessage(event);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public WebSocket doWebSocketConnect(HttpServletRequest request, String s) {
        System.out.println("Received new web-socket connection");
        return new MonitoringWebSocket();
    }


    public class MonitoringWebSocket implements WebSocket.OnTextMessage {

        private Connection connection;

        @Override
        public void onMessage(String s) {
            System.out.println("Received: " + s);
        }

        @Override
        public void onOpen(Connection connection) {
            System.out.println("Opening connection");
            this.connection = connection;
            clients.add(this);
            try {
                connection.sendMessage("Subscribed to monitoring");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        public boolean isOpen() {
            return connection.isOpen();
        }

        public void sendMessage(String s) throws IOException {
            this.connection.sendMessage(s);
        }

        @Override
        public void onClose(int i, String s) {
            clients.remove(this);
        }
    }
}
