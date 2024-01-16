//
//  ViewController.swift
//  Instagram
//
//  Created by dreaMTank on 2024/01/08.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.identifier)
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        
        //未確認の場合の処理を実行
        handleNotAuthenticated()
       
        
    }
     
    private func handleNotAuthenticated(){
        //確認のステータスを確認
        if Auth.auth().currentUser == nil {
            //ログイン画面を表示
            let loginVc = LoginViewController()
            loginVc.modalPresentationStyle = .fullScreen
            present(loginVc, animated: false)
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
     
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.identifier, for: indexPath) as! IGFeedPostTableViewCell
        return cell
    }
}
