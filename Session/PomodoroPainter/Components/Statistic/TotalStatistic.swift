//
//  TotalStatistic.swift
//  PomodoroPainter
//
//  Created by emre usul on 14.03.2023.
//

import SwiftUI

struct TotalStatistic: View {
    @EnvironmentObject var viewModel: PomodoroModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
    
            HStack {
                Image("sessions")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 30)
                    .padding(.leading, 8)
                    Spacer()
                VStack() {
                    Text(LocalizedStringKey("total"))
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom, 1)
                        .foregroundColor(.black)
                }
                Spacer()
                Image("calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 30)
                    .padding(.trailing, 8)
                    .foregroundColor(.black)
           
            }
            HStack {
                VStack {
                    Text("\(viewModel.allTimeSessions)")
                        .font(.title.bold())
                        .padding(.leading)
                        .foregroundColor(.black)
                        .onAppear() {
                            viewModel.getAllTimeSessions()
                        }
                      
                }
                Spacer()
                VStack {
                    HStack {
                        Text("\(viewModel.getHour(pomodoro: viewModel.allTimeSessions)[0])")
                            .font(.title.bold())
                            .padding(.trailing, -3)
                            .foregroundColor(.black)
                        Text(LocalizedStringKey("hour"))
                            .font(.footnote)
                            .foregroundColor(.black)
                        
                        Text("\(viewModel.getHour(pomodoro: viewModel.allTimeSessions)[1])")
                            .font(.title.bold())
                            .padding(.trailing, -3)
                            .foregroundColor(.black)
                        Text(LocalizedStringKey("minute"))
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                    
                }
               
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white.shadow(.drop(radius: 100)))
                .opacity(0.2)
        }
    }
}

struct TotalStatistic_Previews: PreviewProvider {
    static var previews: some View {
        TotalStatistic()
            .environmentObject(PomodoroModel() )
    }
}
