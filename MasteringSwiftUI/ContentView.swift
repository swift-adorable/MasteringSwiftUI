//
//  ContentView.swift
//  MasteringSwiftUI
//
//  Created by Blanc on 2022/11/13.
//

import SwiftUI

/*
 
 View 는 UI를 구성하는 가장 기본적인 요소
  - UIKit의 View는 class로 구현하며 상속 받는 멤버가 많아 무거움
  - SwiftUI는 상속하는 멤버가 없음
  - 값 형식으로 구현하기 떄문에 레퍼런스 카운팅같은 오버헤드가 없음
  - 가볍고 레이아웃 성능이 높음. 뷰를 잘게 쪼개서 구현하고 여러 단계로 중첩해 구현하더라도 런타임 오버헤드가 없음.
  - 기본적으로 화면 중앙을 기준으로 배치하지만 Swift는 왼쪽 상단을 기준으로 배치
 
 화면의 Life Cycle 시점에서의 작업을 하고 싶다면 Swift는 UIKit의 viewDidAppear 같은 메소드를 오버라이딩 해서 구현하지만 SwiftUI는 Modifier를 통해 구현
 Modifier
  - 모든 Modifier는 View를 리턴하므로 Chaining이 가능하다.(순서가 중요)
 
 Body 속성안에서는 하나의 뷰만 리턴해야함.
 
 @State
  - @State를 붙이면 SwiftUI가 해당 속성을 자동으로 관리해줌.
 
 */

struct ContentView: View {
    
    @State private var value: Double = 0
    @State private var randNo = "0"
    
    var body: some View {
        VStack {
            
            Text("Padding First, Background Second")
                .padding()
                .background(.gray)
            Text("Background First, Padding Second")
                .background(.gray)
                .padding()
            
            Text("Hello, world \(randNo)!")
                .padding()
                .font(.footnote)
                .foregroundColor(.white)
                .background(.black)
                .border(.gray, width: 2)
            Button {
                randNo = "\(Int.random(in: 1 ... 100))"
            } label: {
                Text("Random Number")
                    .foregroundColor(.black)
                    .background(.bar)
            }.padding(.bottom, 10)
            Text("\(value)")
            Slider(value: $value)
                .padding(.horizontal)
        }
        .onAppear {
            //viewDidAppear와 같은 개념
        }
        .onDisappear {
            //viewDidDisappear와 같은 개념
        }
    }
}
/*
 코드를 수정하다보면 Preview 가 자동으로 중지되는데 opt + cmd + p 로 다시 시작 가능
 
 프리뷰 화면 위 메뉴 바 (왼쪽부터 오른쪽 기준)
  - 1. 시뮬레이터 같은 기능
  - 2. 실제 기기에서 프리뷰 기능 지원
  - 3. 화면 방향 전환
  - 4. 프리뷰 화면의 여러 기능(디바이스 모델, 다크 모드 등등)
  - 5. 프리뷰 복제 (여러 상황의 화면을 보고 싶을 때?)
 */

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

