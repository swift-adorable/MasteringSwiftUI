//
//  ContentView.swift
//  MasteringSwiftUI
//
//  Created by Blanc on 2022/11/13.
//

import SwiftUI

/*
 코드를 수정하다보면 Preview 가 자동으로 중지되는데 opt + cmd + p 로 다시 시작 가능
 
 프리뷰 화면 위 메뉴 바
 - 1. 플레이 버튼: 시뮬레이터 같은 기능
 - 2. 실제 기기에서 프리뷰 기능 지원
 - 3. 화면 방향 전환
 - 4. 프리뷰 화면의 여러 기능(디바이스 모델, 다크 모드 등등)
 - 5. 프리뷰 복제 (여러 상황의 화면을 보고 싶을 때?)
 
 */

struct ContentView: View {
    
    @State private var value: Double = 0
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .foregroundColor(.white)
                .background(.black)
                .border(.gray, width: 2)
            Text("\(value)")
            Slider(value: $value)
                .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //프리뷰의 화면 자동 전환은 iOS 15 이상만 지원
        if #available(iOS 15.0, *) {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        } else {
            ContentView()
        }
    }
}

