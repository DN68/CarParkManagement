package fa.training.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
public class ParkingLot {
    private int parkId;
    private int parkQuantity;
    private int parkArea;
    private String parkName;
    private String parkPlace;
    private double parkPrice;
    private int parkStatus;
    private int parkNumber;
}
