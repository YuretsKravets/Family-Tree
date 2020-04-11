//
//  AppView.swift
//  Family Tree
//
//  Created by Yurii Kravets on 01/04/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI

struct AppView: View {

    @EnvironmentObject var session: SessionStore

    var body: some View {
        
            TreeView(dataModel: TreeView.DemoData())
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
