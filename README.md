# HQBlankView
空白页 数据为空时显示 有数据时消失  
可以用在任何View上，UIView，UITableView等。

使用方法：

```Swift
   @IBAction func showBlankView(_ sender: UIButton) {
        
        HQBlankView.show(view, imgStr: "noTest", title: "咱无考试记录") {
            self.hideBlankView()
        }
    }
    
    fileprivate func hideBlankView() {
        
        HQBlankView.hide(fromView: self.view)
    }
```

![](https://github.com/kHeQing/HQBlankView/blob/master/01.png)
![](https://github.com/kHeQing/HQBlankView/blob/master/02.png)