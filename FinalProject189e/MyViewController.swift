//
//  MyViewController.swift
//  FinalProject189e
//
//  Created by Zheng Wang on 3/1/21.
//

import UIKit

class MyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,VibeDelegate {
    func updateVibe(image: UIImage?) {
        print("Delegate Called")
        VibeImage.image = image
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkinCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
        if(indexPath.row < checkinCount ?? 0){
            let place: String = checkinInfo![indexPath.row]["Place"] ?? "Nowhere"
            let message: String = checkinInfo![indexPath.row]["Message"] ?? "Nothing"
            cell.textLabel?.text = "@ " + place + "\nsaid: " + message
        }
        cell.textLabel?.numberOfLines = 2
        return cell
    }
    

    @IBOutlet weak var FirstName: UILabel!
    @IBOutlet weak var LastName: UILabel!
    @IBOutlet weak var CheckinTable: UITableView!
    @IBOutlet weak var VibeImage: UIImageView!
        
    let str = "{\"FirstName\": \"Will\",\"LastName\": \"Smith\",\"Info\": [{\"Place\": \"Shield Library\",\"Message\": \"Hello world!\"},{\"Place\": \"Cuarto Residence\", \"Message\": \"Bye world!\" }]}"
    
    var checkinCount: Int? = 0
    var checkinInfo : [[String:String]]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let data = Data(str.utf8)
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print("Json format confirmed")
                
                FirstName.text = json["FirstName"] as? String
                LastName.text = json["LastName"] as? String
                let tempInfo = json["Info"] as? [[String:String]]
                checkinCount = tempInfo?.count
                checkinInfo = tempInfo
                // try to read out a string array
            }
            else{
                print("Please enter correct json file")
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        CheckinTable.dataSource = self
        CheckinTable.delegate = self
        CheckinTable.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is VibeViewController{
            let vc = segue.destination as? VibeViewController
            vc?.delegate = self
        }
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
