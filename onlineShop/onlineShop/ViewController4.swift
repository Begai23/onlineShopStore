//
//  ViewController4.swift
//  onlineShop
//
//  Created by Begai Bakytovna on 25/12/23.
//

import UIKit

class ViewController4: UIViewController {
    let image = UIImage(named: "wallpaper6")
    let generalButton = UIButton()
    let shopPageButton = UIButton()
    let cropButton = UIButton()
    let accontButton = UIButton()
// account
    let imformationButton = UIButton()
    let name  = UITextField()
    let surName = UITextField()
    let phoneNumber = UITextField()
    let address = UITextField()
    let cardNumber = UITextField()
    let delivery = UITextField()
    let paymentButton = UIButton()
    var pickerDelivery = UIDatePicker()

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

        /// account
        self.imformationButton.frame = CGRect(x: 30, y: 100, width: 350, height: 55)
        self.view.addSubview(imformationButton)
        self.imformationButton.layer.cornerRadius = 12
        self.imformationButton.backgroundColor = .blue
        self.imformationButton.setImage(UIImage(systemName: "person"), for: .normal)
        self.imformationButton.setTitle("       Personal information", for: .normal)
        self.imformationButton.tintColor = .white
        
        self.name.frame = CGRect(x: 30, y: 170, width: 350, height: 55)
        view.addSubview(name)
        self.name.attributedPlaceholder = NSAttributedString(string: "Enter your name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
        self.name.borderStyle = .bezel
        
        
        self.surName.frame = CGRect(x: 30, y: 240, width: 350, height: 55)
        view.addSubview(surName)
        self.surName.attributedPlaceholder = NSAttributedString(string: "Enter your surname", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
        self.surName.borderStyle = .bezel
        
        self.phoneNumber.frame = CGRect(x: 30, y: 310, width: 350, height: 55)
        view.addSubview(phoneNumber)
        self.phoneNumber.attributedPlaceholder = NSAttributedString(string: "Enter your phone number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
        self.phoneNumber.borderStyle = .bezel
        
        self.address.frame = CGRect(x: 30, y: 380, width: 350, height: 55)
        view.addSubview(address)
        self.address.attributedPlaceholder = NSAttributedString(string: "Enter your address", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
        self.address.borderStyle = .bezel
        
        self.delivery.frame = CGRect(x: 30, y: 450, width: 350, height: 55)
        view.addSubview(delivery)
        self.delivery.attributedPlaceholder = NSAttributedString(string: "Choose the delivery date", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
        self.delivery.borderStyle = .bezel
        
        self.cardNumber.frame = CGRect(x: 30, y: 520, width: 350, height: 55)
        view.addSubview(cardNumber)
        self.cardNumber.attributedPlaceholder = NSAttributedString(string: "Enter your card details", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
        self.cardNumber.borderStyle = .bezel
        
        self.paymentButton.frame = CGRect(x: 80, y: 600, width: 250, height: 60)
        view.addSubview(paymentButton)
        self.paymentButton.layer.cornerRadius = 15
        self.paymentButton.backgroundColor = .red
        self.paymentButton.setTitle("Place an order", for: .normal)
        self.paymentButton.tintColor = .black
        self.paymentButton.addTarget(self, action: #selector(payment), for: .touchUpInside)
        
        
        createDatePicker()
        pickerDelivery.preferredDatePickerStyle = .inline
        delivery.inputView = pickerDelivery
        // Do any additional setup after loading the view.
    }
    
    
    
    // alert
    @objc  func payment () {
        if name.text!.isEmpty || surName.text!.isEmpty || phoneNumber.text!.isEmpty ||
            address.text!.isEmpty || delivery.text!.isEmpty || cardNumber.text!.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Fill in the empty fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        let lastController = ViewController()
        navigationController?.pushViewController(lastController, animated: true)
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
        navigationController?.pushViewController(thirdController, animated: true)
    }
     @objc func accountButtonClick() {
        let fourthController = ViewController4()
        navigationController?.pushViewController(fourthController, animated: false)
    }
    
    
    /// picker
    func createDatePicker () {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //barButon
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateAction))
        toolbar.setItems([doneButton], animated: true)
        delivery.inputAccessoryView = toolbar
        delivery.inputView = pickerDelivery
        pickerDelivery.datePickerMode = .date
    }
    @objc func doneDateAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
       // formatter.locale = .init(identifier: "Russian")
        
        delivery.text = formatter.string(from: pickerDelivery.date)
        view.endEditing(true)
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
