//
//  VibeViewController.swift
//  FinalProject189e
//
//  Created by Zheng Wang on 3/2/21.
//

import UIKit

protocol VibeDelegate{
    func updateVibe(image : UIImage?)
}

class VibeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vibeSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "vibe", for: indexPath) as! VibeCollectionViewCell
        cell.image.image = vibeSet[indexPath.item]
        cell.label.text = vibeName[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selection detected")
        delegate?.updateVibe(image: vibeSet[indexPath.item])
        dismiss(animated: true) {
            
        }
    }

    @IBOutlet weak var vibeCollection: UICollectionView!
    
    var delegate : VibeDelegate?
    
    var vibeName : [String] = [
        "Chilling",
        "Working",
    ]
    
    var vibeSet : [UIImage?] = [
        UIImage(named: "Chilling"),
        UIImage(named: "Working"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vibeCollection.dataSource = self
        vibeCollection.delegate = self

        // Do any additional setup after loading the view.
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
