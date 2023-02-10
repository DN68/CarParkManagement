package fa.training.repository;

import fa.training.entity.Trip;

import java.util.List;

public interface TripRepository {
    public List<Trip> getListTrips(int page, int non, int typeSearch, String txtSearch, String date);

    public int getTotalTrips(int typeSearch, String txtSearch, String date);

    public boolean addTrip(Trip trip);

    public boolean updateTrip(Trip trip);

    public Trip getTripById(int id);

    public boolean deleteTrip(int id);

    public List<Trip> getListTrip();
    public List<Trip> getAllTrip();
}
