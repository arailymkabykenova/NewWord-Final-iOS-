//
//  ViewController.swift
//  New Word
//
//  Created by Арайлым Кабыкенова on 15.12.2025.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var buttonLabelViews: [UIView]!
    @IBOutlet weak var chooseLangLabel: UILabel!
    @IBOutlet weak var meImage: UIImageView!
    @IBOutlet var buttonLabels:[UIButton]!
    @IBAction func chooseLevelButton(_ sender: UIButton) {
        flow.level=sender.titleLabel?.text ?? "A1"
        
        self.performSegue(withIdentifier: "level", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC=segue.destination as! TopicViewController
        destinationVC.flow=self.flow
    }
    var flow = WordFlow()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

