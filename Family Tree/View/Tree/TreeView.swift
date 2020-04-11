//
//  ContentView.swift
//  My Family
//
//  Created by Yurii Kravets on 21/03/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI

struct TreeView: View {
    
    @ObservedObject var dataModel: DemoData
    
    var body: some View {
        ZStack {
            Color(K.Colors.green)
                .edgesIgnoringSafeArea(.all)
            Diagram(tree: dataModel.tree, node: { node in
                MemberView(member: node)
            })
            .onAppear {
                self.dataModel.loadTree()
            }
        }
    }
}

//MARK: - ViewModel Test Data

extension TreeView {
    class DemoData: ObservableObject {
        
        @Published var tree : Tree<Person>
        
        init() {
            let johnDoe = Person(id: "ID", name: "John", surname: "Doe", born: 0, died: 0, avatar: K.Images.defaultAvatar)
            tree = Tree(johnDoe)
        }
        
        func loadTree() {
            let dmitrii = Person(id: "0", name: "Dmitrii", surname: "Kravets", born: 1972, died: 0, avatar: K.Images.defaultAvatar)
            let yevgen = Person(id: "1", name: "Yevgen", surname: "Kravets", born: 1990, died: 0, avatar: K.Images.defaultAvatar)
            let yurii = Person(id: "2", name: "Yurii", surname: "Kravets", born: 1995, died: 0, avatar: K.Images.defaultAvatar)
            let zlata = Person(id: "3", name: "Zlata", surname: "Kravets", born: 2011, died: 0, avatar: K.Images.defaultAvatar)
            let gabi = Person(id: "11", name: "Gabriel", surname: "Kravets", born: 2016, died: 0, avatar: K.Images.defaultAvatar)
            
            let familyTree = Tree<Person>(dmitrii, children: [
                Tree<Person>(yevgen, children: [
                    Tree<Person>(gabi)
                ]),
                Tree<Person>(yurii),
                Tree<Person>(zlata)
            ])
            tree = familyTree
        }
    }
}

