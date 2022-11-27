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

struct Alert_Tutorials: View {
    @State private var message = ""
    
    @State private var showAlert = false
    @State private var showImageAlert = false
    @State private var imageData: ImageData? = nil
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
            
            Button {
                imageData = ImageData.sample
                showImageAlert = true
//                showAlert = true
            } label: {
                Text("Show Alert")
            }
            .padding()
            .alert("Alert", isPresented: $showAlert) {
                Button("OK") {
                    message = "OK!!"
                }
                Button(role: .cancel) {
                    message = "Cancel!!"
                } label: {
                    Text("Cacnel")
                }

                Button(role: .destructive) {
                    message = "remove!!"
                } label: {
                    Text("Remove")
                }

            } message: {
                Text("Watch out!!!")
            }
            .alert("Alert", isPresented: $showImageAlert, presenting: imageData) { data in
                Button("Filter Apply") {
                    message = data.filters.joined(separator: ", ") + " Filter Applying"
                }
                Button(role: .cancel) {
                    message = "Cancel!!"
                } label: {
                    Text("Cacnel")
                }

                Button(role: .destructive) {
                    message = "\(data.name) remove"
                } label: {
                    Text("Remove")
                }
            } message: { data in
                Text("\(data.name) 파일에서 어떤 작업을 할까요?\n\n촬영 일자: \(data.date)")
            }
        }
        

        
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        Alert_Tutorials()
    }
}
