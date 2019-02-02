//
//  Application.swift
//  CleanArchitecture-sample
//
//  Created by 根岸裕太 on 2019/02/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import UIKit

// 初回画面の表示を行なっている。
// 画面遷移を実装する時はここにメソッド増やすかな。。
// そこに人による差異が生まれるならRouterかCoordinator取り入れた方がいいかも。

class Application {
    
    // シングルトン
    static let shared = Application()
    private init() {}
    
    // UseCase
    private(set) var useCase: FruitsUseCase!
    
    func configure(with window: UIWindow) {
        self.buildLayer()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? FruitsViewController {
            vc.presenter = FruitsPresenter(useCase: self.useCase)
            window.rootViewController = vc
        }
    }
    
    private func buildLayer() {
        
        self.useCase = FruitsUseCase()
        
        self.useCase.fruitsGateway = FruitsGateway()
    }
    
}
