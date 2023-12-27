//
//  ViewController.swift
//  onlineShop
//
//  Created by Begai Bakytovna on 25/12/23.
//

import UIKit

class ViewController: UIViewController {
    /// buttons
    let generalButton = UIButton()
    let shopPageButton = UIButton()
    let cropButton = UIButton()
    let accontButton = UIButton()
    let image = UIImage(named: "wallpaper6")
    let image2 = UIImage(named: "welcome")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// view for buttons
        view.backgroundColor = .white
        /// image set
        let dressV = UIImageView(image: image!)
        dressV.frame = CGRect(x: 10, y: 40, width: 400, height: 850)
        view.addSubview(dressV)
       
        let welcome = UIImageView(image: image2)
        welcome.frame = CGRect(x: 10, y: 100, width: 380, height: 400)
        view.addSubview(welcome)
        self.generalButton.frame = CGRect(x: 25, y: 700, width: 80, height: 60)
        self.view.addSubview(generalButton)
        self.generalButton.layer.cornerRadius = 12
        self.generalButton.backgroundColor = .blue
        self.generalButton.setImage(UIImage(systemName: "homekit"), for: .normal)
        self.generalButton.tintColor = .white
        self.generalButton.addTarget(self, action: #selector(generalButtonClick), for: .touchUpInside)
        
        self.shopPageButton.frame = CGRect(x: 110, y: 700, width: 80, height: 60)
        self.view.addSubview(shopPageButton)
        self.shopPageButton.layer.cornerRadius = 12
        self.shopPageButton.backgroundColor = .blue
        self.shopPageButton.setImage(UIImage(systemName: "bag.fill"), for: .normal)
        self.shopPageButton.tintColor = .white
        self.shopPageButton.addTarget(self, action: #selector(shopPageButtonClick), for: .touchUpInside)
        
        self.cropButton.frame = CGRect(x: 195, y: 700, width: 80, height: 60)
        self.view.addSubview(cropButton)
        self.cropButton.layer.cornerRadius = 12
        self.cropButton.backgroundColor = .blue
        self.cropButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        self.cropButton.tintColor = .white
        self.cropButton.addTarget(self, action: #selector(cropButtonButtonClick), for: .touchUpInside)
        
        self.accontButton.frame = CGRect(x: 280, y: 700, width: 80, height: 60)
        self.view.addSubview(accontButton)
        self.accontButton.layer.cornerRadius = 12
        self.accontButton.backgroundColor = .blue
        self.accontButton.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        self.accontButton.tintColor = .white
        self.accontButton.addTarget(self, action: #selector(accountButtonClick), for: .touchUpInside)
        
        
        
        
        
        
    }

   
    //MARK: -Go to pages
    /// pages controllers
    @objc func generalButtonClick() {
        let firstController = ViewController()
        navigationController?.pushViewController(firstController, animated: false)
    }
    @objc func shopPageButtonClick() {
        let secondController = ViewController2()
        navigationController?.pushViewController(secondController, animated: true)
    }
    @objc func cropButtonButtonClick() {
        let thirdController = ViewController3()
        navigationController?.pushViewController(thirdController, animated: true)
    }
     @objc func accountButtonClick() {
        let fourthController = ViewController4()
        navigationController?.pushViewController(fourthController, animated: true)
    }
    

}

