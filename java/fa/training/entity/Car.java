package fa.training.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
public class Car {
    private String licensePlate;
    private String carColor;
    private String carType;
    private String company;
    private ParkingLot park;
}
