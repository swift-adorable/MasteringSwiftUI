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

struct Form_Tutorials: View {
    @State private var email = ""
    @State private var password = ""
    @State private var address = ""
    @State private var age = 0
    @State private var receiveEmail = false
    
    var body: some View {
        Form {
            
            Section(content: {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                TextField("Address", text: $address)
            }, header: {
                SectionHeaderView(title: "Text Input")
            })
            
            Stepper("Age: \(age)", value: $age)
            Toggle(isOn: $receiveEmail, label: { Text("Receive Email") })
            
            Button("확인") {
                
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        Form_Tutorials()
    }
}
