//
//  BikeShareList.swift
//  BikeShareSwiftUI
//
//  Created by Daniel Slone on 3/1/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

import SwiftUI

struct BikeShareListViewModel: Identifiable {
    let id: Int
    let text: String
}

struct BikeShareList: View {
    let items = [BikeShareListViewModel(id: 0, text: "Hello"),
                 BikeShareListViewModel(id: 1, text: "Hi"),
                 BikeShareListViewModel(id: 2, text: "Daniel"),
                 BikeShareListViewModel(id: 3, text: "End"),
                 BikeShareListViewModel(id: 4, text: "Hello"),
                 BikeShareListViewModel(id: 5, text: "Hi"),
                 BikeShareListViewModel(id: 6, text: "Daniel"),
                 BikeShareListViewModel(id: 7, text: "End"),
                 BikeShareListViewModel(id: 8, text: "Hello"),
                 BikeShareListViewModel(id: 9, text: "Hi"),
                 BikeShareListViewModel(id: 10, text: "Daniel"),
                 BikeShareListViewModel(id: 11, text: "End"),
                 BikeShareListViewModel(id: 12, text: "Hello"),
                 BikeShareListViewModel(id: 13, text: "Hi"),
                 BikeShareListViewModel(id: 23, text: "Daniel"),
                 BikeShareListViewModel(id: 34, text: "End"),
                 BikeShareListViewModel(id: 45, text: "Hello"),
                 BikeShareListViewModel(id: 56, text: "Hi"),
                 BikeShareListViewModel(id: 66, text: "Daniel"),
                 BikeShareListViewModel(id: 77, text: "End"),
                 BikeShareListViewModel(id: 86, text: "Hello"),
                 BikeShareListViewModel(id: 96, text: "Hi"),
                 BikeShareListViewModel(id: 106, text: "Daniel"),
                 BikeShareListViewModel(id: 116, text: "End"),
                 BikeShareListViewModel(id: 120, text: "Hello"),
                 BikeShareListViewModel(id: 122, text: "Hi"),
                 BikeShareListViewModel(id: 222, text: "Daniel"),
                 BikeShareListViewModel(id: 322, text: "End"),
                 BikeShareListViewModel(id: 422, text: "Hello"),
                 BikeShareListViewModel(id: 522, text: "Hi"),
                 BikeShareListViewModel(id: 622, text: "Daniel"),
                 BikeShareListViewModel(id: 722, text: "End"),
                 BikeShareListViewModel(id: 822, text: "Hello"),
                 BikeShareListViewModel(id: 922, text: "Hi"),
                 BikeShareListViewModel(id: 10222, text: "Daniel"),
                 BikeShareListViewModel(id: 11222, text: "End")]

    var body: some View {
        List(items) { viewModel in
            Text(viewModel.text).frame(height: 25)
        }
    }
}

struct BikeShareList_Previews: PreviewProvider {
    static var previews: some View {
        BikeShareList()
    }
}
