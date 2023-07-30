//
//  LoadingRectangle.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-29.
//

import SwiftUI

struct LoadingRectangle: View {
    var progress: CGFloat
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color(UIColor.systemGray))
                    .cornerRadius(5)

                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(Color(UIColor.label))
                    .cornerRadius(5)
            }
        }
    }
}

struct LoadingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        LoadingRectangle(progress: 0)
    }
}
