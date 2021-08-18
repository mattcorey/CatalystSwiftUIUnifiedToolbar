//
//  InspectorView.swift
//  InspectorView
//
//  Created by Matthew Corey on 8/17/21.
//

import SwiftUI

struct InspectorView: View {
    var body: some View {
        HStack(spacing: 0) {
            Divider()
            
            VStack {
                Text("Inspector!")
            }
            .frame(maxWidth: .infinity)
        }
        .frame(width: 200)
        .transition(.move(edge: .trailing))
    }
}

struct InspectorView_Previews: PreviewProvider {
    static var previews: some View {
        InspectorView()
    }
}
