package fa.training.repository;

import fa.training.entity.ParkingLot;

import java.util.List;

public interface ParkingLotRepository {
    public List<ParkingLot> getListParkingLot();

    /**
     * Get all list parking lot include paging, search, authorization, sort
     * @param page page current
     * @param non number of record of a page
     * @param typeSearch type search return integer
     * @param txtSearch text to search
     * @return list of parking lot
     */
    public List<ParkingLot> getListParkingLots(int page, int non, int typeSearch, String txtSearch);

    public int getTotalParkingLots(int typeSearch, String txtSearch);

    /**
     * Add a parking lot to parking lot table
     * @param parkingLot new parking lot
     * @return true or false
     */
    public boolean addParkingLot(ParkingLot parkingLot);

    /**
     * Update a parking lot to parking lot table
     * @param parkingLot new parking lot
     * @return true or false
     */
    public boolean updateParkingLot(ParkingLot parkingLot);

    /**
     * Delete a parking lot by id
     * @param parkId id to delete
     * @return true or false
     */
    public boolean deleteParkingLot(int parkId);

    /**
     * Get a parking lot by id
     * @param parkId new parking lot
     * @return true or false
     */
    public ParkingLot getParkingLotById(int parkId);
}
