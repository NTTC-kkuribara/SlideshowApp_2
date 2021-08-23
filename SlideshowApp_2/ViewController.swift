//
//  ViewController.swift
//  SlideshowApp_2
//
//  Created by ITMS NTTcom on 2021/08/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var slideshowButton: UIButton!
    
    // タイマー
    var timer: Timer!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    // 画像の名前の配列
    let imageNameArray = [
        "1.jpeg",
        "2.jpeg",
        "3.jpeg",
        "4.jpeg",
        "5.jpeg",
        "6.jpeg",
        "7.jpeg",
        "8.jpeg",
        "9.jpeg",
        "10.jpeg"
    ]
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slideshowButton.setTitle("再生", for: .normal)
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        resultViewController.name = imageNameArray[dispImageNo]
    }
   
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {

        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]

        // 画像を読み込み
        let image = UIImage(named: name)

        // Image Viewに読み込んだ画像をセット
        ImageView.image = image
    }
    
    @IBAction func nextImage(_ sender: Any) {
        // 表示している画像の番号を1増やす
        if dispImageNo < 9 {
            dispImageNo += 1
        } else {
            dispImageNo = 0
        }

        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    @IBAction func backImage(_ sender: Any) {
        // 表示している画像の番号を1減らす
        if dispImageNo > 0 {
            dispImageNo -= 1
        } else {
            dispImageNo = 9
        }
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @objc func timerAction(_ timer: Timer) {
        // 表示している画像の番号を1増やす
        if dispImageNo < 9 {
            dispImageNo += 1
        } else {
            dispImageNo = 0
        }

        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func slideshowImage(_ sender: Any) {

        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            slideshowButton.setTitle("停止", for: .normal)
            // 再生ボタンを押すとタイマー作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerAction(_:)), userInfo: nil, repeats: true)
        } else {
            self.timer.invalidate()
            self.timer = nil
            slideshowButton.setTitle("再生", for: .normal)
        }
    }

    //@IBAction func onTapAction(_ sender: Any) {
       // performSegue(withIdentifier: "ResultView", sender: nil)
    //}
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}
