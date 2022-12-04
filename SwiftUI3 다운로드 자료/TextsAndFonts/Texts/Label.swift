//
//  Mastering SwiftUI
//  Copyright (c) KxCoding <help@kxcoding.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import SwiftUI

struct Label_Tutorials: View {
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Image(systemName: "person")
                Text("User Profile")
            }
            .font(.largeTitle)
            //SF Symbols - Apple에서 제공
            Label("User Profile", systemImage: "person")
                .font(.largeTitle)
            
            HStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: 60)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.blue)
                    }
                
                Text("KxCoding")
                    .font(.largeTitle)
            }
            
            Label {
                Text("KxCoding")
                    .font(.largeTitle)
            } icon: {
                Image("logo")
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: 60)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.blue)
                    }
            }
        }
        .toolbar {
            Button {
                
            } label: {
                Label("User Profile", systemImage: "person")
                    .labelStyle(.titleAndIcon)
                //Label은 context에 따라 자동으로 표시 방식이 달라짐.
//                HStack {
//                    Image(systemName: "person")
//                    Text("User Profile")
//                }
            }
        }
    }
}

struct Label_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Label_Tutorials()
                .navigationTitle("Label")
        }
    }
}
