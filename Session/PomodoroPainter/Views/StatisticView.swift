//
//  StatisticView.swift
//  PomodoroPainter
//
//  Created by emre usul on 11.03.2023.
//

import SwiftUI

struct StatisticView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .indigo, .teal], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(LocalizedStringKey("SESSİON"))
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        Spacer()
                        Text(LocalizedStringKey("TIME"))
                            .font(.title)
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                    }
                }
                .padding()
              
                TodayStatistic()
                WeekStatistic()
                TotalStatistic()
                Spacer()
            }
            .padding()
        }
       
     
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
            .environmentObject(PomodoroModel())
    }
}
