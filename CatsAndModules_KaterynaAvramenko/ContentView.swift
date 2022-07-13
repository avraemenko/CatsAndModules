//
//  ContentView.swift
//  CatsAndModules_KaterynaAvramenko
//
//  Created by Kate Avramenko on 25.06.2022.
//

import SwiftUI
import Networking
import SDWebImageSwiftUI
import FirebasePerformance
import FirebaseCrashlytics

//
struct ContentView: View {
    
    let trace = Performance.startTrace(name: "trace-of-the-fetch")
    let trace2 = Performance.startTrace(name: "trace-of-the-image")
    @ObservedObject var dataFetcher = DataFetcher(limit: 7, page: 1)
    
    var body: some View {
        NavigationView{
            ScrollView {
                Button("Crash") {
                    Crashlytics.crashlytics().log("The app crashed!")
                    fatalError("Crash was triggered")
                }
                LazyVStack(spacing: 5) {
                    ForEach(dataFetcher.cats) { cat in
                        NavigationLink {
                            WebImage(url: URL(string: cat.url))
                                .resizable()
                                .scaledToFit()
                                .onAppear {
//                                    Crashlytics.crashlytics().log("Higgs-Boson detected!")
//                                    Crashlytics.crashlytics().record(error: Error.self as! Error)
//                                    Crashlytics.crashlytics().setCustomValue(100, forKey: "int_key")
//                                    Crashlytics.crashlytics().setCustomValue(50, forKey: "int_key")
                                    trace2?.stop()
                                }
                        }
                    label: {
                        WebImage(url: URL(string: cat.url))
                            .resizable()
                            .scaledToFit()
                    }
                    }
                    Color.clear
                        .frame(width: 0, height: 0, alignment: .bottom)
                        .onAppear {
                            dataFetcher.fetchMoreData()
                            trace?.stop()
                        }
                }.navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.inline)
            }.accessibilityIdentifier("testBasic")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
