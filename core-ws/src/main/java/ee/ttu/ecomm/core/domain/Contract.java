package ee.ttu.ecomm.core.domain;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "CONTRACT")
public class Contract extends Logged {

    String contractNumber;
    String name;
    String description;
    Date validFrom;
    Date validTo;
    String note;
    BigDecimal valueAmount;

}
