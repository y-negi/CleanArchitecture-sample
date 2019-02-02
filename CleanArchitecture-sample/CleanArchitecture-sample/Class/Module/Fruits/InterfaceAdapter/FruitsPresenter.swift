//
//  FruitsPresenter.swift
//  CleanArchitecture-sample
//
//  Created by 根岸裕太 on 2019/02/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation

// 画面表示用の情報
// Entityを表示用に加工したStructなんかもこの辺で宣言してもいいかも。
enum FruitListCellType {
    case fruit(fruit: Fruit)
}

// PresenterのInput
protocol FruitsPresenterInput: AnyObject {
    var output: FruitsPresenterOutput! { get set }
    
    func viewDidLoad()
}

// PresenterのOutput
protocol FruitsPresenterOutput: AnyObject {
    func reloadData(_ datas: [FruitListCellType])
}

// Presenterクラスには、Viewに表示するためのロジックが記載される。

final class FruitsPresenter: FruitsPresenterInput {
    private weak var useCase: FruitsUseCaseInput!
    
    var output: FruitsPresenterOutput!
    
    init(useCase: FruitsUseCaseInput) {
        self.useCase = useCase
        self.useCase.output = self
    }
    
    // MARK: - InputMethod
    
    func viewDidLoad() {
        self.useCase.loadFruits()
    }
    
}

// MARK: - FruitsUseCaseOutput

extension FruitsPresenter: FruitsUseCaseOutput {
    func didLoadedFruits(_ fruits: [Fruit]) {
        self.output.reloadData(fruits.map { FruitListCellType.fruit(fruit: $0) })
    }
}
