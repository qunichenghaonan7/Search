# Search
SwiftUI

---

## UI部分
---
### 主页面
包含一个navigationTitle，一个类似UISearchBar的按钮，所以采用了封装UISearchBar-->View的方式封装
1、因SwiftUI目前版本navigationLink到第二页面，即使隐藏了navigationBar，但其frame仍存在，所以采用sheet的形式弹出详情页
2、推测是SwiftUI 1.0版本的bug，封装的UISearchBar,UItextField等，只有在被Form持有时，才可以设置自动弹起键盘，否则会崩溃，所以停用了自动弹起键盘

### 搜索详情页
包含一个SearchBar，一个列表及无数据时No Result的Text
因目前设备性能问题，暂无法更新到SwiftUI 2.0版本，所以很多空间无法使用性能更好的，在实际项目中更换设备可使用性能更好，bug更少的控件

### SearchBar
封装的UISearchBar

### SeachCell
搜索列表详细UI

---
## 逻辑部分
---
swiftUI大部分使用Struct的形式，值类型更好的copy及传递，避免引用问题

### MainView
内建一个`@State var showDetail = false`，button通过关联此属性控制SeachDetailView的弹出

### SearchDetailView
内建一个`@ObservedObject var store = SearchStore()`，通过`store.state`控制UI的显示及刷新

### SeachOperator
SearchBar输入值更新后模拟异步请求的核心操作，包含一个`AnyPublisher`

### SearchCommand
异步处理耗时操作，订阅`SeachOperator.publisher`，完成后更新SeachStore中的State

### SearchState
数据的属性部分（UI的状态），包括控制搜索列表的`[NetWorkDataModel.SearchListModel]`以及关联SearchBar输入框的`TextFieldProperty.(@Published var) searchText: String`，存储在Store中，关联到UI的控件中，更新后同步UI

### SearchStore
数据的类管理部分，UI*只通过*`dispatch(action: SearchAction)`方法更改State及Command，其核心都是通过更新State以达到刷新UI的目的






