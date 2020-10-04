//
//  ContentView.swift
//  Capsule Example
//
//  Created by Kartik Chaturvedi on 10/4/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Capsule()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Capsule: View {
    @State var selected: Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                if selected { Spacer() }
                
                Text(selected ? "Select" : "Delete")
                
                if !selected { Spacer() }
            }
            
            HStack {
                if !selected { Spacer() }
                
                Image(systemName: selected ? "checkmark" : "xmark")
                    .padding(6)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(50)
                    .rotationEffect(selected ? .zero : Angle(degrees: 270))
                
                if selected { Spacer() }
            }
        }
        .animation(Animation.spring(response: 1, dampingFraction: 0.6, blendDuration: 0.1))
        .foregroundColor(.white)
        .frame(maxWidth: 100)
        .padding(5)
        .padding(.horizontal, 6)
        .background(selected ? Color.green : Color.red)
        .cornerRadius(50)
        .onTapGesture {
            selected.toggle()
        }
    }
}
