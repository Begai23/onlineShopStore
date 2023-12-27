//
//  SkirtsViewController.swift
//  onlineShop
//
//  Created by Begai Bakytovna on 26/12/23.
//

import UIKit

class SkirtsViewController: UIViewController {
    var segmentName2 = UISegmentedControl()
    var nameArray2 = ["1", "2", "3", "4", "5"]
    var skirtsImages = UIImageView()
    var skirtsImagesArray = [UIImage(named: "skirt"), UIImage(named: "skirt2"), UIImage(named: "skirt3"), UIImage(named: "skirt4"), UIImage(named: "skirt5")]
    var priceArray = ["2200", "3300", "4000", "3800", "4500"]
    /// text
    let priceLabel = UILabel()
    var priceText = UITextField()
    let sizeLabel = UILabel()
    let sizeText = UITextField()
    let quantityLabel = UILabel()
    let quantityText = UITextField()
    let deliveryLabel = UILabel()
    let deliveryText = UITextField()
    //picker
    let pickerQuantity = UIPickerView()
    let pickerDelivery = UIDatePicker()
    let pickerSize = UIPickerView()
    let sizeChoice = ["S", "M", "L", "X", "XX"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        /// images
        self.skirtsImages.frame = CGRect(x: 50, y: 180, width: 300, height: 250)
        self.skirtsImages.image = skirtsImagesArray[1]
        self.view.addSubview(skirtsImages)
        
        //segment
        self.segmentName2 = UISegmentedControl(items: nameArray2)
        self.segmentName2.frame = CGRect(x: 90, y: 450, width: 200, height: 40)
        self.view.addSubview(segmentName2)
        self.segmentName2.addTarget(self, action: #selector(selectImage1), for: .valueChanged)
        self.segmentName2.addTarget(self, action: #selector(selectPrice), for: .valueChanged)
        
        self.priceLabel.frame = CGRect(x: 50, y: 520, width: 100, height: 40)
        view.addSubview(priceLabel)
        self.priceLabel.text = "Price :"
        self.priceLabel.textColor = .black
        
        
        self.sizeLabel.frame = CGRect(x: 50, y: 560, width: 200, height: 40)
        view.addSubview(sizeLabel)
        self.sizeLabel.text = "Size : "
        self.sizeLabel.textColor = .black
        
        
        self.quantityLabel.frame = CGRect(x: 50, y: 600, width: 200, height: 40)
        view.addSubview(quantityLabel)
        self.quantityLabel.text = "Quantity :"
        self.quantityLabel.textColor = .black
        
        
        self.deliveryLabel.frame = CGRect(x: 50, y: 640, width: 200, height: 40)
        view.addSubview(deliveryLabel)
        self.deliveryLabel.text = "Delivery"
        self.deliveryLabel.textColor = .black
        
        
        // textField
        self.priceText.frame = CGRect(x: 150, y: 520, width: 150, height: 30)
        view.addSubview(priceText)
        self.priceText.borderStyle = .bezel
        
        self.sizeText.frame = CGRect(x: 150, y: 560, width: 150, height: 30)
        view.addSubview(sizeText)
        self.sizeText.borderStyle = .bezel
        
        self.quantityText.frame = CGRect(x: 150, y: 600, width: 150, height: 30)
        view.addSubview(quantityText)
        self.quantityText.borderStyle = .bezel
        
        self.deliveryText.frame = CGRect(x: 150, y: 640, width: 150, height: 30)
        view.addSubview(deliveryText)
        self.deliveryText.borderStyle = .bezel
        
        pickerDelivery.preferredDatePickerStyle = .wheels
       // pickerDelivery.locale = .init(identifier: "Russian")
        deliveryText.inputView = pickerDelivery
       
        ///
        createDatePicker()
        createPicker()
        //picker
        // add pickers to textfield
        quantityText.inputView = pickerQuantity
        sizeText.inputView = pickerSize
        
        
        pickerQuantity.dataSource = self
        pickerQuantity.delegate = self
        pickerSize.dataSource = self
        pickerSize.delegate = self
        
        
       // pickerDelivery.preferredDatePickerStyle = .wheels
        pickerQuantity.tag = 0
        pickerSize.tag = 1
        
        
        
        
        // Do any additional setup after loading the view.
    }
    @objc func selectImage1 (target : UISegmentedControl) {
        if target == self.segmentName2 {
            let segmentIndex = target.selectedSegmentIndex
            self.skirtsImages.image = self.skirtsImagesArray[segmentIndex]
        }
        
    }
    @objc func selectPrice(target : UISegmentedControl) {
        if target == self.segmentName2{
            let segmentIndex = target.selectedSegmentIndex
            self.priceText.text = self.priceArray[segmentIndex]
        }
    }
    func createDatePicker () {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //barButon
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateAction))
        toolbar.setItems([doneButton], animated: true)
        deliveryText.inputAccessoryView = toolbar
        deliveryText.inputView = pickerDelivery
        pickerDelivery.datePickerMode = .date
    }
    //creating the toolbar and buttondone for picker
    func createPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneAction))
        toolbar.setItems([doneButton], animated: true)
        quantityText.inputAccessoryView = toolbar
        sizeText.inputAccessoryView = toolbar
    }
    @objc func doneDateAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
       // formatter.locale = .init(identifier: "Russian")
        deliveryText.text = formatter.string(from: pickerDelivery.date)
        view.endEditing(true)
    }
    ////for picker gender and age
    @objc func doneAction() {
        view.endEditing(true)
    }
    ///cancel
    @objc func cancelAction() {
        dismiss(animated: true, completion: nil)
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
extension SkirtsViewController :  UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 0 : return 10
        case 1: return sizeChoice.count
        default : return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent: Int) -> String? {
        switch pickerView.tag {
        case 0: return String(row)
            case 1:  return sizeChoice[row]
        default: return " "
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{
        case 0 : quantityText.text = String(row)
        case 1: sizeText.text = sizeChoice [row]
        default: break
        }
    }
    
}













