//
//  HQBlankView.swift
//  HQBlankView
//
//  Created by gandijun on 2018/6/1.
//  Copyright © 2018年 HeQing. All rights reserved.
//

import UIKit

class HQBlankView: UIView {
    
    typealias ClickCallBack = () -> Void
    fileprivate var clickCallBack: ClickCallBack?
    
    fileprivate lazy var imgBtn: UIButton = {
        let imageBtn = UIButton(type: .custom)
        imageBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        imageBtn.setTitleColor(HQ_ColorWithHex(0x666666), for: .normal)
        imageBtn.addTarget(self, action: Selector.buttonClick, for: .touchUpInside)
        return imageBtn
    }()
    
    convenience init(_ view: UIView, imgStr: String, title: String,callBack: @escaping ClickCallBack) {
        self.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: view.frame.size))
        self.backgroundColor = HQ_ColorWithHex(0xf3f3f3)
        clickCallBack = callBack
        
        imgBtn.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        imgBtn.center = view.center
        imgBtn.setTitle(title, for: .normal)
        imgBtn.setImage(UIImage(named: imgStr), for: .normal)
        imgBtn.HQ_verticalAlignImageAndTitle(space: 30)
        
        self.addSubview(imgBtn)
    }
    
}

// MARK: - publicMethods
extension HQBlankView {
    
    class func show(_ view: UIView, imgStr: String, title: String, callBack: @escaping ClickCallBack) {
        
        hide(fromView: view)
        let backV = HQBlankView.init(view, imgStr: imgStr, title: title, callBack: callBack)
        backV.tag = 777
        view.addSubview(backV)
    }
    
    class func hide(fromView view: UIView) {
        let blackView = view.viewWithTag(777)
        if let blackV = blackView {
            blackV.removeFromSuperview()
        }
    }
}

// MARK: - ButtonClick
extension HQBlankView {
    
    @objc fileprivate func buttonClick(_ button: UIButton) {
        
        guard let callBack = clickCallBack else { return }
        callBack()
    }
}


// MARK: - Selector
private extension Selector {
    static let buttonClick = #selector(HQBlankView.buttonClick(_:))
}

// MARK: - 辅助
extension UIButton {
  
    func HQ_verticalAlignImageAndTitle(space: CGFloat = 5.0) {
        
        let imageWith :CGFloat = self.imageView!.frame.size.width;
        let imageHeight :CGFloat = self.imageView!.frame.size.height;
        
        let labelWidth = self.titleLabel!.intrinsicContentSize.width;
        let labelHeight = self.titleLabel!.intrinsicContentSize.height;
        
        self.imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space/2.0, 0, 0, -labelWidth);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
    }
}

var HQ_ColorWithHex: (NSInteger) -> UIColor = {hex in
    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: 1)
}
