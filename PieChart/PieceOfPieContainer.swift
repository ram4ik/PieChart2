//
//  PiceOfPieContainer.swift
//  PieChart
//
//  Created by ramil on 03.03.2021.
//

import SwiftUI

class PieceOfPieContainer: ObservableObject {
    
    @Published var chartData = [
        PiceOfPie(color: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), percent: 8, value: 0),
        PiceOfPie(color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), percent: 22, value: 0),
        PiceOfPie(color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), percent: 30, value: 0),
        PiceOfPie(color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), percent: 10, value: 0),
        PiceOfPie(color: Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)), percent: 30, value: 0)
    ]
    
    func calcOfPath() {
        var value: CGFloat = 0
        
        for index in 0..<chartData.count {
            value += chartData[index].percent
            chartData[index].value = value
        }
    }
}
