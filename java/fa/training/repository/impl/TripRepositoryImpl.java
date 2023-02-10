package fa.training.repository.impl;

import fa.training.entity.Trip;
import fa.training.repository.TripRepository;
import fa.training.util.DBContext;
import fa.training.util.Time;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TripRepositoryImpl extends DBContext implements TripRepository {
    public static String getSearchTitle(int typeSearch) {
        switch (typeSearch) {
            case 0:
                return "destination";
            case 1:
                return "driver";
            case 2:
                return "car_type";
            case 3:
                return "departure_time";
            case 4:
                return "booked_ticket_number";
            case 5:
                return "maximum_online_ticket_number";
        }
        return null;
    }

    @Override
    public List<Trip> getListTrips(int page, int non, int typeSearch, String txtSearch, String date) {
        List<Trip> listTrips = new ArrayList<>();
        String sql;
        if (date != null) {
            sql = "SELECT * FROM trip WHERE " + getSearchTitle(typeSearch) + " LIKE ? AND departure_date = ? ORDER BY trip_id OFFSET ? ROWS FETCH NEXT ? ROW ONLY";
        } else {
            sql = "SELECT * FROM trip WHERE " + getSearchTitle(typeSearch) + " LIKE ? ORDER BY trip_id OFFSET ? ROWS FETCH NEXT ? ROW ONLY";
        }
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            if (date != null) {
                ps.setString(2, date);
                ps.setInt(3, (page - 1) * non);
                ps.setInt(4, non);
            }
            else {
                ps.setInt(2, (page - 1) * non);
                ps.setInt(3, non);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Trip trip = Trip.builder()
                        .tripId(rs.getInt(1))
                        .bookedTicketNumber(rs.getInt(2))
                        .carType(rs.getString(3))
                        .departureDate(rs.getString(4))
                        .departureTime(Time.formatTime(rs.getString(5)))
                        .destination(rs.getString(6))
                        .driver(rs.getString(7))
                        .maxOnlineTickerNumber(rs.getInt(8))
                        .build();
                listTrips.add(trip);
            }
            return listTrips;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getTotalTrips(int typeSearch, String txtSearch, String date) {
        List<Trip> listTrips = new ArrayList<>();
        String sql;
        if (date != null) {
            sql = "SELECT COUNT(*) FROM trip WHERE " + getSearchTitle(typeSearch) + " LIKE ? AND departure_date = ?";
        } else {
            sql = "SELECT COUNT(*) FROM trip WHERE " + getSearchTitle(typeSearch) + " LIKE ?";
        }
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            if (date != null) {
                ps.setString(2, date);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean addTrip(Trip trip) {
        String sql = "INSERT INTO [trip]([booked_ticket_number],[car_type],[departure_date]\n" +
                "           ,[departure_time],[destination],[driver],[maximum_online_ticket_number])\n" +
                "     VALUES(0,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, trip.getCarType());
            ps.setString(2, trip.getDepartureDate());
            ps.setString(3, trip.getDepartureTime());
            ps.setString(4, trip.getDestination());
            ps.setString(5, trip.getDriver());
            ps.setInt(6, trip.getMaxOnlineTickerNumber());
            int isSuccess = ps.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateTrip(Trip trip) {
        String sql = "UPDATE [trip]\n" +
                "   SET [car_type] = ?\n" +
                "      ,[departure_date] = ?\n" +
                "      ,[departure_time] = ?\n" +
                "      ,[destination] = ?\n" +
                "      ,[driver] = ?\n" +
                "      ,[maximum_online_ticket_number] = ?\n" +
                " WHERE trip_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, trip.getCarType());
            ps.setString(2, trip.getDepartureDate());
            ps.setString(3, trip.getDepartureTime());
            ps.setString(4, trip.getDestination());
            ps.setString(5, trip.getDriver());
            ps.setInt(6, trip.getMaxOnlineTickerNumber());
            ps.setInt(7, trip.getTripId());
            int isSuccess = ps.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Trip getTripById(int id) {
        String sql = "SELECT * FROM trip WHERE trip_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Trip trip = Trip.builder()
                        .tripId(rs.getInt(1))
                        .bookedTicketNumber(rs.getInt(2))
                        .carType(rs.getString(3))
                        .departureDate(rs.getString(4))
                        .departureTime(Time.formatTime(rs.getString(5)))
                        .destination(rs.getString(6))
                        .driver(rs.getString(7))
                        .maxOnlineTickerNumber(rs.getInt(8))
                        .build();
                return trip;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean deleteTrip(int id) {
        try {
            ps = connection.prepareStatement("DELETE FROM trip WHERE trip_id = ?");
            ps.setInt(1, id);
            int isSuccess = ps.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Trip> getListTrip(){
        List<Trip> list = new ArrayList<>();
        String sql = "select * from trip";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add( Trip.builder()
                        .tripId(rs.getInt(1))
                        .bookedTicketNumber(rs.getInt(2))
                        .carType(rs.getString(3))
                        .departureDate(rs.getString(4))
                        .departureTime(Time.formatTime(rs.getString(5)))
                        .destination(rs.getString(6))
                        .driver(rs.getString(7))
                        .maxOnlineTickerNumber(rs.getInt(8))
                        .build());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Trip> getAllTrip() {
        List<Trip> list= new ArrayList<>();
        String query = "select * from trip ";
        try {
            ps=connection.prepareStatement(query);
            rs= ps.executeQuery();
            while (rs.next()){
                Trip trip= Trip.builder().tripId(rs.getInt(1))
                        .bookedTicketNumber(rs.getInt(2))
                        .carType(rs.getString(3))
                        .departureDate(rs.getString(4))
                        .departureTime(Time.formatTime(rs.getString(5)))
                        .destination(rs.getString(6))
                        .driver(rs.getString(7))
                        .maxOnlineTickerNumber(rs.getInt(8)).build();
                list.add(trip);
            }
        }catch (Exception e){

        }
        return list;
    }

    public static void main(String[] args) {
        TripRepository repository = new TripRepositoryImpl();
//        repository.getListTrips(1, 5, 0, "6", null)
//                .forEach(System.out::println);
//        System.out.println(repository.getTotalTrips(0, "6", null));
//        Trip trip = Trip.builder()
//                .destination("Ha Nam")
//                .departureDate("20220101")
//                .departureTime("22:12")
//                .driver("Khoi Nguyen")
//                .carType("5 cho")
//                .maxOnlineTickerNumber(30)
//                .build();
//        repository.addTrip(trip);
//        System.out.println(repository.updateTrip(trip));
//        System.out.println(repository.getTripById(108));
//        System.out.println(repository.getListTrip());
        System.out.println(repository.getAllTrip());
    }
}
