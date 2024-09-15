//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 柘植俊之介 on 2024/09/16.
//

import UIKit

class MemoViewController: UITabBarController, UITextFieldDelegate {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad(){
        super.viewDidLoad()
        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
}
    @IBAction func saveMemo (
        sender: Any) {
            saveData.set(titleTextField.text, forKey: "title")
            saveData.set(contentTextView.text, forKey: "content")
            
            let alert: UIAlertController = UIAlertController (title:"保存",message:"メモの保存が完了しました。",
                                                              preferredStyle: .alert)
            alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                          handler: { action in
                              self.navigationController?.popViewController(animated: true)
                          })
            )
            present(alert, animated: true, completion: nil)
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
