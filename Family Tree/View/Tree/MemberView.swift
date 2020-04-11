//
//  MemberView.swift
//  My Family
//
//  Created by Yurii Kravets on 21/03/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI

struct MemberView: View {

    let member: Person
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.white)
            .frame(width: 120, height: 150, alignment: .center)
            .overlay(
                VStack {
                    Image(member.avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("\(member.name) \(member.surname)")
                    Text(member.getLifetime())
                }.padding(.all), alignment: .center
            )
        
        
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView(member:
            Person(
                id: "0",
                fatherID: nil,
                motherID: nil,
                spouseID: nil,
                name: "John",
                surname: "Doe",
                born: 0,
                died: 0,
                avatar: K.Images.defaultAvatar
            )
        )
            .previewLayout(.sizeThatFits)
    }
}
