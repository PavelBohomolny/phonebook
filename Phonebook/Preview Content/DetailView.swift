//
//  DetailView.swift
//  Phonebook
//
//  Created by Pavel Bohomolnyi on 13/07/2022.
//

import SwiftUI

struct DetailView: View {
    
    var person: Person
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(person.firstName) \(person.surname)")
                .bold()
            Text("\(person.phoneNumbers[0].number)")
            Text("\(person.address.streetAddress)")
            Text("\(person.address.city)")
            Text("\(person.gender)")
            Text("\(person.age) y.o.")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person.samplePerson)
    }
}
