package fa.training.repository.impl;

import fa.training.entity.BookingOffice;
import fa.training.entity.Department;
import fa.training.entity.Employee;
import fa.training.entity.Trip;
import fa.training.repository.BookingOfficeRepository;
import fa.training.repository.EmployeeRepository;
import fa.training.util.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingOfficeRepositoryImpl extends DBContext implements BookingOfficeRepository {
    public static String getSearchTitle(int typeSearch) {
        switch (typeSearch) {
            case 0:
                return "office_name";
            case 1:
                return "t.destination";
        }
        return null;
    }

    @Override
    public List<BookingOffice> getListBookingOffice(int page, int non, int typeSearch, String txtSearch) {
        List<BookingOffice> list = new ArrayList<>();
        String sql = "select b.*, t.* from booking_office as b inner join trip as t on b.trip_id=t.trip_id " +
                "where " + getSearchTitle(typeSearch) + " like ? " +
                "order by office_id offset ? rows fetch next ? row only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setInt(2, (page - 1) * non);
            st.setInt(3, non);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Trip trip = Trip.builder()
                        .tripId(rs.getInt(9))
                        .bookedTicketNumber(rs.getInt(10))
                        .carType(rs.getString(11))
                        .departureDate(rs.getString(12))
                        .departureTime(rs.getString(13))
                        .destination(rs.getString(14))
                        .driver(rs.getString(15))
                        .maxOnlineTickerNumber(rs.getInt(16))
                        .build();
                BookingOffice bookingOffice = BookingOffice.builder()
                        .officeId(rs.getInt(1))
                        .officeName(rs.getString(2))
                        .officePhone(rs.getString(3))
                        .officePlace(rs.getString(4))
                        .officePrice(rs.getDouble(5))
                        .startContract(rs.getString(6))
                        .endContract(rs.getString(7))
                        .trip(trip)
                        .build();
                list.add(bookingOffice);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalBookingOffice(int typeSearch, String txtSearch) {
        String sql = " SELECT COUNT(*) FROM booking_office as b inner join trip as t on b.trip_id=t.trip_id " +
                "WHERE " + getSearchTitle(typeSearch) + " LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public boolean deleteBookingOffice(int officeId) {
        String sql = "delete from booking_office where office_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, officeId);
            int isSuccess = ps.executeUpdate();
            if (isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public BookingOffice getBookingOfficeById(int id) {
        String sql = "select b.*, t.* from booking_office as b inner join trip as t on b.trip_id=t.trip_id where office_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Trip trip = Trip.builder()
                        .tripId(rs.getInt(9))
                        .bookedTicketNumber(rs.getInt(10))
                        .carType(rs.getString(11))
                        .departureDate(rs.getString(12))
                        .departureTime(rs.getString(13))
                        .destination(rs.getString(14))
                        .driver(rs.getString(15))
                        .maxOnlineTickerNumber(rs.getInt(16))
                        .build();
                return BookingOffice.builder()
                        .officeId(rs.getInt(1))
                        .officeName(rs.getString(2))
                        .officePhone(rs.getString(3))
                        .officePlace(rs.getString(4))
                        .officePrice(rs.getDouble(5))
                        .startContract(rs.getString(6))
                        .endContract(rs.getString(7))
                        .trip(trip)
                        .build();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean updateBookingOffice(BookingOffice bookingOffice) {
        String sql = "UPDATE [booking_office]\n" +
                "   SET [office_name] = ?\n" +
                "      ,[office_phone] = ?\n" +
                "      ,[office_place] = ?\n" +
                "      ,[office_price] = ?\n" +
                "      ,[start_contract_deadline] = ?\n" +
                "      ,[end_contract_deadline] = ?\n" +
                "      ,[trip_id] = ?\n" +
                " WHERE office_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bookingOffice.getOfficeName());
            st.setString(2, bookingOffice.getOfficePhone());
            st.setString(3, bookingOffice.getOfficePlace());
            st.setDouble(4, bookingOffice.getOfficePrice());
            st.setString(5, bookingOffice.getStartContract());
            st.setString(6, bookingOffice.getEndContract());
            st.setInt(7, bookingOffice.getTrip().getTripId());
            st.setInt(8, bookingOffice.getOfficeId());
            int isSuccess = st.executeUpdate();
            if (isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addBookingOffice(BookingOffice bookingOffice) {
        String sql = "INSERT INTO [booking_office]([office_name],[office_phone],[office_place], \n" +
                "[office_price], [start_contract_deadline], [end_contract_deadline],\n" +
                "[trip_id]) VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bookingOffice.getOfficeName());
            st.setString(2, bookingOffice.getOfficePhone());
            st.setString(3, bookingOffice.getOfficePlace());
            st.setDouble(4, bookingOffice.getOfficePrice());
            st.setString(5, bookingOffice.getStartContract());
            st.setString(6, bookingOffice.getEndContract());
            st.setInt(7, bookingOffice.getTrip().getTripId());
            int isSuccess = st.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public static void main(String[] args) {
        BookingOfficeRepository repository = new BookingOfficeRepositoryImpl();
    }
}
