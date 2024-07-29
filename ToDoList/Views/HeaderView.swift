//
//  HeaderView.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(Color.white)
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 30)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "preview", subtitle: "preview subtitle", angle: 15, background: .blue)
}
