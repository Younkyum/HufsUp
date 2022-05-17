//
//  RGBSliderViewController.swift
//  PhoneDle
//
//  Created by Jin younkyum on 2022/05/17.
//

import UIKit

class RGBSliderViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func sliderChange(_ sender: Any) {
        let r = CGFloat(redSlider.value)
        let g = CGFloat(greenSlider.value)
        let b = CGFloat(blueSlider.value)
        
        
        let color = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
        view.backgroundColor = color
        redSlider.thumbTintColor = color
        greenSlider.thumbTintColor = color
        blueSlider.thumbTintColor = color
        
        if  (r > 0.95) && (g > 0.55 && g < 0.6) && b < 0.1 {
            print("clear")
            turnPage()
        }
        
    }
    
    func turnPage(){
        // 스토리 보드 객체 가져오기 (인자 : 이름, 읽어들일 위치)
        let storyboard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
                
        // 뷰 객체 얻어오기 (storyboard ID로 ViewController구분)
        guard let uvc = storyboard?.instantiateViewController(identifier: "RouletteViewController") else {
            return
        }
        
        // 화면 전환 애니메이션 설정
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(uvc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.setValue(0, animated: true)
        greenSlider.setValue(0, animated: true)
        blueSlider.setValue(0, animated: true)
        // Do any additional setup after loading the view.
        
    }

}
