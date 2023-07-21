//
//  ContentView.swift
//  demo
//
//  Created by IPS-161 on 21/07/23.
//

import SwiftUI

import Charts

struct ContentView: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Day", "Monday"),
                y: .value("Steps", 6019)
            )

            BarMark(
                x: .value("Day", "Tuesday"),
                y: .value("Steps", 7200)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
