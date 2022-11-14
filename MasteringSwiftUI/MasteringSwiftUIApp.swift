//
//  MasteringSwiftUIApp.swift
//  MasteringSwiftUI
//
//  Created by Blanc on 2022/11/13.
//

import SwiftUI

/*
 @main
  - 컴파일러가 메인함수를 자동으로 합성?(잘 안들림..)
  - OS 가 가장 먼저 실행하며, 플랫폼에 적합한 방식으로 초기화 과정을 담당

 App (Protocol)
  - Main: 함수의 기본 구현을 제공
  - Body: 화면 표시
  - Scene: 뷰 계층을 담고있는 컨테이너 -> 뷰 계층을 표시하는 시점, 방식을 자동으로 결정 및 처리 해줌
    - WindowGroup: SwiftUI가 제공하는 가장 기본적인 Scene
    - DocumentGroup: 문서 기반 앱을 만들때 사용
    - 별도의 커스텀 씬
 
 Application Level에서 데이터를 전달 할 수 있는 방법 2가지
  - 인스턴스를 하나 만들어 " .environmentObject " 와 ". 생성자(App Delegate) "를 통해 데이터 전달 가능
  - SwiftUI는 App Delegate 자동으로 생성하지 않음
  - 단, Push Notification을 구현해야 한다면 반드시 App Delegate를 연결해야함.
 */

class Model: ObservableObject {
    
}

@main
struct MasteringSwiftUIApp: App {
    @StateObject private var model = Model()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        CustomScene()
//        WindowGroup {
//            ContentView()
//                .environmentObject(model)
//        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    //NSObject나 UIResponder를 상속 받아야 함.
    //원하는 Method를 구현
}

/*
 Scene의 상태는 active, inactive, background
  - active: 화면에 표시되어 있는 상태에서 touch와 같은 evnet 처리가 가능한 상태
  - inactive: 화면에 표시되어 있지만 event 처리가 불가능한 상태
  - background: 화면에 표시되지않고 background에 있는 상태
  - 화면 상태에 따른 처리를 하고싶다면 Modifier 의 ".onChange()" 를 통해 처리
  - 주의 할 점: Scene이 2개 이상 일 경우 하나라도 active 상태가 있다면 active가 리턴 될 수 있음.
            모든 Scene이 inactive 상태일 때만 inactive 리턴
 
 */
struct CustomScene: Scene {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentViewSecond()
        }.onChange(of: scenePhase) { (phase) in
            switch phase {
            case .background:
                break
            case .inactive:
                break
            case .active:
                break
            @unknown default:
                break
            }
        }
    }
}
