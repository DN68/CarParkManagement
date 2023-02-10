package fa.training.repository.impl;

import fa.training.entity.ParkingLot;
import fa.training.repository.ParkingLotRepository;
import fa.training.util.DBContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ParkingLotRepositoryImpl extends DBContext implements ParkingLotRepository {
    @Override
    public List<ParkingLot> getListParkingLot() {
        List<ParkingLot> listParkingLots = new ArrayList<>();
        String sql = "SELECT * FROM parking_lot  WHERE park_status <> 3";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                ParkingLot parkingLot = ParkingLot.builder()
                        .parkId(rs.getInt(1))
                        .parkQuantity(rs.getInt(2))
                        .parkName(rs.getString(3))
                        .parkPlace(rs.getString(4))
                        .parkPrice(rs.getDouble(5))
                        .parkStatus(rs.getInt(6))
                        .parkArea(rs.getInt(7))
                        .build();
                listParkingLots.add(parkingLot);
            }
            return listParkingLots;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getSearchTitle(int typeSearch) {
        switch (typeSearch){
            case 0:
                return "park_quantity";
            case 1:
                return "park_name";
            case 2:
                return "park_place";
            case 3:
                return "park_price";
            case 4:
                return "park_status";
            case 5:
                return "park_area";
        }
        return null;
    }

    @Override
    public List<ParkingLot> getListParkingLots(int page, int non, int typeSearch, String txtSearch) {
        String sql = "SELECT * FROM parking_lot " +
                "                WHERE "+getSearchTitle(typeSearch)+" LIKE ? AND park_status <> 3 "+
                " ORDER BY park_id OFFSET ? ROWS FETCH NEXT ? ROW ONLY";
        List<ParkingLot> listParkingLots = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%"+txtSearch+"%");
            ps.setInt(2, (page - 1) * non);
            ps.setInt(3, non);
            rs = ps.executeQuery();
            while (rs.next()) {
                ParkingLot parkingLot = ParkingLot.builder()
                        .parkId(rs.getInt(1))
                        .parkQuantity(rs.getInt(2))
                        .parkName(rs.getString(3))
                        .parkPlace(rs.getString(4))
                        .parkPrice(rs.getDouble(5))
                        .parkStatus(rs.getInt(6))
                        .parkArea(rs.getInt(7))
                        .parkNumber(rs.getInt(8))
                        .build();
                listParkingLots.add(parkingLot);
            }
            return listParkingLots;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    @Override
    public int getTotalParkingLots(int typeSearch, String txtSearch) {
        String sql = "SELECT COUNT(*) FROM parking_lot" +
                "                WHERE "+getSearchTitle(typeSearch)+" LIKE ? AND park_status <> 3";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%"+txtSearch+"%");
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
    public boolean addParkingLot(ParkingLot parkingLot) {
        String sql =  "INSERT INTO [parking_lot]([park_quantity], [park_name], [park_place]\n" +
                "\t\t\t,[park_price], [park_status], [park_area])\n" +
                "     VALUES(?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parkingLot.getParkQuantity());
            ps.setString(2, parkingLot.getParkName());
            ps.setString(3, parkingLot.getParkPlace());
            ps.setDouble(4, parkingLot.getParkPrice());
            ps.setInt(5, parkingLot.getParkStatus());
            ps.setInt(6, parkingLot.getParkArea());
            int isSuccess = ps.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateParkingLot(ParkingLot parkingLot) {
        String sql = "UPDATE [parking_lot]\n" +
                "   SET [park_quantity] = ?\n" +
                "      ,[park_name] = ?\n" +
                "      ,[park_place] = ?\n" +
                "      ,[park_price] = ?\n" +
                "      ,[park_status] = ?\n" +
                "      ,[park_area] = ?\n" +
                " WHERE park_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parkingLot.getParkQuantity());
            ps.setString(2, parkingLot.getParkName());
            ps.setString(3, parkingLot.getParkPlace());
            ps.setDouble(4, parkingLot.getParkPrice());
            ps.setInt(5, parkingLot.getParkStatus());
            ps.setInt(6, parkingLot.getParkArea());
            ps.setInt(7 ,parkingLot.getParkId());
            int isSuccess = ps.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteParkingLot(int parkId) {
        String sql = "UPDATE parking_lot SET park_status = 3 WHERE park_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parkId);
            int isSuccess = ps.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public ParkingLot getParkingLotById(int parkId) {
        String sql = "SELECT [park_id]\n" +
                "      ,[park_quantity]\n" +
                "      ,[park_name]\n" +
                "      ,[park_place]\n" +
                "      ,[park_price]\n" +
                "      ,[park_status]\n" +
                "      ,[park_area]\n" +
                "  FROM [parking_lot]\n" +
                "WHERE park_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parkId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ParkingLot parkingLot = ParkingLot.builder()
                        .parkId(rs.getInt(1))
                        .parkQuantity(rs.getInt(2))
                        .parkName(rs.getString(3))
                        .parkPlace(rs.getString(4))
                        .parkPrice(rs.getDouble(5))
                        .parkStatus(rs.getInt(6))
                        .parkArea(rs.getInt(7))
                        .build();
                return parkingLot;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        ParkingLotRepository repository = new ParkingLotRepositoryImpl();
//        repository.getListParkingLots(1, 10, 1, "").forEach(System.out::println);
        ParkingLot parkingLot = ParkingLot.builder()
                .parkId(110)
                .parkQuantity(10)
                .parkName("parkName")
                .parkPlace("parkPlace")
                .parkPrice(20)
                .parkArea(3000)
                .parkStatus(2)
                .build();
        repository.updateParkingLot(parkingLot);
    }
}
