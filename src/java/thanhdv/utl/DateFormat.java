/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.utl;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Oliver Doan
 */
public class DateFormat {

    public String nowDate() {
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, dd/MM/yyyy");
        return dateFormat.format(now);
    }
    
//    public static void main(String[] args) {
//        DateFormat date = new DateFormat();
//        String result= date.nowDate();
//        System.out.println("Date: " + result);
//    }
}
