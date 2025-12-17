//
//  MainTabController.swift
//  New Word
//
//  Created by Арайлым Кабыкенова on 17.12.2025.
//

import UIKit
class MainTabController:UIViewController{
    @IBOutlet var partViews:[UIView]!
    @IBOutlet weak var assetImageTop: UIImageView!
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet var buttonAppeareance:[UIButton]!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var synonymTextField: UITextField!
    
    @IBAction func generateButton(_ sender: UIButton) {
        flow.theme=topicTextField.text ?? "life"
        guard let level=flow.level , let category = flow.category , let theme = flow.theme else{return}
        let request=SendData(level: level, category: category, theme: theme)
        netManager.fetchData(endpoint: .getWord, requestData: request)
    }
    @IBAction func checkSynonymButton(_ sender: UIButton) {
        guard let word = wordLabel.text,let userAnswer=synonymTextField.text else{return}
        let synonym=SynonymData(word: word, userAnswer: userAnswer)
        netManager.fetchData(endpoint:.check, requestData:synonym)
    
    }
    var flow:WordFlow!
    let netManager=NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        netManager.delegate=self
        topicTextField.delegate=self
        synonymTextField.delegate=self
    }
}
extension MainTabController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            if textField==topicTextField{
                textField.placeholder="Enter the topic"
                if textField==synonymTextField{
                    textField.placeholder="Enter the synonym"
                }
            }
        }
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text ?? "нет ничего")
      
    }
}

    extension MainTabController:WordManagerDelegate{
        func didUpdateWord(_ wordManager: NetworkManager, _ recievedData: RecievedData) {
            wordLabel.text = recievedData.data.text
            meaningLabel.text = recievedData.data.meaning
        }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
    }

