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

    var body: some View {
        NavigationView {
            List(people, id: \.self) { person in
                Text(person.name ?? "")
            }
        }.onAppear {
            PersonEntity.create()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
