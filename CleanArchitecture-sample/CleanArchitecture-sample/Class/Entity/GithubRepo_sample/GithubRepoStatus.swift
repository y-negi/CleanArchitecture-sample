//
//  GithubRepoStatus.swift
//  CleanArchitecture-sample
//
//  Created by 根岸裕太 on 2019/02/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import Foundation

// GithubRepoのコメントに書いた通り、「GithubRepoの状態」で1クラス。
// さらに、「GithubRepoの状態リスト」も別で実装する。
// これはGithubRepoの状態リストへの操作をひとまとめにするため。
// 単純にビジネスロジックを隠蔽することで、変更に強いクラスにする。(→GithubRepoStatusList.swift参照)
struct GithubRepoStatus {
    let repo: GithubRepo
    let isLiked: Bool
}
