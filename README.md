# ActionSheet
自己封装的ActionSheet

### 效果
![img](2022-01-17%20145733.gif)

###用法

```swift
        let actionSheetVC = ActionSheetController(title: self.title ?? "", contentView: pickView)
        actionSheetVC.delegate = self
        vc?.present(actionSheetVC, animated: true, completion: nil)
```
