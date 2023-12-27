//
//  ViewController5.swift
//  onlineShop
//
//  Created by Begai Bakytovna on 25/12/23.
//

import UIKit

class ViewController5: UIViewController {
    
    var delegate : VC3Delegate!
    /// segment
    var segmentName = UISegmentedControl()
    var nameArray1 = ["1", "2", "3", "4", "5"]
    var images = UIImageView ()
    var imageArray1 = [UIImage(named: "blackSuit"), UIImage(named: "whiteSuit"), UIImage(named: "graySuit"), UIImage(named: "darkBlueSuit"), UIImage(named: "blueSuit")]
    var priceArray = ["5500", "6500", "6350", "7000", "6200"]

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
    /// add to basket
    let basketButton = UIButton()
    let goToPayment = UIButton()
    let clothesName = UITextField()
    var shareButton = UIButton()
    var textfield = UITextField()
    var activityController : UIActivityViewController? = nil
    var myWebSite = NSURL(string: "http://facebook.com/")
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        /// images set
        self.createTextfield()
        self.createButton()
        
        
        
        self.images.frame = CGRect(x: 50, y: 180, width: 300, height: 250)
        self.images.image = imageArray1[3]
        self.view.addSubview(self.images)
/// segment control
        self.segmentName = UISegmentedControl(items: nameArray1)
        self.segmentName.frame = CGRect(x: 90, y: 450, width: 200, height: 40)
        self.view.addSubview(segmentName)
        self.segmentName.addTarget(self, action: #selector(selectImage), for: .valueChanged)
        self.segmentName.addTarget(self, action: #selector(selectPrice), for: .valueChanged)
    /// text view labels
        
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
        // baset button
        self.basketButton.frame = CGRect(x: 90, y: 720, width: 120, height: 80)
        view.addSubview(basketButton)
        self.basketButton.backgroundColor = .blue
        self.basketButton.tintColor = .white
        self.basketButton.layer.cornerRadius = 12
        self.basketButton.setTitle("Add to basket", for: .normal)
        self.basketButton.addTarget(self, action: #selector(pickItems), for: .touchUpInside)
        
        self.goToPayment.frame = CGRect(x: 220, y: 720, width: 120, height: 80)
        view.addSubview(goToPayment)
        self.goToPayment.backgroundColor = .blue
        self.goToPayment.tintColor = .white
        self.goToPayment.layer.cornerRadius = 12
        self.goToPayment.setTitle("Buy", for: .normal)
        self.goToPayment.addTarget(self, action: #selector(buyButton), for: .touchUpInside)
        
    }
    
    // add basket
    @objc func pickItems (_ sender: Any){
        delegate?.addBasket(image: priceText.text ?? " ", price: quantityText.text ?? " ", size: sizeText.text ?? " ")
        let controller = ViewController3()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    // go to payment button
    @objc func buyButton () {
        let controller = ViewController4()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @objc func selectImage (target : UISegmentedControl) {
        if target == self.segmentName {
            let segmentIndex = target.selectedSegmentIndex
            self.images.image = self.imageArray1[segmentIndex]
        }
    }
    
    @objc func selectPrice(target : UISegmentedControl) {
        if target == self.segmentName{
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
extension ViewController5 :  UIPickerViewDelegate, UIPickerViewDataSource {
    
    
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
    // sharingButton
    
   func createTextfield () {
        self.textfield.frame = CGRect(x: 300, y: 120, width: 60, height: 40)
        self.textfield.borderStyle = .roundedRect
        self.view.addSubview(self.textfield)
    }
    
    
    func createButton (){
        self.shareButton = UIButton(type: .roundedRect)
        self.shareButton.frame = CGRect(x: 300, y: 60, width: 60, height: 50)
        //self.shareButton.setTitle("Share", for: .normal)
        self.shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        self.shareButton.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        self.view.addSubview(self.shareButton)
    }
    @objc func handleShare(sender: Any) {
        let text = self.textfield.text
        if text?.count == 0 {
            let message = "First enter the text, then push the button"
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
        self.activityController = UIActivityViewController(activityItems: [self.textfield.text ??  "nil", myWebSite!] , applicationActivities: nil)
        activityController!.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.copyToPasteboard]
        self.present(activityController!, animated: true, completion: nil)
        
    }
   
}















