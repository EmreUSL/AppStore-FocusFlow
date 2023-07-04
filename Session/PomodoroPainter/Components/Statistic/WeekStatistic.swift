//
//  WeekStatistic.swift
//  PomodoroPainter
//
//  Created by emre usul on 14.03.2023.
//

import SwiftUI

struct WeekStatistic: View {
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
                    Text(LocalizedStringKey("thisWeek"))
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 1)
                    Text("\(viewModel.getCurrentWeek())")
                        .font(.headline)
                        .fontWeight(.semibold)
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
                    Text("\(viewModel.weeklySessions)")
                        .font(.title.bold())
                        .padding(.leading)
                        .foregroundColor(.black)
                        .onAppear() {
                            viewModel.getWeekSession()
                        }
                }
                Spacer()
                VStack {
                    HStack {
                        Text("\(viewModel.getHour(pomodoro: viewModel.weeklySessions)[0])")
                            .font(.title.bold())
                            .padding(.trailing, -3)
                            .foregroundColor(.black)
                        Text(LocalizedStringKey("hour"))
                            .font(.footnote)
                            .foregroundColor(.black)
                        
                        Text("\(viewModel.getHour(pomodoro: viewModel.weeklySessions)[1])")
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
                .fill(.white.shadow(.drop(radius: 70)))
                .opacity(0.2)
        }
    }
}

struct WeekStatistic_Previews: PreviewProvider {
    static var previews: some View {
        WeekStatistic()
            .environmentObject(PomodoroModel())
    }
}
