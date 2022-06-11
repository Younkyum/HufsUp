//
//  utilities.swift
//  PhoneDle
//
//  Created by Jin younkyum on 2022/06/09.
//

import UIKit

func complete(main: UIViewController) {
    guard let nextVC = main.storyboard?.instantiateViewController(withIdentifier: "CompleteViewController") as? CompleteViewController else {return}
    nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
    main.navigationController?.pushViewController(nextVC, animated: true)
}
