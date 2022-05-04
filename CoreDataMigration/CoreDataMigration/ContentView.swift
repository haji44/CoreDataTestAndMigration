//
//  ContentView.swift
//  CoreDataMigration
//
//  Created by kitano hajime on 2022/04/19.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest( entity: PersonEntity.entity(), sortDescriptors: []
    ) var people: FetchedResults<PersonEntity>
    @FetchRequest( entity: ClubEntity.entity(), sortDescriptors: []
    ) var club: FetchedResults<ClubEntity>

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(people, id: \.self) { person in
                        Text(person.name ?? "")
                    }
                } header: {
                    Text("People")
                }

                Section {
                    ForEach(club, id: \.self) { entity in
                        Text(entity.name ?? "")
                    }
                } header: {
                    Text("Club")
                }

                Button {
                    let person1 = PersonEntity(context: viewContext)
                    person1.name = "Kubota"

                    let club1 = ClubEntity(context: viewContext)
                    club1.name = "Baseball"
                    person1.addToClub(club1)

                    try? viewContext.save()
                } label: {
                    Text("Add")
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
