package fa.training.repository.impl;

import fa.training.entity.Car;
import fa.training.entity.ParkingLot;
import fa.training.repository.CarRepository;
import fa.training.util.DBContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarRepositoryImpl extends DBContext implements CarRepository {

    public static String getSearchTitle(int typeSearch) {
        switch (typeSearch) {
            case 0:
                return "license_plate";
            case 1:
                return "car_type";
            case 2:
                return "car_color";
            case 3:
                return "company";
            case 4:
                return "park_name";
        }
        return null;
    }

    @Override
    public List<Car> getListCar(int page, int non, int typeSearch, String txtSearch) {

        String sql = "SELECT C.license_plate,C.car_color, C.car_type, c.company, P.* " +
                "FROM car AS C JOIN parking_lot AS P " +
                "ON C.park_id = P.park_id " +
                "WHERE " + getSearchTitle(typeSearch) + " like ? " +
                "ORDER BY license_plate OFFSET ? ROWS FETCH NEXT ? ROW ONLY";
        List<Car> listCar = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, (page - 1) * non);
            ps.setInt(3, non);
            rs = ps.executeQuery();
            while (rs.next()) {
                ParkingLot parkingLot = ParkingLot.builder()
                        .parkId(rs.getInt(5))
                        .parkQuantity(rs.getInt(6))
                        .parkName(rs.getString(7))
                        .parkPlace(rs.getString(8))
                        .parkPrice(rs.getDouble(9))
                        .parkStatus(rs.getInt(10))
                        .build();
                Car car = Car.builder()
                        .licensePlate(rs.getString(1))
                        .carColor(rs.getString(2))
                        .carType(rs.getString(3))
                        .company(rs.getString(4))
                        .park(parkingLot)
                        .build();
                listCar.add(car);
            }
            return listCar;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getTotalCar(int typeSearch, String txtSearch) {
        String sql = "SELECT COUNT(*) FROM car AS C JOIN parking_lot AS P \n" +
                "ON C.park_id = P.park_id \n" +
                "WHERE " + getSearchTitle(typeSearch) + " like ? ";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
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
    public boolean addCar(Car car) {
        Car c = getCarBylicense_plate(car.getLicensePlate());
        String sql = "INSERT INTO [car]([license_plate],[car_color],[car_type],[company],[park_id])\n" +
                "     VALUES(?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, car.getLicensePlate());
            ps.setString(2, car.getCarColor());
            ps.setString(3, car.getCarType());
            ps.setString(4, car.getCompany());
            ps.setInt(5, car.getPark().getParkId());
            int isSuccess = ps.executeUpdate();
            if (isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateCar(Car car, String oldLicensePlate) {
        String sql = "UPDATE car SET \n" +
                "car_color = ?,\n" +
                "car_type = ?,\n" +
                "company = ?,\n" +
                "park_id = ?,\n" +
                "license_plate = ?\n" +
                "WHERE license_plate = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, car.getCarColor());
            ps.setString(2, car.getCarType());
            ps.setString(3, car.getCompany());
            ps.setInt(4, car.getPark().getParkId());
            ps.setString(5, car.getLicensePlate());
            ps.setString(6, oldLicensePlate);
            int isSuccess = ps.executeUpdate();
            if (isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCar(String license_plate) {
        String sql = "DELETE FROM car WHERE license_plate = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, license_plate);
            int isSuccess = ps.executeUpdate();
            if (isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Car getCarBylicense_plate(String license_plate) {
        String sql = "SELECT C.license_plate,C.car_color, C.car_type, c.company, P.*\n" +
                "FROM car AS C JOIN parking_lot AS P\n" +
                "ON C.park_id = P.park_id\n" +
                "WHERE license_plate = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, license_plate);
            rs = ps.executeQuery();
            while (rs.next()) {
                ParkingLot parkingLot = ParkingLot.builder()
                        .parkId(rs.getInt(5))
                        .parkQuantity(rs.getInt(6))
                        .parkName(rs.getString(7))
                        .parkPlace(rs.getString(8))
                        .parkPrice(rs.getDouble(9))
                        .parkStatus(rs.getInt(10))
                        .build();
                Car car = Car.builder()
                        .licensePlate(rs.getString(1))
                        .carColor(rs.getString(2))
                        .carType(rs.getString(3))
                        .company(rs.getString(4))
                        .park(parkingLot)
                        .build();
                return car;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Car> getAllLicense() {
        List<Car> list = new ArrayList<>();
        String query = " select * from car ";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Car car = Car.builder().licensePlate(rs.getString(1))
                        .carColor(rs.getString(2))
                        .carType(rs.getString(3))
                        .company(rs.getString(4)).build();
                list.add(car);
            }
        } catch (Exception e) {

        }
        return list;
    }

    @Override
    public int countCarByParkId(int parkId) {
        String sql = "SELECT COUNT(*) FROM car WHERE park_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parkId);
            rs = ps.executeQuery();
            while (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean checkLicensePlateExist(String licensePlate) {
        String sql = "SELECT * FROM car WHERE license_plate = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, licensePlate);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs != null) return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        CarRepository repository = new CarRepositoryImpl();
//        System.out.println(repository.countCarByParkId(53));
        System.out.println(repository.checkLicensePlateExist("123"));
    }
}
