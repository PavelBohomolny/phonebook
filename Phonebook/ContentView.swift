//
//  ContentView.swift
//  Phonebook
//
//  Created by Pavel Bohomolnyi on 13/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    private var people: [Person] = Person.allPeople
    
    var body: some View {
        NavigationView {
            List {
                ForEach(people, id:\.firstName) { person in
                    NavigationLink(destination: DetailView(person: person)) {
                        VStack(alignment: .leading) {
                            Text("\(person.firstName) \(person.surname)")
                                .bold()
                            Text("\(person.phoneNumbers[0].number)")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(6)
                }
                .navigationTitle("Phonebook")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

