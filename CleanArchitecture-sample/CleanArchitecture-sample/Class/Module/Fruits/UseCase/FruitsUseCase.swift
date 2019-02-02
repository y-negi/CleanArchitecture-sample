//
//  FruitsUseCase.swift
//  CleanArchitecture-sample
//
//  Created by 根岸裕太 on 2019/02/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation

// UseCaseクラスにはアプリ及び画面におけるビジネスロジックが記載される。
// ただし、実際の外部とのやりとり(API等)はGatewayを通じて行う。

protocol FruitsUseCaseInput: AnyObject {
    var output: FruitsUseCaseOutput! { get set }
    var fruitsGateway: FruitsGatewayInput! { get set }
    
    func loadFruits()
}

protocol FruitsUseCaseOutput: AnyObject {
    func didLoadedFruits(_ fruits: [Fruit])
}

final class FruitsUseCase: FruitsUseCaseInput {
    var output: FruitsUseCaseOutput!
    var fruitsGateway: FruitsGatewayInput!
    
    func loadFruits() {
        
        self.fruitsGateway.fetch { (fruits) in
            self.output.didLoadedFruits(fruits)
        }
        
    }
    
}
