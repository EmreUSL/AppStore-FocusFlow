//
//  PomodoroModel.swift
//  PomodoroPainter
//
//  Created by emre usul on 10.04.2023.
//

import SwiftUI
import UserNotifications

class PomodoroModel: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    @Published var isActive = false
    @Published var showingAlert = false
    @Published var timeRemaining: Int = 25*60
    
    @Published var todaySession: Int = 0
    @Published var weeklySessions: Int = 0
    @Published var allTimeSessions: Int = 0
    
    @Published var height = 200.0
    @Published var rectangleHeight: Float = 0.0
    
    @Published var canNotify: Bool = true
    
    @Published var didGoBackground: Bool = false
    @Published var onlyUpdate: Bool = true
    
    //MARK: - Saving Date
    
    private var lastDateString: String {
        get {
            return UserDefaults.standard.string(forKey: "lastDay") ?? String() }
    }
    
    private var lastWeekStartString: String {
        get {
            return UserDefaults.standard.string(forKey: "lastWeekString") ?? String() }
    }
    
    //MARK: - Get Saving Data
    
    func getSessions() {
        todaySession = UserDefaults.standard.integer(forKey: "pomodoro")
    }
    
    func getWeekSession() {
        weeklySessions = UserDefaults.standard.integer(forKey: "weekPomodoro")
    }
    
    func getAllTimeSessions() {
        allTimeSessions = UserDefaults.standard.integer(forKey: "allTimePomodoro")
    }
    
    //MARK: - Get Date
    
    public var currentDay: String {
        get {
            return Date.now.toString()
        }
    }
    
    func getCurrentWeek() -> String {
        let startWeek = (Date.now.startOfWeeks?.toString())!
        let endOfWeek = (Date.now.endOfWeek?.toString())!
        return ("\(startWeek) - \(endOfWeek)")
    }
    
    //MARK: - Check Date
    
    func newDay() {
       if lastDateString != currentDay {
           todaySession = 0
           UserDefaults.standard.set(todaySession, forKey: "pomodoro")
           UserDefaults.standard.set(currentDay, forKey: "lastDay")
       }
    }
    
    func checkNewWeek(){
        if lastWeekStartString != getCurrentWeek(){
            weeklySessions = 0
            UserDefaults.standard.set(weeklySessions, forKey: "weekPomodoro")
            UserDefaults.standard.set(getCurrentWeek(), forKey: "lastWeekString")
        }
    }
    
    //MARK: - Notification
    
    
    override init() {
        super.init()
        self.authorizeNotification()
    }
    
    func authorizeNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) { _, _ in
        }
        
        UNUserNotificationCenter.current().delegate = self
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
    
    func addNotification() {
        
        let content = UNMutableNotificationContent()
        let title = String.LocalizationValue(stringLiteral: "title")
        let subtitle = String.LocalizationValue(stringLiteral: "subtitle")
        content.title = String(localized: title)
        content.subtitle = String(localized: subtitle)
        content.sound = UNNotificationSound.defaultCritical
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(timeRemaining), repeats: false)
        let request = UNNotificationRequest(identifier: "IN-APP", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        canNotify = false
        
    }
    
    func deleteNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        canNotify = true
    }
    
    //MARK: - Button Logics
    
    func restart() {
        self.isActive = false
      
        timeRemaining = 25*60
        rectangleHeight = 0
        height = 200.0
    }
    
    
    var timeRemaingDisplay:String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02i:%02i", minutes, seconds)
        
    }
    
    func getHour(pomodoro: Int) -> [Int] {
        let total = pomodoro * 25
        let hour = total / 60
        let minutes = total % 60
        
        if hour == 0 {
            return [0,minutes]
        }
        
        else {
            return [hour,minutes]
        }
    }
    
    func updateCountdown() {
        guard isActive else { return }
        
        if onlyUpdate {
            
            if timeRemaining > 0 {
                timeRemaining -= 1
                height -= 3.33
                rectangleHeight = Float((200 - height)/5000)
                
            } else {
                getWeekSession()
                getAllTimeSessions()
                
                todaySession += 1
                weeklySessions += 1
                allTimeSessions += 1
                
                UserDefaults.standard.set(todaySession, forKey: "pomodoro")
                UserDefaults.standard.set(weeklySessions, forKey: "weekPomodoro")
                UserDefaults.standard.set(allTimeSessions, forKey: "allTimePomodoro")
                
                self.isActive = false
                self.timeRemaining = 25*60
                self.height = 200.0
                
            
            }
        }
    }
}

