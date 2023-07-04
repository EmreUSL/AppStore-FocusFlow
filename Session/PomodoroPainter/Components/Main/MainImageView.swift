//
//  MainImageView.swift
//  PomodoroPainter
//
//  Created by emre usul on 11.03.2023.
//

import SwiftUI

struct MainImageView: View {
    @EnvironmentObject var viewModel: PomodoroModel
    
    var body: some View {
        ZStack {
            Image("apple.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240, height: 200)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                        .fill(.white.shadow(.drop(radius: 5)))
                        .opacity(0.2)
                }
            
            ZStack {
                Image("apple.blankk")
                    .resizable()
                
            }
            .clipShape(RectBand(from: 0, to: 1 - CGFloat(viewModel.rectangleHeight)))
            .scaledToFit()
            .frame(width: 200)
            
        }
      
    }
}

struct MainImageView_Previews: PreviewProvider {
    static var previews: some View {
        MainImageView()
            .environmentObject(PomodoroModel())
    }
}

struct RectBand: Shape {
    var from: CGFloat
    var to: CGFloat
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addRect(CGRect(
                x: rect.origin.x,
                y: rect.origin.y + from * rect.size.height,
                width: rect.size.width,
                height: (to-from) * rect.size.height
            ))
        }
    }
}
