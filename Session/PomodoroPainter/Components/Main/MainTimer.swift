//
//  MainTimer.swift
//  PomodoroPainter
//
//  Created by emre usul on 11.03.2023.
//

import SwiftUI

struct MainTimer: View {
    @EnvironmentObject var viewModel: PomodoroModel
    
    var body: some View {
        Text("\(viewModel.timeRemaingDisplay)")
            .font(.system(size: 50, weight: .medium, design: .monospaced))
            .padding()
            .frame(width: 250)
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.white.shadow(.drop(radius: 1)))
                    .opacity(0.3)
            }
            .foregroundColor(.black)
            .cornerRadius(20)
  
    }
}

struct MainTimer_Previews: PreviewProvider {
    static var previews: some View {
        MainTimer()
            .environmentObject(PomodoroModel())
    }
}

