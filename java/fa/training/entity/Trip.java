package fa.training.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
public class Trip {
    private int tripId;
    private int bookedTicketNumber;
    private String carType;
    private String departureDate;
    private String departureTime;
    private String destination;
    private String driver;
    private int maxOnlineTickerNumber;
}
