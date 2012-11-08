package ee.ttu.ecomm.client.domain;

import java.util.Date;

public interface Logged {

    Date getCreated();

    void setCreated(Date created);

    public Date getUpdated();

    public void setUpdated(Date updated);
}
