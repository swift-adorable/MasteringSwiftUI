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

struct ConfirmationDialog_Tutorials: View {
    
    @State private var showDialog = false
    
    @State private var color = Color.black
    
    var body: some View {
        VStack {
            Spacer()
            
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
            
            Spacer()
            
            Button {
                showDialog = true
            } label: {
                Text("Select Color")
            }
            .confirmationDialog("Choice Color", isPresented: $showDialog, presenting: ColorData.samples) { (colors) in
                
                ForEach(colors) { item in
                    Button(item.title) {
                        color = item.color
                    }
                }
//                Button("Red") {
//                    color = .red
//                }
//                Button("Green") {
//                    color = .green
//                }
//                Button("Blue") {
//                    color = .blue
//                }
//                Button(role: .cancel) {
//
//                } label: {
//                    Text("Cancel")
//                }
//                Button(role: .destructive) {
//                    color = .black
//                } label: {
//                    Text("Destructive")
//                }

            } message: { _ in
                Text("What do u want color?")
            }

        }
    }
}

struct ConfirmationDialog_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialog_Tutorials()
    }
}
