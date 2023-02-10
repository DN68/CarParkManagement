package fa.training.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Validation {
    private static final String FORMAT_DATE = "dd-MM-yyyy";

    /**
     * Check empty string
     * @param txt text
     * @return if string is null or empty ("") return true else false
     */
    public static boolean checkEmpty(String txt) {
        return txt.trim() == null || txt.trim() == "";
    }

    /**
     * Check number is integer
     * @param txt text
     * @return  if wrong format int
     */
    public static boolean checkInteger(String txt) {
        if (txt == null) return false;
        try {
            Integer.parseInt(txt);
            return true;
        } catch (NumberFormatException ex) {
            return false;
        }
    }

    public static boolean checkDouble(String txt) {
        if (txt == null) return false;
        try {
            Double.parseDouble(txt);
            return true;
        } catch (NumberFormatException ex) {
            return false;
        }
    }

    public static boolean checkLength(int min, int max, String txt) {
        if (txt == null) return false;
        return (txt.length() > min && txt.length() < max);
    }

    public static boolean checkFromToDate(String d1, String d2) {
        if(d1 == null || d2 == null) return false;
        SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_DATE);
        sdf.setLenient(false);
        try {
            return sdf.parse(d1).compareTo(sdf.parse(d2)) > 0;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean checkFormatDate(String date) {
        if(checkEmpty(date)) return false;
        SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_DATE);
        sdf.setLenient(false);
        try {
            sdf.parse(date);
            return true;
        } catch (ParseException e) {
            return false;
        }
    }

    public static String getDateNow() {
        SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_DATE);
        return sdf.format(new Date());
    }

    public static int getAge(String date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dateTime = LocalDate.parse(date, formatter);
        LocalDate currentDate = LocalDate.now();
        Period period = Period.between(dateTime, currentDate);
        return period.getYears();
    }

    public static boolean checkBirthDay(String date, int enough) {
        int age = getAge(date);
        if(age > enough) return true;
        return false;
    }

    public static void main(String[] args) {
        String regex = "045";
//        System.out.println(checkDouble(""));
        System.out.println(checkFromToDate("2001-12-12", "2002-11-23"));
//        System.out.println(checkFormatDate("2022-02-31"));
//        LocalDate currentDate = LocalDate.o;
//        LocalDate birthDay = LocalDate.of(2001, 12, 15);
//
//        Period period = Period.between(birthDay, currentDate);
//
//        System.out.println("Age: ");
//        System.out.println("Years: " + period.getYears());
//        System.out.println("Months: " + period.getMonths());
//        System.out.println("Days: " + period.getDays());

        //15
//        String str = "2015-03-15";
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        LocalDate dateTime = LocalDate.parse(str, formatter);
//        System.out.println(dateTime);

        String d = "2007-12-12";
        System.out.println(checkBirthDay(d, 18));
    }
}
