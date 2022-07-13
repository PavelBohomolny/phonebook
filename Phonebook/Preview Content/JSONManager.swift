//
//  JSONManager.swift
//  Phonebook
//
//  Created by Pavel Bohomolnyi on 13/07/2022.
//

import Foundation

struct Person: Codable {
    let firstName, surname, gender: String
    let age: Int
    let address: Address
    let phoneNumbers: [PhoneNumber]
    
    static let allPeople: [Person] = Bundle.main.decode(file: "data.json")
    static let samplePerson: Person = allPeople[0]
}

struct Address: Codable {
    let streetAddress, city, state, postalCode: String
}

struct PhoneNumber: Codable {
    let type, number: String
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in project!")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in project!")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in project!")
        }
        
        return loadedData
    }
}
