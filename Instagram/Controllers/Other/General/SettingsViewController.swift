//
//  SettingsViewController.swift
//  Instagram
//
//  Created by dreaMTank on 2024/01/08.
//

import UIKit

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}
//ユーザーのセッティング
final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
            let tableView = UITableView(frame: .zero, style: .grouped)
            
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return tableView
        
    }()
    
    private var data = [[SettingCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func  configureModels() {
        let section = [
            SettingCellModel(title: "Log Out") { [weak self] in
                self?.didTabLogOut()
            }
        ]
        
        data.append(section)
    }
    
    private func didTabLogOut(){
        
        let actionSheet = UIAlertController(title: "ログアウト", message: "ログアウトですか", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        
        actionSheet.addAction(UIAlertAction(title: "ログアウト", style: .destructive, handler: { _ in
            AuthManager.shared.logOut(completion: { success in
                DispatchQueue.main.async{
                    if success {
                        //ログイン画面へ
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                    else {
                        //error occurred
                        fatalError("Could not log out user")
                    }
                }
                
            })
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        present(actionSheet, animated: true)
        
   
    }

}


extension SettingsViewController:UITableViewDelegate,  UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section] [indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
    
}

