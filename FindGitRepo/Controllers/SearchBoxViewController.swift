//
//  SearchBoxViewController.swift
//  FindGitRepo
//  User can enter any programming language and search repositories
//  Created by Shashank Mishra on 25/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import UIKit

class SearchBoxViewController: UIViewController {
    
    @IBOutlet weak var languageTextField: UITextField!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //open keyboard
        languageTextField.becomeFirstResponder()
        
    }
    
    @IBAction func searchButtonAction(_ sender: AnyObject) {
        
        //Go to fetch list
        gotoListView()
        
    }
    
    func gotoListView() {
        guard let text = languageTextField.text, !text.isEmpty else {
            let alert = UIAlertController(title: nil, message: "Please enter any programming language.", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        self.performSegue(withIdentifier: "RepoListSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "RepoListSegue" {
            let repoListVC = segue.destination as! RepositoryListViewController
            repoListVC.language = languageTextField.text
        }
        
    }
    
}

extension SearchBoxViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Go to fetch list
        gotoListView()
        return true
    }
}

