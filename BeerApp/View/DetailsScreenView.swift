//
//  DetailsScreenView.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

struct DetailsScreenView: View {
    @ObservedObject var viewModel: DetailsScreenViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreenView(viewModel: DetailsScreenViewModel())
    }
}
