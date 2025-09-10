//
//  ActivityView.swift
//  Day60Challenge
//
//  Created by Santhosh Srinivas on 10/09/25.
//

import SwiftUI

struct ActivityView: View {
    
    var isActive: Bool
    
    var body: some View {
        if isActive {
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(.green)
                Text("User Active")
            }
        } else {
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(.red)
                Text("User Inactive")
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(isActive: true)
    }
}
