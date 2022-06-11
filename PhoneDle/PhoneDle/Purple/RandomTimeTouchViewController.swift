//
//  RandomTimeTouchViewController.swift
//  PhoneDle
//
//  Created by Jin younkyum on 2022/06/07.
//

import UIKit

class RandomTimeTouchViewController: UIViewController {

    
    var random = Int.random(in: 1..<4) * 2 - 1
    var randomAlphaList: [Int] = []
    
    
    @IBOutlet var LongTouchOutlet: UILongPressGestureRecognizer!
    @IBOutlet weak var LongTouchCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LongTouchOutlet.minimumPressDuration = TimeInterval(random)
        cellLayout()
        randomAlphaList = randomList()
    }
    

    private func randomList() -> [Int] {
        switch random {
        case 1:
            return [0, 0, 1, 0, 0]
            
        case 3:
            return [0, 1, 1, 1, 0]
            
        case 5:
            return [1, 1, 1, 1, 1]
            
        default:
            return [0, 0, 0, 0, 0]
        }
    }
    
    @IBAction func longTouch(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            print("complete!")
            complete(main: self)
        } else if sender.state == .ended {
            print("ended!")
        }
    }
    
    
    private func cellLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumLineSpacing = 5
        
        let halfWidth = UIScreen.main.bounds.width / 2
        flowLayout.itemSize = CGSize(width: halfWidth * 0.35, height: halfWidth * 0.35)
        self.LongTouchCollectionView.collectionViewLayout = flowLayout
    }

}


extension RandomTimeTouchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LongTouchCollectionViewCell
        
        cell.longTouchView.backgroundColor = UIColor(displayP3Red: 173/255, green: 79/255, blue: 224/255, alpha: 1)
        
        cell.longTouchView.alpha = CGFloat(randomAlphaList[indexPath.row])
        
        return cell
    }
}
