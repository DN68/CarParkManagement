package fa.training.repository;

import fa.training.entity.BookingOffice;
import fa.training.entity.Employee;

import java.util.List;

public interface BookingOfficeRepository {
//    public List<BookingOffice> getListBookingOffice(int page, int non, int typeSearch, String txtSearch,
//                                                int employeeId, int departmentId);

    public List<BookingOffice> getListBookingOffice(int page, int non, int typeSearch, String txtSearch);

    public int getTotalBookingOffice(int typeSearch, String txtSearch);

    public boolean deleteBookingOffice(int officeId);

    public BookingOffice getBookingOfficeById(int id);

    public boolean updateBookingOffice(BookingOffice bookingOffice);

    public boolean addBookingOffice(BookingOffice bookingOffice);

}
