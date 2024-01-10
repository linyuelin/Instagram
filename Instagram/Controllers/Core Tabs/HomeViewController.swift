//
//  ViewController.swift
//  Instagram
//
//  Created by dreaMTank on 2024/01/08.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

