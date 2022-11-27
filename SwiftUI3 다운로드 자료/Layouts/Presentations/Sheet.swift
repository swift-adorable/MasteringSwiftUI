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

struct Sheet_Tutorials: View {
    @State private var presentCardModal = false
    @State private var presentFullScreen = false
    
    @State private var imageData: ImageData? = nil
    
    var body: some View {
        VStack {
            Button {
                //presentCardModal = true
                imageData = ImageData(name: "logo", filters: [], date: .now)
            } label: {
                Text("Card Modal")
            }
            .padding()
            //#1
//            .sheet(isPresented: $presentCardModal) {
//
//            } content: {
//                ImageScene(presentModal: $presentCardModal)
//            }
            .sheet(item: $imageData, onDismiss: {}) { imageData in
                OptionalImageScene(imageData: imageData)
            }

            Button {
                presentFullScreen = true
            } label: {
                Text("Fullscreen")
            }
            .padding()
            .fullScreenCover(isPresented: $presentFullScreen) {
                
            } content: {
                ImageScene(presentModal: $presentFullScreen)
            }

        }
    }
}

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Sheet_Tutorials()
    }
}
