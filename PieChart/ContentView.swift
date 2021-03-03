//
//  ContentView.swift
//  PieChart
//
//  Created by ramil on 03.03.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var chartDataObj = PieceOfPieContainer()
    @State private var indexOfTappedSlice = -1
    
    var body: some View {
        VStack {
            chartCircle
                .frame(width: 100, height: 200, alignment: .center)
                .onAppear() {
                    self.chartDataObj.calcOfPath()
                }
            
            chartListView
                .padding(8)
                .frame(width: 300, alignment: .trailing)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var chartCircle: some View {
        ZStack {
            ForEach(0..<chartDataObj.chartData.count) { index in
                Circle()
                    .trim(from: index == 0 ? 0.0 : chartDataObj.chartData[index - 1].value / 100,
                          to: chartDataObj.chartData[index].value / 100)
                    .stroke(chartDataObj.chartData[index].color, lineWidth: 100)
                    .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                    .animation(.spring())
            }
        }
    }
    
    private var chartListView: some View {
        ForEach(0..<chartDataObj.chartData.count) { index in
            HStack {
                Text(String(format: "%.2f", Double(chartDataObj.chartData[index].percent)) + "%")
                    .onTapGesture {
                        indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                    }
                    .font(indexOfTappedSlice == index ? .headline : .subheadline)
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(chartDataObj.chartData[index].color)
                    .frame(width: 20, height: 20)
            }
        }
    }
}
