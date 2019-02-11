//
//  ViewController.swift
//  fetchJsonFromUrl
//
//  Created by My Computer on 2018-11-09.
//  Copyright © 2018 Kish. All rights reserved.
//

import UIKit
import Alamofire

struct Hero : Codable{
    let name:String?
    let realname: String?
    let team: String?
    let firstappearance: String?
    let createdby: String?
    let publisher: String?
    let imageurl: String?
    let bio: String?
}

class ViewController: UIViewController {
    
    //defining the API URL
    let API_URL = "https://www.simplifiedcoding.net/demos/marvel/"
    var heroes = [Hero]()

    
    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Performing Alamofire request to get the data from the URL
        Alamofire.request(API_URL).responseJSON { response in
            //now here we have the responser data that we need to parse
            let json = response.data
            do{
                //created the json decoder
                let decoder = JSONDecoder()
                
                //using the array to put values
                self.heroes = try decoder.decode([Hero].self, from: json!)
                
                //printing all the hero names
                for hero in self.heroes{
                    print(hero.name!)
                }
            }catch let err{
                print(err)
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

