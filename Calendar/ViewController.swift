//
//  ViewController.swift
//  Calendar
//
//  Created by Mark Meretzky on 12/9/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        //-----

        //Create an array of eight Doubles, giving the length in hours of each weekday's class.
        let length: [Double] = [
            0,    //0 unused
            0,    //1 Sunday
            4.25, //2 Monday
            4.25, //3 Tuesday
            4.25, //4 Wednesday
            4.25, //5 Thursday
            0,    //6 Friday
            0     //7 Saturday
        ];

        let calendar: Calendar = Calendar.current;   //our Gregorian calendar
        let dateFormatter: DateFormatter = DateFormatter();
        dateFormatter.dateFormat = "EEE, MMM dd, yyyy";
        
        //Create an array of 20 Date objects.

        let holidays: [Date] = [
            calendar.date(from: DateComponents(year: 2018, month: 12, day: 12))!, //Wed BMCC finals
            calendar.date(from: DateComponents(year: 2018, month: 12, day: 13))!, //Thu
            calendar.date(from: DateComponents(year: 2018, month: 12, day: 17))!, //Mon
            calendar.date(from: DateComponents(year: 2018, month: 12, day: 18))!, //Tue
            calendar.date(from: DateComponents(year: 2018, month: 12, day: 24))!, //Mon Christmas Eve
            calendar.date(from: DateComponents(year: 2018, month: 12, day: 25))!, //Tue Christmas
            calendar.date(from: DateComponents(year: 2018, month: 12, day: 31))!, //Mon New Year's Eve
            
            calendar.date(from: DateComponents(year: 2019, month:  1, day:  1))!, //Tue New Year's Day
            calendar.date(from: DateComponents(year: 2019, month:  1, day:  7))!, //Mon Professional Dev
            calendar.date(from: DateComponents(year: 2019, month:  1, day: 14))!, //Mon Professional Dev
            calendar.date(from: DateComponents(year: 2019, month:  1, day: 21))!, //Mon MLK
            calendar.date(from: DateComponents(year: 2019, month:  1, day: 28))!, //Mon Professional Dev
            
            calendar.date(from: DateComponents(year: 2019, month:  2, day: 11))!, //Mon Professional Dev
            calendar.date(from: DateComponents(year: 2019, month:  2, day: 12))!, //Tue Lincoln
            calendar.date(from: DateComponents(year: 2019, month:  2, day: 18))!, //Mon Presidents
            calendar.date(from: DateComponents(year: 2019, month:  2, day: 25))!, //Mon Professional Dev
            
            calendar.date(from: DateComponents(year: 2019, month:  3, day:  4))!, //Mon Professional Dev
            calendar.date(from: DateComponents(year: 2019, month:  3, day: 11))!, //Mon Professional Dev
            calendar.date(from: DateComponents(year: 2019, month:  3, day: 18))!, //Mon Professional Dev
            calendar.date(from: DateComponents(year: 2019, month:  3, day: 25))!  //Mon Professional Dev
        ];
        
        //Create the starting date for the course, December 10, 2018.
        var date: Date = calendar.date(from: DateComponents(year: 2018, month: 12, day: 10))!;
        var hours: Double = 0;
        
        while hours < 180.0 {   //Keep going until we have amassed 180 hours of classroom time.
            if !holidays.contains(date) {       //If this date is not on the list of holidays,
                //weekday is an Int in the range 1 to 7 inclusive.  1 means Sun, 2 means Mon, etc.
                let weekday: Int = calendar.component(Calendar.Component.weekday, from: date);
                
                if length[weekday] > 0 {        //If we have class on this day,
                    hours += length[weekday];   //means hours = hours + length[weekday];
                    textView.text += "\(String(format: "%6.2f", hours)) \(dateFormatter.string(from: date))\n";
                }
            }
            date = calendar.date(byAdding: .day, value: 1, to: date)! //Go to the next date.
        }
        
        //-----
    }

}
