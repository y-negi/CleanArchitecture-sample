//
//  GithubRepo.swift
//  CleanArchitecture-sample
//
//  Created by 根岸裕太 on 2019/02/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation

// 使っていない。
// 写経してて参考になったので配置した。

// アプリケーション内での共通認識におけるデータをEntityに定義する。
// 最小単位は以下のようにDDDにおけるEntityに近いようなイメージになる。
// Entity以下のGithubRepoに付属するがデータ概念的にGithubRepoじゃないものがある場合
// 例えば、Githubでのお気に入り状態は別APIでidを元に引いてくるもののため、ここに組み込まない。
// 「GithubRepoの状態」という意味を持つEntityを別で作る。(→GithubRepoStatus.swift参照)
// 「画面表示するデータ」と「実際の概念的なデータ」で切り離して考えるのがいいかも。
struct GithubRepo {
    // idを元に引いてくることがあるためhashableに。
    struct ID: RawRepresentable, Hashable {
        let rawValue: String
    }
    
    let id: ID
    let name: String
    let description: String
}
