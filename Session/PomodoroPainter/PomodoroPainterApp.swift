//
//  PomodoroPainterApp.swift
//  PomodoroPainter
//
//  Created by emre usul on 11.03.2023.
//

import SwiftUI

@main
struct PomodoroPainterApp: App {
    @StateObject var pomodoromodel: PomodoroModel = .init()
    
    @State var backgroundActiveTime: Date = Date()
    @State var inactiveActimeTime: Date = Date()
    
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(pomodoromodel)
        }
        .onChange(of: scenePhase) { newValue in
            
            if pomodoromodel.isActive {
               
                if newValue == .active && pomodoromodel.timeRemaining != 0 {
                    print("active")
                    pomodoromodel.onlyUpdate = true
                    
                    if pomodoromodel.didGoBackground {
                        let currentTimeDiff = Date().timeIntervalSince(backgroundActiveTime)
                        print(currentTimeDiff)
                      
                        for _ in 0...Int(currentTimeDiff) - 1{
                            withAnimation(.default) {
                                pomodoromodel.updateCountdown()
                            }
                        }
                        pomodoromodel.didGoBackground = false
                    }
                }
                
                else if newValue == .background {
                    pomodoromodel.didGoBackground = true
                    pomodoromodel.onlyUpdate = false
                    print("background")
                    backgroundActiveTime = Date()
                    print(backgroundActiveTime)
                }
            }
        }
    }
}
