//
//  ContentView.swift
//  Tutorial-Grid
//
//  Created by Keiju Hiramoto on 2026/02/10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let columnLayout = Array(repeating: GridItem(), count:3)
    //Array(repeating: 配列に入れたいelements,count:何個つくるか)
    //Array(repeating: GridItem(), count: 3)→[GridItem(),GridItem(),GridItem()]
    
    @State private var selectedColor = Color.gray
    
    let allColors: [Color] = [
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray
    ]
    
    var body: some View {
        VStack{
            Text("Selected Color")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(selectedColor)
                .padding(10)
            
            ScrollView{
                LazyVGrid(columns: columnLayout){
                    ForEach(allColors, id: \.description){ color in
                        Button{
                            selectedColor = color
                        } label:{
                            RoundedRectangle(cornerRadius: 4.0)
                                .aspectRatio(1.0, contentMode: .fit)
                                .foregroundColor(color)
                            //contentMode
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}
    
    
    #Preview {
        ContentView()
    }
