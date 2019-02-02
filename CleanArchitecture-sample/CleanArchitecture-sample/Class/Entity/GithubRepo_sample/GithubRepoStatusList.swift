//
//  GithubRepoStatusList.swift
//  CleanArchitecture-sample
//
//  Created by 根岸裕太 on 2019/02/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation

// コレクションの操作をそれ用のクラスを作ってひとまとめにしている。
// 正直ここまでやるか?感あるけど、どうせCleanArchitecture導入するくらい大規模ならやってもいいのかも。
struct GithubRepoStatusList {
    private(set) var status: [GithubRepoStatus]
    
    init(repos: [GithubRepo], likes: [GithubRepo.ID: Bool]) {
        // めんどいから書いてない
        self.status = []
    }
    
    mutating func append(repo: GithubRepo, isLiked: Bool) {
        self.status.append(GithubRepoStatus(repo: repo, isLiked: isLiked))
    }
    
    mutating func set(isLiked: Bool, id: GithubRepo.ID) {
        // ...
    }
    
    subscript(id: GithubRepo.ID) -> GithubRepoStatus? {
        // ...
        return nil
    }
    
}
