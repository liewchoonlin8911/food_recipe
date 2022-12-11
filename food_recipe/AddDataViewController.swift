//
//  AddDataViewController.swift
//  food_recipe
//
//  Created by Liew Choon Yun on 10/12/2022.
//

import UIKit
import DropDown
import SQLite3

class AddDataViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var dropdownview: UIButton!
    let dropDown = DropDown()
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var foodimage_imageview: UIImageView!
    
    @IBOutlet weak var foodimage_choosebtn: UIButton!
    @IBOutlet weak var foodtype_textfield: UITextField!
    
    @IBOutlet weak var foodshortterm_textfield: UITextView!
    
    @IBOutlet weak var confirm: UIButton!
    var db: OpaquePointer?
    var foodrecipe_type = String()
    var foodimage_url = String()
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("FoodRecipeDatabase.sqlite")
        
              
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
                    print("error opening database")
                }
       
       
        
        dropDown.dataSource = ["Breakfast recipes", "Lunch recipes", "Dinner recipes","Appetizer recipes","Salad recipes","Maincourse recipes","Sidedish recipes"]
        dropDown.anchorView = dropdownview
        dropDown.backgroundColor = .gray
       // dropDown.backgroundColor = UIColor.white
       // DropDown.appearance().backgroundColor = UIColor.white
        dropDown.width = 200
        

        // The view to which the drop down will appear on
       // UIView or UIBarButtonItem

        // The list of items to display. Can be changed dynamically
        
        
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            dropdownview.setTitle(item, for: .normal)
            foodrecipe_type = item
            
        
        }
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func choose(_ sender: Any)
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                    let myPickerController = UIImagePickerController()
                    myPickerController.delegate = self;
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true, completion: nil)
                }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.dismiss(animated: true, completion: nil)
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            foodimage_imageview.image = chosenImage
            
            let documentsDirectoryURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            // create a name for your image
            let timestamp = NSDate().timeIntervalSince1970
            let fileURL = documentsDirectoryURL.appendingPathComponent("+Savedframe_\(timestamp).png")


            if !FileManager.default.fileExists(atPath: fileURL.path) {
                do {
                   
                    try foodimage_imageview.image!.pngData()!.write(to: fileURL)
                    foodimage_url = fileURL.absoluteString
                        print("Image Added Successfully")
                    } catch {
                        print(error)
                    }
                } else {
                    print("Image Not Added")
            }
            dismiss(animated:true, completion: nil)
        }
    
    
    @IBAction func confirm(_ sender: Any)
    {
        if foodrecipe_type == "Breakfast recipes"
        {
            let insertStatementString = "INSERT INTO Breakfastrecipes (foodtype,foodimage,shortterm) VALUES (?,?,?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, foodtype_textfield.text, -1, nil)
                       sqlite3_bind_text(insertStatement, 2, foodimage_url, -1, nil)
                       sqlite3_bind_text(insertStatement, 3, foodshortterm_textfield.text, -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
            self.performSegue(withIdentifier: "toMainPage", sender: self)
        }
        else if foodrecipe_type == "Lunch recipes"
        {
            let insertStatementString = "INSERT INTO Lunchrecipes (foodtype,foodimage,shortterm) VALUES (?,?,?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, foodtype_textfield.text, -1, nil)
                       sqlite3_bind_text(insertStatement, 2, foodimage_url, -1, nil)
                       sqlite3_bind_text(insertStatement, 3, foodshortterm_textfield.text, -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
            self.performSegue(withIdentifier: "toMainPage", sender: self)
        }
        else if foodrecipe_type == "Dinner recipes"
        {
            let insertStatementString = "INSERT INTO Dinnerrecipes (foodtype,foodimage,shortterm) VALUES (?,?,?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, foodtype_textfield.text, -1, nil)
                       sqlite3_bind_text(insertStatement, 2, foodimage_url, -1, nil)
                       sqlite3_bind_text(insertStatement, 3, foodshortterm_textfield.text, -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
            self.performSegue(withIdentifier: "toMainPage", sender: self)
        }
        else if foodrecipe_type == "Appetizer recipes"
        {
            let insertStatementString = "INSERT INTO Appetizerrecipes (foodtype,foodimage,shortterm) VALUES (?,?,?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, foodtype_textfield.text, -1, nil)
                       sqlite3_bind_text(insertStatement, 2, foodimage_url, -1, nil)
                       sqlite3_bind_text(insertStatement, 3, foodshortterm_textfield.text, -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
            self.performSegue(withIdentifier: "toMainPage", sender: self)
        }
        else if foodrecipe_type == "Salad recipes"
        {
            let insertStatementString = "INSERT INTO Saladrecipes (foodtype,foodimage,shortterm) VALUES (?,?,?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, foodtype_textfield.text, -1, nil)
                       sqlite3_bind_text(insertStatement, 2, foodimage_url, -1, nil)
                       sqlite3_bind_text(insertStatement, 3, foodshortterm_textfield.text, -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
            self.performSegue(withIdentifier: "toMainPage", sender: self)
        }
        else if foodrecipe_type == "Maincourse recipes"
        {
            let insertStatementString = "INSERT INTO Maincourserecipes (foodtype,foodimage,shortterm) VALUES (?,?,?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, foodtype_textfield.text, -1, nil)
                       sqlite3_bind_text(insertStatement, 2, foodimage_url, -1, nil)
                       sqlite3_bind_text(insertStatement, 3, foodshortterm_textfield.text, -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
            self.performSegue(withIdentifier: "toMainPage", sender: self)
        }
        else if foodrecipe_type == "Sidedish recipes"
        {
            let insertStatementString = "INSERT INTO Sidedishrecipes (foodtype,foodimage,shortterm) VALUES (?,?,?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, foodtype_textfield.text, -1, nil)
                       sqlite3_bind_text(insertStatement, 2, foodimage_url, -1, nil)
                       sqlite3_bind_text(insertStatement, 3, foodshortterm_textfield.text, -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
            self.performSegue(withIdentifier: "toMainPage", sender: self)
        }
       // foodtype_textfield.text
       // foodshortterm_textfield.text
       // foodrecipe_type
      //  foodimage_url
    }
    
    @IBAction func foodtype_textfield(_ sender: UITextField) {
    }
    
    @IBAction func clickrecipetype(_ sender: Any) {
        
        dropDown.show()
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    @IBAction func backtoPreviousPage(_ sender: Any) {
     //   let vc = ViewController()
      //  vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
      //  self.present(vc, animated: true, completion: nil)
        self.performSegue(withIdentifier: "toMainPage", sender: self)
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
