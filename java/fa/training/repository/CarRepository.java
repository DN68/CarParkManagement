package fa.training.repository;

import fa.training.entity.Car;

import java.util.List;

public interface CarRepository {
    /**
     * Get all list car include paging, search, authorization, sort
     * @param page page current
     * @param non number of record of a page
     * @param typeSearch type search return integer
     * @param txtSearch text to search
     * @return list of car
     */
    public List<Car> getListCar(int page, int non, int typeSearch, String txtSearch);

    /**
     * Get total car by search
     * @param typeSearch type search return integer
     * @param txtSearch text to search
     * @param departmentId id of department
     * @return integer total record of car by Search
     */
    public int getTotalCar(int typeSearch, String txtSearch);

    /**
     * Add an car to car table
     * @param car new car
     * @return true or false
     */
    public boolean addCar(Car car);

    /**
     * Update an car to car table
     * @param car new car
     * @return true or false
     */
    public boolean updateCar(Car car, String oldLicensePlate);

    /**
     * Delete an car by license_plate
     * @param license_plate license_plate to delete
     * @return true or false
     */
    public boolean deleteCar(String license_plate);

    /**
     * Get an car by license_plate
     * @param license_plate license_plate to get car
     * @return Car
     */
    public Car getCarBylicense_plate(String license_plate);
    public List<Car> getAllLicense();

    public int countCarByParkId(int parkId);

    public boolean checkLicensePlateExist(String licensePlate);

}
