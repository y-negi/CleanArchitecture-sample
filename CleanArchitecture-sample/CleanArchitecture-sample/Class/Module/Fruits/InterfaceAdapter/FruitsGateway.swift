//
//  FruitsGateway.swift
//  CleanArchitecture-sample
//
//  Created by 根岸裕太 on 2019/02/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation

// 外部とのやりとりを行う。

protocol FruitsGatewayInput: AnyObject {
    func fetch(completion: @escaping ([Fruit]) -> Void)
}

final class FruitsGateway: FruitsGatewayInput {
    
    func fetch(completion: @escaping ([Fruit]) -> Void) {
        // 通信するいめーじ
        
        completion([
            Fruit(id: 0, name: "りんご", description: "あか"),
            Fruit(id: 1, name: "ばなな", description: "きいろ"),
            Fruit(id: 2, name: "ぶどう", description: "むらさき！")
            ])
    }

}
