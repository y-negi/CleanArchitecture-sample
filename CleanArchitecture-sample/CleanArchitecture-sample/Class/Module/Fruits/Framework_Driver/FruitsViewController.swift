//
//  FruitsViewController.swift
//  CleanArchitecture-sample
//
//  Created by 根岸裕太 on 2019/02/02.
//  Copyright © 2019年 根岸裕太. All rights reserved.
//

import UIKit

final class FruitsViewController: UIViewController {
    var presenter: FruitsPresenterInput! {
        didSet {
            self.presenter.output = self
        }
    }

    // DataSource
    private var cells: [FruitListCellType] = []
    
    // IBOutlet
    @IBOutlet private weak var fruitsTableView: UITableView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewDidLoad()
    }

}

// MARK: - FruitsPresenterOutput

extension FruitsViewController: FruitsPresenterOutput {
    
    func reloadData(_ datas: [FruitListCellType]) {
        self.cells = datas
        
        self.fruitsTableView.reloadData()
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FruitsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        switch cells[indexPath.row] {
        case .fruit(let fruit):
            cell.textLabel?.text = fruit.name
        }
        
        return cell
    }
    
}
