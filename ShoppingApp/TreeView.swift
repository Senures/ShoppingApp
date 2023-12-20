//
//  TreeView.swift
//  ShoppingApp
//
//  Created by Semanur Eserler on 19.12.2023.
//

import SwiftUI

struct Employee: Identifiable {
    var id = UUID()
    var name: String
    var title: String
    var subordinates: [Employee]?
}

struct OrgChartView: View {
    var employee: Employee

    var body: some View {
        VStack(spacing: 20) {
            Text("\(employee.name) - \(employee.title)")
                .font(.headline)

            if let subordinates = employee.subordinates {
                HStack(spacing: 20) {
                    ForEach(subordinates) { subordinate in
                        OrgChartView(employee: subordinate)
                    }
                }
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
    }
}

struct ContentView: View {
    var body: some View {
        let ceo = Employee(name: "John Doe", title: "CEO", subordinates: [
            Employee(name: "Jane Smith", title: "CTO", subordinates: [
                Employee(name: "Alice Johnson", title: "Dev Lead", subordinates: [
                    Employee(name: "Charlie Brown", title: "Developer"),
                    Employee(name: "David Lee", title: "Developer")
                ]),
                Employee(name: "Bob Williams", title: "Dev Lead", subordinates: [
                    Employee(name: "Eva Davis", title: "Developer"),
                    Employee(name: "Frank Robinson", title: "Developer")
                ])
            ])
        ])

        return OrgChartView(employee: ceo)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
