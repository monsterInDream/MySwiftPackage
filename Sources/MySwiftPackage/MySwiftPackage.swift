// The Swift Programming Language
// https://docs.swift.org/swift-book

import Alamofire
import UIKit

public func showTestText(){
    print("This a test function in MySwiftPackage.")
    
    AF.request("https://jsonplaceholder.typicode.com/posts/1").response { response in
        print("请求数据，返回数据")
        switch response.result {
        case .success(let data):
            print("请求成功: \(String(describing: data))")
        case .failure(let error):
            print("请求失败: \(error.localizedDescription)")
        }
    }
}


public func showTestViewController(fromVC: UIViewController){
    DispatchQueue.main.async {
        let vc = MyTestViewController()
        vc.modalPresentationStyle = .fullScreen
        fromVC.present(vc, animated: true)
    }
}



