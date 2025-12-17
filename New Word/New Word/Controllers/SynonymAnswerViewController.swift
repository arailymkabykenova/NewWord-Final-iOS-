//
//  SynonymAnswerViewController.swift
//  New Word
//
//  Created by Арайлым Кабыкенова on 17.12.2025.
//

import UIKit
class SynonymAnswerViewController:UIViewController{
    @IBOutlet var labelImageViews:[UIView]!
    @IBOutlet weak var wordLabel:UILabel!
    @IBOutlet weak var meaningLabel:UILabel!
    @IBOutlet weak var synonymLabel: UILabel!
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet var buttonAppearance:[UIButton]!
    @IBAction func addPhotoButton(_ sender: Any) {
    }
    
    @IBAction func safeButton(_ sender: Any) {
    }
    
    @IBOutlet weak var photoViewImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
