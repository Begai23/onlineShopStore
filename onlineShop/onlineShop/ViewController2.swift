//
//  ViewController3.swift
//  onlineShop
//
//  Created by Begai Bakytovna on 25/12/23.
//

import UIKit

class ViewController2: UIViewController {

    // list
    let image1 = UIImage(named: "wallpaper6")
    let suits = UIButton()
    let image = UIImage(named: "redSuit")
    let dress = UIButton()
    let dressImage = UIImage(named: "dress")
    let pants = UIButton()
    let pantsImage = UIImage(named: "pant")
    let shirt = UIButton()
    let shirtImage = UIImage(named: "shirt")
    let skirt = UIButton()
    let skirtImage = UIImage(named: "skirt")
    
    //button
    let generalButton = UIButton()
    let shopPageButton = UIButton()
    let cropButton = UIButton()
    let accontButton = UIButton()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let dressV = UIImageView(image: image1!)
        dressV.frame = CGRect(x: 10, y: 40, width: 400, height: 850)
        view.addSubview(dressV)
        
        
        self.suits.frame = CGRect(x: 90, y: 100, width: 300, height: 55)
        self.view.addSubview(suits)
        self.suits.setTitle("Suits", for: .normal)
        self.suits.setTitleColor(UIColor.black, for: .normal)
        self.suits.backgroundColor = .systemBlue
        self.suits.tintColor = .black
        self.suits.layer.cornerRadius = 0
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 20, y: 100, width: 70, height: 55)
        view.addSubview(imageView)
        self.suits.addTarget(self, action: #selector(suitsButtonClick), for: .touchUpInside)
        
        self.dress.frame = CGRect(x: 90, y: 160, width: 300, height: 55)
        self.view.addSubview(dress)
        self.dress.setTitle("Dressess", for: .normal)
        self.dress.setTitleColor(UIColor.black, for: .normal)
        self.dress.backgroundColor = .systemBlue
        self.dress.tintColor = .black
        let dressView = UIImageView(image: dressImage!)
        dressView.frame = CGRect(x: 20, y: 160, width: 70, height: 55)
        view.addSubview(dressView)
        self.dress.addTarget(self, action: #selector(dressesPageButtonClick), for: .touchUpInside)
        
        self.pants.frame = CGRect(x: 90, y: 220, width: 300, height: 55)
        self.view.addSubview(pants)
        self.pants.setTitle("Pants", for: .normal)
        self.pants.setTitleColor(UIColor.black, for: .normal)
        self.pants.backgroundColor = .systemBlue
        self.pants.tintColor = .black
        let pantsView = UIImageView(image: pantsImage!)
        pantsView.frame = CGRect(x: 20, y: 220, width: 70, height: 55)
        view.addSubview(pantsView)
        self.pants.addTarget(self, action: #selector(pantsPageButtonClick), for: .touchUpInside)
        
        self.shirt.frame = CGRect(x: 90, y: 280, width: 300, height: 55)
        self.view.addSubview(shirt)
        self.shirt.setTitle("Shirts", for: .normal)
        self.shirt.setTitleColor(UIColor.black, for: .normal)
        self.shirt.backgroundColor = .systemBlue
        self.shirt.tintColor = .black
        let shirtView = UIImageView(image: shirtImage!)
        shirtView.frame = CGRect(x: 20, y: 280, width: 70, height: 55)
        view.addSubview(shirtView)
        self.shirt.addTarget(self, action: #selector(shirtsPageButtonClick), for: .touchUpInside)
        
        self.skirt.frame = CGRect(x: 90, y: 340, width: 300, height: 55)
        self.view.addSubview(skirt)
        self.skirt.setTitle("Skirts", for: .normal)
        self.skirt.setTitleColor(UIColor.black, for: .normal)
        self.skirt.backgroundColor = .systemBlue
        self.skirt.tintColor = .black
        let skirtView = UIImageView(image: skirtImage!)
        skirtView.frame = CGRect(x: 20, y: 340, width: 75, height: 55)
        view.addSubview(skirtView)
        self.skirt.addTarget(self, action: #selector(skirtsPageButtonClick), for: .touchUpInside)
        
        
        //button action
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
    @objc func generalButtonClick() {
        let firstController = ViewController()
        navigationController?.pushViewController(firstController, animated: false)
    }
    @objc func shopPageButtonClick() {
        let secondController = ViewController2()
        navigationController?.pushViewController(secondController, animated: false)
    }
    @objc func cropButtonButtonClick() {
        let thirdController = ViewController3()
        navigationController?.pushViewController(thirdController, animated: true)
    }
     @objc func accountButtonClick() {
        let fourthController = ViewController4()
        navigationController?.pushViewController(fourthController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //// page buttons
    @objc func suitsButtonClick() {
        let firstController = ViewController5()
        navigationController?.pushViewController(firstController, animated: true)
    }
    @objc func dressesPageButtonClick() {
        let secondController = DressViewController ()
        navigationController?.pushViewController(secondController, animated: true)
    }
    @objc func pantsPageButtonClick() {
        let thirdController = pantsViewController ()
        navigationController?.pushViewController(thirdController, animated: true)
    }
    @objc func shirtsPageButtonClick() {
        let fourthController = ShirtsViewController()
        navigationController?.pushViewController(fourthController, animated: true)
    }
    @objc func skirtsPageButtonClick() {
        let fifthController = SkirtsViewController()
        navigationController?.pushViewController(fifthController, animated: true)
    }
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // if segue.identifier ==
    //}
    
    
    
    

}
