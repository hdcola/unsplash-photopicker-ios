//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by 老房东 on 2022-11-14.
//

import SwiftUI
import UnsplashPhotoPicker

struct ContentView: View {
    @State var images = [UnsplashPhoto]()
    @State var query = ""
    @State var search = false
    var body: some View {
        VStack {
            TextField("search photos", text: $query)
            Button{
                search = true
            }label: {
                Label("selectIcon", systemImage: "square.and.pencil.circle.fill")
            }
        }
        .sheet(isPresented: $search){
            UnsplashSearchView(query: query,images: $images)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
