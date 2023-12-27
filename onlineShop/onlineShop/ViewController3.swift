//
//  ViewController3.swift
//  onlineShop
//
//  Created by Begai Bakytovna on 25/12/23.
//

import UIKit

protocol VC3Delegate : AnyObject {
    func addBasket(image: String, price: String, size: String )
}
class ViewController3: UIViewController, VC3Delegate {
    //button
    let image = UIImage(named: "wallpaper6")
    let generalButton = UIButton()
    let shopPageButton = UIButton()
    let cropButton = UIButton()
    let accontButton = UIButton()
    let itemText = UITextField()
    let itemPhoto = UIImage ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let dressV = UIImageView(image: image!)
        dressV.frame = CGRect(x: 10, y: 40, width: 400, height: 850)
        view.addSubview(dressV)
        
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

        
        //self.itemText.frame = CGRect(x: 50, y: 100, width: 350, height: 50)
       // view.addSubview(itemText)
        //self.itemText.borderStyle = .bezel
        // Do any additional setup after loading the view.
    }
    
    // add basket
    func addBasket(image: String, price: String, size: String) {
        itemText.text = image.capitalized
        itemText.text = price
        itemText.text = size
        let foto = UIImageView(frame: CGRect(x: 10, y: 100, width: 50, height: 50))
        foto.image = UIImage(named: "blueSuit")
        foto.tintColor = .systemGray
        foto.layer.cornerRadius = 30
        foto.layer.masksToBounds = true
        self.view.addSubview(foto)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ViewController5 else {return}
        destination.delegate = self
    }
    
    
    @objc func generalButtonClick() {
        let firstController = ViewController()
        navigationController?.pushViewController(firstController, animated: true)
    }
    @objc func shopPageButtonClick() {
        let secondController = ViewController2()
        navigationController?.pushViewController(secondController, animated: true)
    }
    @objc func cropButtonButtonClick() {
        let thirdController = ViewController3()
        navigationController?.pushViewController(thirdController, animated: false)
    }
     @objc func accountButtonClick() {
        let fourthController = ViewController4()
        navigationController?.pushViewController(fourthController, animated: true)
    }
    
    // add to basket
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

