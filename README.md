# ActionSheet
自己封装的ActionSheet

### 效果
![img](2022-01-17%20145733.gif)

###用法

```swift
        let actionSheetVC = ActionSheetController(title: self.title ?? "", contentView: pickView)
        actionSheetVC.delegate = self
        vc?.present(actionSheetVC, animated: true, completion: nil)
        
       //注意使用了snpkit
       //app_screen_width,app_screen_height是屏幕宽高
```
