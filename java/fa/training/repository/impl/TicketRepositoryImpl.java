package fa.training.repository.impl;

import fa.training.entity.Car;
import fa.training.entity.Ticket;
import fa.training.entity.Trip;
import fa.training.repository.TicketRepository;
import fa.training.util.DBContext;
import fa.training.util.Time;

import java.util.ArrayList;
import java.util.List;

public class TicketRepositoryImpl extends DBContext implements TicketRepository {
    public static String getSearchTitle(int typeSearch) {
        switch (typeSearch) {
            case 0:
                return "customer_name";
            case 1:
                return "destination";
            case 2:
                return "C.license_plate";
            case 3:
                return "booking_time";
        }
        return null;
    }


    @Override
    public List<Ticket> getListTicket(int page, int non, int typeSearch, String txtSearch) {
        List<Ticket> listTickets = new ArrayList<>();
        String sql = "SELECT \n" +
                "\tTR.*,\n" +
                "\tTI.ticket_id,\n" +
                "\tTI.booking_time,\n" +
                "\tTI.customer_name,\n" +
                "\tC.*\n" +
                "FROM ticket AS TI JOIN trip AS TR\n" +
                "\tON TI.trip_id = TR.trip_id\n" +
                "JOIN car AS C ON C.license_plate = TI.license_plate\n" +
                "WHERE " + getSearchTitle(typeSearch) + " LIKE ?\n" +
                "ORDER BY ticket_id OFFSET ? ROWS FETCH NEXT ? ROW ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, (page - 1) * non);
            ps.setInt(3, non);

            rs = ps.executeQuery();
            while (rs.next()) {
                Trip trip = Trip.builder()
                        .tripId(rs.getInt(1))
                        .destination(rs.getString(6))
                        .departureDate(rs.getString(4))
                        .departureTime(Time.formatTime(rs.getString(5)))
                        .driver(rs.getString(7))
                        .carType(rs.getString(3))
                        .maxOnlineTickerNumber(rs.getInt(8))
                        .build();

                Car car = Car.builder()
                        .licensePlate(rs.getString(12))
                        .carType(rs.getString(14))
                        .carColor(rs.getString(13))
                        .company(rs.getString(15))
                        .build();

                Ticket ticket = Ticket.builder()
                        .ticketId(rs.getInt(9))
                        .bookingTime(Time.formatTime(rs.getString(10)))
                        .customerName(rs.getString(11))
                        .car(car)
                        .trip(trip)
                        .build();
                listTickets.add(ticket);
            }
            return listTickets;
        } catch (Exception e) {
            e.printStackTrace();

        }
        return null;
    }

    @Override
    public int getAllTicketTotal(int typeSearch, String txtSearch) {
        String query = "SELECT COUNT(*) FROM ticket AS TI JOIN trip AS TR\n" +
                "\tON TI.trip_id = TR.trip_id\n" +
                "JOIN car AS C ON C.license_plate = TI.license_plate\n" +
                "WHERE " + getSearchTitle(typeSearch) + " LIKE ?";


        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean deleteTicket(int ticket_id) {
        String sql = "DELETE FROM ticket WHERE ticket_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, ticket_id);
            return ps.executeUpdate() == 1 ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean addTicket(Ticket ticket) {

        String query = "INSERT INTO [dbo].[ticket]\n" +
                "           ([booking_time]\n" +
                "           ,[customer_name]\n" +
                "           ,[license_plate]\n" +
                "           ,[trip_id])\n" +
                "     VALUES (?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, ticket.getBookingTime());
            ps.setString(2, ticket.getCustomerName());
            ps.setString(3, ticket.getCar().getLicensePlate());
            ps.setInt(4, ticket.getTrip().getTripId());
            return ps.executeUpdate() == 1 ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Ticket getTicketById(int ticketId) {
        String query = "SELECT \n" +
                "\tTR.*,\n" +
                "\tTI.ticket_id,\n" +
                "\tTI.booking_time,\n" +
                "\tTI.customer_name,\n" +
                "\tC.*\n" +
                "FROM ticket AS TI JOIN trip AS TR\n" +
                "\tON TI.trip_id = TR.trip_id\n" +
                "JOIN car AS C ON C.license_plate = TI.license_plate\n" +
                "WHERE TI.ticket_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, ticketId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Trip trip = Trip.builder()
                        .tripId(rs.getInt(1))
                        .destination(rs.getString(6))
                        .departureDate(rs.getString(4))
                        .departureTime(Time.formatTime(rs.getString(5)))
                        .driver(rs.getString(7))
                        .carType(rs.getString(3))
                        .maxOnlineTickerNumber(rs.getInt(8))
                        .build();

                Car car = Car.builder()
                        .licensePlate(rs.getString(12))
                        .carType(rs.getString(14))
                        .carColor(rs.getString(13))
                        .company(rs.getString(15))
                        .build();

                Ticket ticket = Ticket.builder()
                        .ticketId(rs.getInt(9))
                        .bookingTime(Time.formatTime(rs.getString(10)))
                        .customerName(rs.getString(11))
                        .car(car)
                        .trip(trip)
                        .build();
                return ticket;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updateTicket(Ticket ticket) {
        String query = "UPDATE [dbo].[ticket]\n" +
                "   SET [booking_time] = ?\n" +
                "      ,[customer_name] = ?\n" +
                "      ,[license_plate] = ?\n" +
                "      ,[trip_id] = ?\n" +
                " WHERE ticket_id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, ticket.getBookingTime());
            ps.setString(2, ticket.getCustomerName());
            ps.setString(3, ticket.getCar().getLicensePlate());
            ps.setInt(4, ticket.getTrip().getTripId());
            ps.setInt(5, ticket.getTicketId());
            return ps.executeUpdate() == 1 ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static void main(String[] args) {
        TicketRepository repository = new TicketRepositoryImpl();
        Ticket ticket=Ticket.builder()
                .customerName("abc")
                .bookingTime("08:30:00.0000000")
                .car(Car.builder().licensePlate("58668-2771").build())
                .trip(Trip.builder().tripId(111).build())
                .build();
        System.out.println(repository.addTicket(ticket));

//        t.getListTicket(1, 10, 1, "3", null).forEach(System.out::println);
//        System.out.println(t.getNumberofTickets(0,"",null));
//        t.deleteTicket(3);
//        System.out.println(t.getTicketById(8));
//        System.out.println(t.getLicense(8));
//        System.out.println(t.getTripId(8));
//        System.out.println(t.getLicense(8));
//        t.update("","duy123","15370-036",1,8);

//        repository.getListTicket(1, 10, 1, "").forEach(System.out::println);
//        System.out.println(repository.getAllTicketTotal(1, ""));
//        System.out.println(repository.getTicketById(1));
    }
}
