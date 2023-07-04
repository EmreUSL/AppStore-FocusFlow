//
//  MainTitleView.swift
//  PomodoroPainter
//
//  Created by emre usul on 11.03.2023.
//

import SwiftUI

struct MainTitleView: View {
    @EnvironmentObject var viewModel: PomodoroModel
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 12) {
        
                    HStack {
                        Text(viewModel.currentDay)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                    }
                    VStack {
                        Text(LocalizedStringKey("session"))
                            .font(.title)
                            .padding(.bottom, 2)
                            .foregroundColor(Color.black)
                        Text("\(viewModel.todaySession)")
                            .font(.title.bold())
                            .foregroundColor(Color.black)
                            .onAppear() {
                                viewModel.getSessions()
                            }
                    }
                
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.white.shadow(.drop(radius: 1)))
                    .opacity(0.2)
            }
        }
        .padding()
    }
}

struct MainTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MainTitleView()
            .environmentObject(PomodoroModel())
    }
}
