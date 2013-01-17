package ee.ttu.ecomm.events;

public interface EventProcessorHub {

    void addEventProcessor(EventProcessor eventProcessor);
    void removeEventProcessor(EventProcessor eventProcessor);

}
