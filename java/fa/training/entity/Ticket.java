package fa.training.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
public class Ticket {
    private int ticketId;
    private String bookingTime;
    private String customerName;
    private Car car;
    private Trip trip;
}
