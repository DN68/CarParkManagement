package fa.training.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Time {
    public static String formatDateTime(String date) {
        if(date == null) return null;
        return date.substring(8, 10)+"/"+date.substring(5, 7)+"/"
                +date.substring(0, 4)+" "+date.substring(11, 16);
    }

    public static String formatDate(String date) {
        if(date == null) return null;
        return date.substring(8)+"/"+date.substring(5, 7)+"/"+date.substring(0, 4);
    }

    public static String formatTime(String time) {
        //22:52:00.0000000
        if(time == null) return null;
        return time.substring(0, 5);
    }

    public static String getTimeNow() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String current = dtf.format(LocalDateTime.now());
        return current;
    }

    public static void main(String[] args) throws ParseException {
//        System.out.println(formatTime("22:52:00.0000000"));
//        System.out.println(getTimeNow());
        String time = "2001-04-20";
        String rs = time.substring(8)+"/"+time.substring(5, 7)+"/"+time.substring(0, 4);
        System.out.println(rs);
    }
}
