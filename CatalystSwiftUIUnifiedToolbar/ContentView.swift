//
//  ContentView.swift
//  CatalystSwiftUIUnifiedToolbar
//
//  Created by Matthew Corey on 8/17/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var showInspector: Bool
    @Binding var showSheet: Bool
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Sidebar")) {
                    Label("Item 1", systemImage: "gear")
                    Label("Item 2", systemImage: "brain")
                    Label("Item 3", systemImage: "lungs")
                    Label("Item 4", systemImage: "eyes")
                }
            }
            .navigationBarHidden(true)
            .listStyle(.sidebar)
            
            HStack(spacing: 0) {
                Text("Content")
                    .navigationBarHidden(true)
                    .navigationTitle("Universal Toolbar, with Catalyst and SwiftUI Lifecycle")
                    .navigationSubtitle("With a Subtitle!")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(.secondarySystemBackground))

            
                if showInspector {
                    InspectorView()
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                Text("Sheet!")
                    .frame(maxHeight: .infinity)
                
                Button {
                    showSheet = false
                } label: {
                    Text("Close")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
        }
    }
}
