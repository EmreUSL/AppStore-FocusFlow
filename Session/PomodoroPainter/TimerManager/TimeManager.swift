//
//  TimeManager.swift
//  PomodoroPainter
//
//  Created by emre usul on 10.04.2023.
//

import Foundation

class TimeManager: ObservableObject {
    
    static let shared = TimeManager()
    
    @Published var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
}


