//
//  ViewController.swift
//  food_recipe
//
//  Created by Liew Choon Yun on 09/12/2022.
//

import UIKit
import AEXML
import Foundation
import SQLite3
class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource, XMLParserDelegate {
   
 
    var db: OpaquePointer?
    
    var totaltypes = [[String]]()
    var row0_string :[String] = []
    var row1_string :[String] = []
    var row2_string :[String] = []
    var row3_string :[String] = []
    var row4_string :[String] = []
    var row5_string :[String] = []
    var row6_string :[String] = []
    
    var row0_image :[String] = []
    var row1_image :[String] = []
    var row2_image :[String] = []
    var row3_image :[String] = []
    var row4_image :[String] = []
    var row5_image :[String] = []
    var row6_image :[String] = []
    
    var row0_shortterm :[String] = []
    var row1_shortterm :[String] = []
    var row2_shortterm :[String] = []
    var row3_shortterm :[String] = []
    var row4_shortterm :[String] = []
    var row5_shortterm :[String] = []
    var row6_shortterm :[String] = []
    var totalrecipetypes:[String] = []
    
    var recipetypes:[String] = []
    var foodimages:[String] = []
    var foodtype:[String] = []
    var foodshortdecription:[String] = []
    
   
    var parser  = XMLParser()
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var pickerview: UIPickerView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if row0_string.count > 0 {
            return row0_string.count
        }
        else if row1_string.count > 0{
            return row1_string.count
        }
        else if row2_string.count > 0 {
            return row2_string.count
        }
        else if row3_string.count > 0 {
            return row3_string.count
        }
        else if row4_string.count > 0 {
            return row4_string.count
        }
        else if row5_string.count > 0 {
            return row5_string.count
        }
        else if row6_string.count > 0 {
            return row6_string.count
        }
        
        
        
        
        return 0
    }
    func clearmemory()
    {
        row6_string.removeAll()
        row5_string.removeAll()
        row4_string.removeAll()
        row3_string.removeAll()
        row2_string.removeAll()
        row1_string.removeAll()
        row0_string.removeAll()
        
        
        row0_image.removeAll()
        row1_image.removeAll()
        row2_image.removeAll()
        row3_image.removeAll()
        row4_image.removeAll()
        row5_image.removeAll()
        row6_image.removeAll()
        
        row0_shortterm.removeAll()
        row1_shortterm.removeAll()
        row2_shortterm.removeAll()
        row3_shortterm.removeAll()
        row4_shortterm.removeAll()
        row5_shortterm.removeAll()
        row6_shortterm.removeAll()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTableView
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let userDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
        let paths             = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        if let dirPath        = paths.first
        {
           let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("curry.png")
            print(imageURL.absoluteString)
           
           // Do whatever you want with the image
        }
        
        if row0_string.count > 0
        {
           
            cell.imagecell.image   = UIImage(named: row0_image[indexPath.row])
            
            if cell.imagecell.image == nil
            {
                let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
                let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                if let dirPath  = paths.first
                {
                    if let range = row0_image[indexPath.row].range(of: "+")
                    {
                        let lastword = row0_image[indexPath.row][range.upperBound...]
                        print(lastword) // prints "123.456.7891"
                        let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("+"+String(lastword))
                        let image    = UIImage(contentsOfFile: imageURL.path)
                       cell.imagecell.image = image
                    }
                
                    
                }
              
                
            }
            cell.textviewcell.text = row0_shortterm[indexPath.row]
            cell.lablecell.text = row0_string[indexPath.row]
        }
        else if row1_string.count > 0
        {
            cell.imagecell.image   = UIImage(named: row1_image[indexPath.row])
            if cell.imagecell.image == nil
            {
                let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
                let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                if let dirPath  = paths.first
                {
                    if let range = row1_image[indexPath.row].range(of: "+")
                    {
                        let lastword = row1_image[indexPath.row][range.upperBound...]
                        print(lastword) // prints "123.456.7891"
                        let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("+"+String(lastword))
                        let image    = UIImage(contentsOfFile: imageURL.path)
                       cell.imagecell.image = image
                    }
                
                    
                }
              
                
            }
            cell.textviewcell.text = row1_shortterm[indexPath.row]
            cell.lablecell.text = row1_string[indexPath.row]
        }
        else if row2_string.count > 0 {
            cell.imagecell.image   = UIImage(named: row2_image[indexPath.row])
            if cell.imagecell.image == nil
            {
                let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
                let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                if let dirPath  = paths.first
                {
                    if let range = row2_image[indexPath.row].range(of: "+")
                    {
                        let lastword = row2_image[indexPath.row][range.upperBound...]
                        print(lastword) // prints "123.456.7891"
                        let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("+"+String(lastword))
                        let image    = UIImage(contentsOfFile: imageURL.path)
                       cell.imagecell.image = image
                    }
                
                    
                }
              
                
            }
            cell.textviewcell.text = row2_shortterm[indexPath.row]
            cell.lablecell.text = row2_string[indexPath.row]
        }
        else if row3_string.count > 0 {
            cell.imagecell.image   = UIImage(named: row3_image[indexPath.row])
            if cell.imagecell.image == nil
            {
                let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
                let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                if let dirPath  = paths.first
                {
                    if let range = row3_image[indexPath.row].range(of: "+")
                    {
                        let lastword = row3_image[indexPath.row][range.upperBound...]
                        print(lastword) // prints "123.456.7891"
                        let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("+"+String(lastword))
                        let image    = UIImage(contentsOfFile: imageURL.path)
                       cell.imagecell.image = image
                    }
                
                    
                }
              
                
            }
            cell.textviewcell.text = row3_shortterm[indexPath.row]
            cell.lablecell.text = row3_string[indexPath.row]
        }
        else if row4_string.count > 0 {
            cell.imagecell.image   = UIImage(named: row4_image[indexPath.row])
            if cell.imagecell.image == nil
            {
                let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
                let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                if let dirPath  = paths.first
                {
                    if let range = row4_image[indexPath.row].range(of: "+")
                    {
                        let lastword = row4_image[indexPath.row][range.upperBound...]
                        print(lastword) // prints "123.456.7891"
                        let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("+"+String(lastword))
                        let image    = UIImage(contentsOfFile: imageURL.path)
                       cell.imagecell.image = image
                    }
                
                    
                }
              
                
            }
            cell.textviewcell.text = row4_shortterm[indexPath.row]
            cell.lablecell.text = row4_string[indexPath.row]
        }
        else if row5_string.count > 0 {
            cell.imagecell.image   = UIImage(named: row5_image[indexPath.row])
            if cell.imagecell.image == nil
            {
                let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
                let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                if let dirPath  = paths.first
                {
                    if let range = row5_image[indexPath.row].range(of: "+")
                    {
                        let lastword = row5_image[indexPath.row][range.upperBound...]
                        print(lastword) // prints "123.456.7891"
                        let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("+"+String(lastword))
                        let image    = UIImage(contentsOfFile: imageURL.path)
                       cell.imagecell.image = image
                    }
                
                    
                }
              
                
            }
            cell.textviewcell.text = row5_shortterm[indexPath.row]
            cell.lablecell.text = row5_string[indexPath.row]
        }
        else if row6_string.count > 0 {
            cell.imagecell.image   = UIImage(named: row6_image[indexPath.row])
            
            if cell.imagecell.image == nil
            {
                let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
                let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                if let dirPath  = paths.first
                {
                    if let range = row6_image[indexPath.row].range(of: "+")
                    {
                        let lastword = row6_image[indexPath.row][range.upperBound...]
                        print(lastword) // prints "123.456.7891"
                        let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("+"+String(lastword))
                        let image    = UIImage(contentsOfFile: imageURL.path)
                       cell.imagecell.image = image
                    }
                
                    
                }
              
                
            }
            cell.textviewcell.text = row6_shortterm[indexPath.row]
            cell.lablecell.text = row6_string[indexPath.row]
        }
       
        
        return cell
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           
            return totalrecipetypes.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if row == 0
            {
                self.loadBreakfastrecipesfromsqlite()
                tableview.reloadData()
            }
            
            return totalrecipetypes[row]
        }
    
   
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row == 0
        {
            self.loadBreakfastrecipesfromsqlite()
          
            tableview.reloadData()
        }
        if row == 1
        {
            self.loadLunchrecipesfromsqlite()
            tableview.reloadData()
        }
        
        
        if row == 2
        {
            self.loadDinnerrecipesfromsqlite()
            
            
            
            tableview.reloadData()
        }
        if row == 3
        {
            self.loadAppetizerrecipesfromsqlite()
            
            
            tableview.reloadData()
        }
        if row == 4
        {
            self.loadSaladrecipesfromsqlite()
            
            
            tableview.reloadData()
        }
        
        if row == 5
        {
            self.loadMaincourserecipesfromsqlite()
            
            tableview.reloadData()
        }
        if row == 6
        {
            self.loadSidedishrecipesfromsqlite()
            
            
            tableview.reloadData()
        }
        
        
        
    }

       
    
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
            
            if elementName == "Recipe"
            {
                
                let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("FoodRecipeDatabase.sqlite")
                
                      
                if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
                            print("error opening database")
                        }
               
                        //creating table
                if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS \(attributeDict["Type"]!.removingWhitespaces()) (id INTEGER PRIMARY KEY AUTOINCREMENT, foodrecipe TEXT, foodtype TEXT, foodimage TEXT, shortterm TEXT, longterm TEXT, ingredients TEXT, steps TEXT)", nil, nil, nil) != SQLITE_OK
                        {
                            let errmsg = String(cString: sqlite3_errmsg(db)!)
                            print("error creating table: \(errmsg)")
                        }
               
                totalrecipetypes.append(attributeDict["Type"]!)
                
                if attributeDict["Type"]?.description ?? "" == "Breakfast recipes"
                {
                    
                    recipetypes.append("" + attributeDict["Type"]! + "-" )
                    totaltypes.append(recipetypes)
                    recipetypes.removeAll()
                }
                else if attributeDict["Type"]?.description ?? "" == "Lunch recipes"
                {
                    recipetypes.append("-" + attributeDict["Type"]! + "-")
                    totaltypes.append(recipetypes)
                    recipetypes.removeAll()
                }
                else if attributeDict["Type"]?.description ?? "" == "Dinner recipes"
                {
                    recipetypes.append("-" + attributeDict["Type"]! + "-")
                    totaltypes.append(recipetypes)
                    recipetypes.removeAll()
                }
                else if attributeDict["Type"]?.description ?? "" == "Appetizer recipes"
                {
                    recipetypes.append("-" + attributeDict["Type"]! + "-")
                    totaltypes.append(recipetypes)
                    recipetypes.removeAll()
                }
                else if attributeDict["Type"]?.description ?? "" == "Salad recipes"
                {
                    recipetypes.append("-" + attributeDict["Type"]! + "-")
                    totaltypes.append(recipetypes)
                    recipetypes.removeAll()
                }
                else if attributeDict["Type"]?.description ?? "" == "Maincourse recipes" 
                {
                    recipetypes.append("-" + attributeDict["Type"]! + "-")
                    totaltypes.append(recipetypes)
                    recipetypes.removeAll()
                }
                else if attributeDict["Type"]?.description ?? "" == "Sidedish recipes"
                {
                    recipetypes.append("-" + attributeDict["Type"]! + "")
                    totaltypes.append(recipetypes)
                    recipetypes.removeAll()
                }
                
               
                
            }
            else if elementName == "Food"
            {
               
                
                
                foodtype.append("+" + attributeDict["Type"]!.description + "+")
                 totaltypes.append(foodtype)
                 foodtype.removeAll()
             
                 
            }
        
       
        else if elementName == "Image"
        {
            foodimages.append("?" + attributeDict["URL"]!.description + "?")
            totaltypes.append(foodimages)
            foodimages.removeAll()
        }
      else  if elementName == "ShortTerm"
        {
            foodshortdecription.append("=" + attributeDict["description"]!.description + "=")
            totaltypes.append(foodshortdecription)
            foodshortdecription.removeAll()
            
        }
          
    }

    lazy var faButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        if let image = UIImage(named: "add.png") {
            button.setImage(image, for: .normal)
        }
        button.addTarget(self, action: #selector(fabTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(faButton)
            setupButton()
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let view = UIApplication.shared.keyWindow, faButton.isDescendant(of: view) {
            faButton.removeFromSuperview()
        }
    }
    func setupButton() {
        NSLayoutConstraint.activate([
            faButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            faButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36),
            faButton.heightAnchor.constraint(equalToConstant: 80),
            faButton.widthAnchor.constraint(equalToConstant: 80)
            ])
        faButton.layer.cornerRadius = 40
        faButton.layer.masksToBounds = true
        faButton.layer.borderColor = UIColor.lightGray.cgColor
        faButton.layer.borderWidth = 4
    }
   func loadBreakfastrecipesfromsqlite()
    {
        self.clearmemory()
        let queryString = "SELECT * FROM Breakfastrecipes"

                var stmt:OpaquePointer?
                if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK
                {
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error preparing insert: \(errmsg)")
                    return
                }
         
                
                while(sqlite3_step(stmt) == SQLITE_ROW)
                {
                    let id = sqlite3_column_int(stmt, 0)
                    let foodtype = String(cString: sqlite3_column_text(stmt, 2))
                    let foodimage = String(cString: sqlite3_column_text(stmt, 3))
                    let shortterm = String(cString: sqlite3_column_text(stmt, 4))
                    row0_string.append(foodtype)
                    row0_image.append(foodimage)
                    row0_shortterm.append(shortterm)
                    
                   
                }
    }
    
    func loadLunchrecipesfromsqlite()
     {
         self.clearmemory()
         let queryString = "SELECT * FROM Lunchrecipes"

                 var stmt:OpaquePointer?
                 if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK
                 {
                     let errmsg = String(cString: sqlite3_errmsg(db)!)
                     print("error preparing insert: \(errmsg)")
                     return
                 }
          
                 
                 while(sqlite3_step(stmt) == SQLITE_ROW)
                 {
                     let id = sqlite3_column_int(stmt, 0)
                     let foodtype = String(cString: sqlite3_column_text(stmt, 2))
                     let foodimage = String(cString: sqlite3_column_text(stmt, 3))
                     let shortterm = String(cString: sqlite3_column_text(stmt, 4))
                     row1_string.append(foodtype)
                     row1_image.append(foodimage)
                     row1_shortterm.append(shortterm)
                     
                    
                 }
     }
    
    func loadDinnerrecipesfromsqlite()
     {
         self.clearmemory()
         let queryString = "SELECT * FROM Dinnerrecipes"

                 var stmt:OpaquePointer?
                 if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK
                 {
                     let errmsg = String(cString: sqlite3_errmsg(db)!)
                     print("error preparing insert: \(errmsg)")
                     return
                 }
          
                 
                 while(sqlite3_step(stmt) == SQLITE_ROW)
                 {
                     let id = sqlite3_column_int(stmt, 0)
                     let foodtype = String(cString: sqlite3_column_text(stmt, 2))
                     let foodimage = String(cString: sqlite3_column_text(stmt, 3))
                     let shortterm = String(cString: sqlite3_column_text(stmt, 4))
                     row2_string.append(foodtype)
                     row2_image.append(foodimage)
                     row2_shortterm.append(shortterm)
                     
                    
                 }
     }
    
    func loadAppetizerrecipesfromsqlite()
     {
         self.clearmemory()
         let queryString = "SELECT * FROM Appetizerrecipes"

                 var stmt:OpaquePointer?
                 if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK
                 {
                     let errmsg = String(cString: sqlite3_errmsg(db)!)
                     print("error preparing insert: \(errmsg)")
                     return
                 }
          
                 
                 while(sqlite3_step(stmt) == SQLITE_ROW)
                 {
                     let id = sqlite3_column_int(stmt, 0)
                     let foodtype = String(cString: sqlite3_column_text(stmt, 2))
                     let foodimage = String(cString: sqlite3_column_text(stmt, 3))
                     let shortterm = String(cString: sqlite3_column_text(stmt, 4))
                     row3_string.append(foodtype)
                     row3_image.append(foodimage)
                     row3_shortterm.append(shortterm)
                     
                    
                 }
     }
    func loadSaladrecipesfromsqlite()
     {
         self.clearmemory()
         let queryString = "SELECT * FROM Saladrecipes"

                 var stmt:OpaquePointer?
                 if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK
                 {
                     let errmsg = String(cString: sqlite3_errmsg(db)!)
                     print("error preparing insert: \(errmsg)")
                     return
                 }
          
                 
                 while(sqlite3_step(stmt) == SQLITE_ROW)
                 {
                     let id = sqlite3_column_int(stmt, 0)
                     let foodtype = String(cString: sqlite3_column_text(stmt, 2))
                     let foodimage = String(cString: sqlite3_column_text(stmt, 3))
                     let shortterm = String(cString: sqlite3_column_text(stmt, 4))
                     row4_string.append(foodtype)
                     row4_image.append(foodimage)
                     row4_shortterm.append(shortterm)
                     
                    
                 }
     }
    func loadMaincourserecipesfromsqlite()
     {
         self.clearmemory()
         let queryString = "SELECT * FROM Maincourserecipes"

                 var stmt:OpaquePointer?
                 if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK
                 {
                     let errmsg = String(cString: sqlite3_errmsg(db)!)
                     print("error preparing insert: \(errmsg)")
                     return
                 }
          
                 
                 while(sqlite3_step(stmt) == SQLITE_ROW)
                 {
                     let id = sqlite3_column_int(stmt, 0)
                     let foodtype = String(cString: sqlite3_column_text(stmt, 2))
                     let foodimage = String(cString: sqlite3_column_text(stmt, 3))
                     let shortterm = String(cString: sqlite3_column_text(stmt, 4))
                     row5_string.append(foodtype)
                     row5_image.append(foodimage)
                     row5_shortterm.append(shortterm)
                     
                    
                 }
     }
    func loadSidedishrecipesfromsqlite()
     {
         self.clearmemory()
         let queryString = "SELECT * FROM Sidedishrecipes"

                 var stmt:OpaquePointer?
                 if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK
                 {
                     let errmsg = String(cString: sqlite3_errmsg(db)!)
                     print("error preparing insert: \(errmsg)")
                     return
                 }
          
                 
                 while(sqlite3_step(stmt) == SQLITE_ROW)
                 {
                     let id = sqlite3_column_int(stmt, 0)
                     let foodtype = String(cString: sqlite3_column_text(stmt, 2))
                     let foodimage = String(cString: sqlite3_column_text(stmt, 3))
                     let shortterm = String(cString: sqlite3_column_text(stmt, 4))
                     row6_string.append(foodtype)
                     row6_image.append(foodimage)
                     row6_shortterm.append(shortterm)
                     
                    
                 }
     }
    @objc func fabTapped(_ button: UIButton)
    {
        
      
        
        self.performSegue(withIdentifier: "toAddDataPage", sender: self)
       // let xmlPath = Bundle.main.path(forResource: "recipetypes", ofType: "xml")
       
       // let xmlData = NSData(contentsOfFile: xmlPath ??  "")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
        pickerview.delegate = self
        pickerview.dataSource = self
        tableview.delegate = self
        tableview.dataSource = self
        let xmlPath = Bundle.main.path(forResource: "recipetypes", ofType: "xml")
        if xmlPath != nil
        {
            let xmlData = NSData(contentsOfFile: xmlPath ??  "")
            parser = XMLParser(data: xmlData! as Data)
            parser.delegate = self
            parser.parse()
            
            pickerview.selectRow(0, inComponent: 0, animated: true)
         
            
            
        }
        else
        {
            print("Failed to find MyFile.xml")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
        {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
                let url = NSURL(fileURLWithPath: path)
                if let pathComponent = url.appendingPathComponent("FoodRecipeDatabase.sqlite") {
                    let filePath = pathComponent.path
                    let fileManager = FileManager.default
                    let indicator = UserDefaults.standard.bool(forKey: "SAVEONCE")
                    if fileManager.fileExists(atPath: filePath) && indicator == false
                    {
                        
                        self.loadBreakfastrecipeandsaveSQLLite()
                        self.loadLunchrecipeandsaveSQLLite()
                        self.loadDinnerrecipeandsaveSQLLite()
                        self.loadAppetizerrecipeandsaveSQLLite()
                        self.loadSaladrecipeandsaveSQLLite()
                        self.loadMaincourserecipeandsaveSQLLite()
                        self.loadSidedishrecipeandsaveSQLLite()
                        UserDefaults.standard.set(true, forKey: "SAVEONCE")
                        print("FILE AVAILABLE AND SAVE ONCE")
                    } else {
                        
                        print("FILE NOT AVAILABLE OR SAVE BEFORE")
                    }
                } else {
                    print("FILE PATH NOT AVAILABLE")
                }
        
          
        }
       
        
       
      
        // Do any additional setup after loading the view.
    }
    
    func loadSidedishrecipeandsaveSQLLite()
    {
        self.row6_string.removeAll()
        self.row6_image.removeAll()
        self.row6_shortterm.removeAll()
        let reduced = self.totaltypes.reduce([], +)
        let joined = reduced.joined(separator: ",")
        let fullString = joined
        let splitString = fullString.components(separatedBy: "-")
        let newstring = splitString[12].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub = newstring.components(separatedBy: "+")
        
        for index in stride(from: 1, to: sub.count - 1, by: 2)
        {
            self.row6_string.append(sub[0+index])
            
        }
      
        for i in 0..<self.row6_string.count
        {
            let insertStatementString = "INSERT INTO Sidedishrecipes (foodtype) VALUES (?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, self.row6_string[i], -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
        }
        
        let splitString2 = fullString.components(separatedBy: "-")
        let newstring2 = splitString2[12].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub2 = newstring2.components(separatedBy: "?")
        
      
        for index in stride(from: 1, to: sub2.count - 1 , by: 2)
        {
            row6_image.append(sub2[0+index])
          
        }
        for i in 0..<self.row6_image.count
        {
            let updateStatementString = "UPDATE Sidedishrecipes SET foodimage = '\(self.row6_image[i])' WHERE foodtype = '\(self.row6_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
            
           
        }
        
        let splitString3 = fullString.components(separatedBy: "-")
        let newstring3 = splitString3[12].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)

        let sub3 = newstring3.components(separatedBy: "=")
        
        
        for index in stride(from: 1, to: sub3.count - 1 , by: 2)
        {
            row6_shortterm.append(sub3[0+index])
         
        }
        
        for i in 0..<self.row6_shortterm.count
        {
            let updateStatementString = "UPDATE Sidedishrecipes SET shortterm = '\(self.row6_shortterm[i])' WHERE foodtype = '\(self.row6_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
           
        }
        
        
    }
    func loadMaincourserecipeandsaveSQLLite()
    {
        self.row5_string.removeAll()
        self.row5_image.removeAll()
        self.row5_shortterm.removeAll()
        let reduced = self.totaltypes.reduce([], +)
        let joined = reduced.joined(separator: ",")
        let fullString = joined
        let splitString = fullString.components(separatedBy: "-")
        let newstring = splitString[11].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub = newstring.components(separatedBy: "+")
        
        for index in stride(from: 1, to: sub.count - 1, by: 2)
        {
            self.row5_string.append(sub[0+index])
            
        }
      
        for i in 0..<self.row5_string.count
        {
            let insertStatementString = "INSERT INTO Maincourserecipes (foodtype) VALUES (?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, self.row5_string[i], -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
        }
        
        let splitString2 = fullString.components(separatedBy: "-")
        let newstring2 = splitString2[11].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub2 = newstring2.components(separatedBy: "?")
        
      
        for index in stride(from: 1, to: sub2.count - 1 , by: 2)
        {
            row5_image.append(sub2[0+index])
          
        }
        for i in 0..<self.row5_image.count
        {
            let updateStatementString = "UPDATE Maincourserecipes SET foodimage = '\(self.row5_image[i])' WHERE foodtype = '\(self.row5_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
            
           
        }
        
        let splitString3 = fullString.components(separatedBy: "-")
        let newstring3 = splitString3[11].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)

        let sub3 = newstring3.components(separatedBy: "=")
        
        
        for index in stride(from: 1, to: sub3.count - 1 , by: 2)
        {
            row5_shortterm.append(sub3[0+index])
         
        }
        
        for i in 0..<self.row5_shortterm.count
        {
            let updateStatementString = "UPDATE Maincourserecipes SET shortterm = '\(self.row5_shortterm[i])' WHERE foodtype = '\(self.row5_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
           
        }
        
        
    }
    func loadSaladrecipeandsaveSQLLite()
    {
        self.row4_string.removeAll()
        self.row4_image.removeAll()
        self.row4_shortterm.removeAll()
        let reduced = self.totaltypes.reduce([], +)
        let joined = reduced.joined(separator: ",")
        let fullString = joined
        let splitString = fullString.components(separatedBy: "-")
        let newstring = splitString[9].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub = newstring.components(separatedBy: "+")
        
        for index in stride(from: 1, to: sub.count - 1, by: 2)
        {
            self.row4_string.append(sub[0+index])
            
        }
      
        for i in 0..<self.row4_string.count
        {
            let insertStatementString = "INSERT INTO Saladrecipes (foodtype) VALUES (?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, self.row4_string[i], -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
        }
        
        let splitString2 = fullString.components(separatedBy: "-")
        let newstring2 = splitString2[9].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub2 = newstring2.components(separatedBy: "?")
        
      
        for index in stride(from: 1, to: sub2.count - 1 , by: 2)
        {
            row4_image.append(sub2[0+index])
          
        }
        for i in 0..<self.row4_image.count
        {
            let updateStatementString = "UPDATE Saladrecipes SET foodimage = '\(self.row4_image[i])' WHERE foodtype = '\(self.row4_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
            
           
        }
        
        let splitString3 = fullString.components(separatedBy: "-")
        let newstring3 = splitString3[9].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)

        let sub3 = newstring3.components(separatedBy: "=")
        
        
        for index in stride(from: 1, to: sub3.count - 1 , by: 2)
        {
            row4_shortterm.append(sub3[0+index])
         
        }
        
        for i in 0..<self.row4_shortterm.count
        {
            let updateStatementString = "UPDATE Saladrecipes SET shortterm = '\(self.row4_shortterm[i])' WHERE foodtype = '\(self.row4_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
           
        }
        
        
    }
    
    
    func loadAppetizerrecipeandsaveSQLLite()
    {
        self.row3_string.removeAll()
        self.row3_image.removeAll()
        self.row3_shortterm.removeAll()
        let reduced = self.totaltypes.reduce([], +)
        let joined = reduced.joined(separator: ",")
        let fullString = joined
        let splitString = fullString.components(separatedBy: "-")
        let newstring = splitString[7].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub = newstring.components(separatedBy: "+")
        
        for index in stride(from: 1, to: sub.count - 1, by: 2)
        {
            self.row3_string.append(sub[0+index])
            
        }
      
        for i in 0..<self.row3_string.count
        {
            let insertStatementString = "INSERT INTO Appetizerrecipes (foodtype) VALUES (?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, self.row3_string[i], -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
        }
        
        let splitString2 = fullString.components(separatedBy: "-")
        let newstring2 = splitString2[7].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub2 = newstring2.components(separatedBy: "?")
        
      
        for index in stride(from: 1, to: sub2.count - 1 , by: 2)
        {
            row3_image.append(sub2[0+index])
          
        }
        for i in 0..<self.row3_image.count
        {
            let updateStatementString = "UPDATE Appetizerrecipes SET foodimage = '\(self.row3_image[i])' WHERE foodtype = '\(self.row3_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
            
           
        }
        
        let splitString3 = fullString.components(separatedBy: "-")
        let newstring3 = splitString3[7].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)

        let sub3 = newstring3.components(separatedBy: "=")
        
        
        for index in stride(from: 1, to: sub3.count - 1 , by: 2)
        {
            row3_shortterm.append(sub3[0+index])
         
        }
        
        for i in 0..<self.row3_shortterm.count
        {
            let updateStatementString = "UPDATE Appetizerrecipes SET shortterm = '\(self.row3_shortterm[i])' WHERE foodtype = '\(self.row3_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
           
        }
        
        
    }
    func loadDinnerrecipeandsaveSQLLite()
    {
        self.row2_string.removeAll()
        self.row2_image.removeAll()
        self.row2_shortterm.removeAll()
        let reduced = self.totaltypes.reduce([], +)
        let joined = reduced.joined(separator: ",")
        let fullString = joined
        let splitString = fullString.components(separatedBy: "-")
        let newstring = splitString[5].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub = newstring.components(separatedBy: "+")
        
        for index in stride(from: 1, to: sub.count - 1, by: 2)
        {
            self.row2_string.append(sub[0+index])
            
        }
      
        for i in 0..<self.row2_string.count
        {
            let insertStatementString = "INSERT INTO Dinnerrecipes (foodtype) VALUES (?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, self.row2_string[i], -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
        }
        
        let splitString2 = fullString.components(separatedBy: "-")
        let newstring2 = splitString2[5].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub2 = newstring2.components(separatedBy: "?")
        
      
        for index in stride(from: 1, to: sub2.count - 1 , by: 2)
        {
            row2_image.append(sub2[0+index])
          
        }
        for i in 0..<self.row2_image.count
        {
            let updateStatementString = "UPDATE Dinnerrecipes SET foodimage = '\(self.row2_image[i])' WHERE foodtype = '\(self.row2_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
            
           
        }
        
        let splitString3 = fullString.components(separatedBy: "-")
        let newstring3 = splitString3[5].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)

        let sub3 = newstring3.components(separatedBy: "=")
        
        
        for index in stride(from: 1, to: sub3.count - 1 , by: 2)
        {
            row2_shortterm.append(sub3[0+index])
         
        }
        
        for i in 0..<self.row2_shortterm.count
        {
            let updateStatementString = "UPDATE Dinnerrecipes SET shortterm = '\(self.row2_shortterm[i])' WHERE foodtype = '\(self.row2_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
           
        }
        
        
    }
    
    func loadLunchrecipeandsaveSQLLite()
    {
        self.row1_string.removeAll()
        self.row1_image.removeAll()
        self.row1_shortterm.removeAll()
        let reduced = self.totaltypes.reduce([], +)
        let joined = reduced.joined(separator: ",")
        let fullString = joined
        let splitString = fullString.components(separatedBy: "-")
        let newstring = splitString[3].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub = newstring.components(separatedBy: "+")
        
        for index in stride(from: 1, to: sub.count - 1, by: 2)
        {
            self.row1_string.append(sub[0+index])
            
        }
      
        for i in 0..<self.row1_string.count
        {
            let insertStatementString = "INSERT INTO Lunchrecipes (foodtype) VALUES (?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, self.row1_string[i], -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
        }
        
        let splitString2 = fullString.components(separatedBy: "-")
        let newstring2 = splitString2[3].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub2 = newstring2.components(separatedBy: "?")
        
      
        for index in stride(from: 1, to: sub2.count - 1 , by: 2)
        {
            row1_image.append(sub2[0+index])
          
        }
        for i in 0..<self.row1_image.count
        {
            let updateStatementString = "UPDATE Lunchrecipes SET foodimage = '\(self.row1_image[i])' WHERE foodtype = '\(self.row1_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
            
           
        }
        
        let splitString3 = fullString.components(separatedBy: "-")
        let newstring3 = splitString3[3].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)

        let sub3 = newstring3.components(separatedBy: "=")
        
        
        for index in stride(from: 1, to: sub3.count - 1 , by: 2)
        {
            row1_shortterm.append(sub3[0+index])
         
        }
        
        for i in 0..<self.row1_shortterm.count
        {
            let updateStatementString = "UPDATE Lunchrecipes SET shortterm = '\(self.row1_shortterm[i])' WHERE foodtype = '\(self.row1_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
           
        }
        
        
    }
    
    func loadBreakfastrecipeandsaveSQLLite()
    {
        self.row0_string.removeAll()
        self.row0_image.removeAll()
        self.row0_shortterm.removeAll()
        let reduced = self.totaltypes.reduce([], +)
        let joined = reduced.joined(separator: ",")
        let fullString = joined
        let splitString = fullString.components(separatedBy: "-")
        let newstring = splitString[1].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub = newstring.components(separatedBy: "+")
        
        for index in stride(from: 1, to: sub.count - 1, by: 2)
        {
            self.row0_string.append(sub[0+index])
           // print(index)
        }
      
        for i in 0..<self.row0_string.count
        {
            let insertStatementString = "INSERT INTO Breakfastrecipes (foodtype) VALUES (?);"
                   var insertStatement: OpaquePointer?
                                   
                   if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                                    
                       sqlite3_bind_text(insertStatement, 1, self.row0_string[i], -1, nil)
                                      
                   if sqlite3_step(insertStatement) == SQLITE_DONE {
                   print("\nSuccessfully inserted row.")
                   } else {
                   print("\nCould not insert row.")
                   }
                   } else {
                   print("\nINSERT statement is not prepared.")
                   }
                   sqlite3_finalize(insertStatement)
        }
        
        let splitString2 = fullString.components(separatedBy: "-")
        let newstring2 = splitString2[1].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        let sub2 = newstring2.components(separatedBy: "?")
        
      
        for index in stride(from: 1, to: sub2.count - 1 , by: 2)
        {
            row0_image.append(sub2[0+index])
          
        }
        for i in 0..<self.row0_image.count
        {
            let updateStatementString = "UPDATE Breakfastrecipes SET foodimage = '\(self.row0_image[i])' WHERE foodtype = '\(self.row0_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
            
           
        }
        
        let splitString3 = fullString.components(separatedBy: "-")
        let newstring3 = splitString3[1].replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)

        let sub3 = newstring3.components(separatedBy: "=")
        
        
        for index in stride(from: 1, to: sub3.count - 1 , by: 2)
        {
            row0_shortterm.append(sub3[0+index])
         
        }
        
        for i in 0..<self.row0_shortterm.count
        {
            let updateStatementString = "UPDATE Breakfastrecipes SET shortterm = '\(self.row0_shortterm[i])' WHERE foodtype = '\(self.row0_string[i])';"
             var updateStatement: OpaquePointer? = nil
             if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
                    if sqlite3_step(updateStatement) == SQLITE_DONE {
                           print("Successfully updated row.")
                    } else {
                           print("Could not update row.")
                    }
                  } else {
                        print("UPDATE statement could not be prepared")
                  }
                  sqlite3_finalize(updateStatement)
           
        }
        
        
    }


}

extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}




extension Array {
  func removeDups<T : Equatable>() -> [Element] where Element == [T] {

    var result = [Element]()

    for element in self{
      if !result.contains(where: { element == $0 }) {
        result.append(element)
      }
    }

    return result
  }
}
extension String {
    
    var nsRange: NSRange {
        return Foundation.NSRange(startIndex ..< endIndex, in: self)
    }
    
    subscript(nsRange: NSRange) -> Substring? {
        return Range(nsRange, in: self)
            .flatMap { self[$0] }
    }
    
    func substringAfterLastOccurenceOf(_ char: Character) -> String {
        
        let regex = try! NSRegularExpression(pattern: "\(char)\\s*(\\S[^\(char)]*)$")
        if let match = regex.firstMatch(in: self, range: self.nsRange), let result = self[match.range(at: 1)] {
            return String(result)
        }
        return ""
    }
}
