package fa.training.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
public class BookingOffice {
    private int officeId;
    private String officeName;
    private String officePhone;
    private String officePlace;
    private double officePrice;
    private String startContract;
    private String endContract;
    private Trip trip;
}
