//
//  TimeView.swift
//  PomodoroPainter
//
//  Created by emre usul on 11.03.2023.
//

import SwiftUI

struct TimeView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .indigo, .teal], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            
            VStack {
                MainTitleView()
                MainImageView()
                    .padding(.bottom, 25)
                MainTimer()
                MainButton()
                    .padding()
                Spacer()
            }
           
            
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
            .environmentObject(PomodoroModel())
    }
}
