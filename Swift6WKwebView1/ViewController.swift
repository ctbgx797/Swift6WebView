//
//  ViewController.swift
//  Swift6WKwebView1
//
//  Created by 西谷恭紀 on 2020/11/26.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var toolBar: UIToolbar!
    
    //webViewクラスをインスタンス
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //表示/非表示
        indicator.isHidden = true
        
        //大きさを決めていく
        //toolBarの高さを引いたものを考慮する
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
        
        //viewにWebViewを配置
        view.addSubview(webView)
        
        //デリゲートメソッドを宣言
        webView.navigationDelegate = self
        //URLをロードする
        //URL型にキャスト
        let url = URL(string: "https://qiita.com/")
        //セット
        let reqest = URLRequest(url: url!)
        //webViewに表示
        webView.load(reqest)
        
        //indicatorを全面に表示
        indicator.layer.zPosition = 2
        
    }
    
    
    
    //ロードが完了したときに呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    //ロードが開始したときに呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
}

