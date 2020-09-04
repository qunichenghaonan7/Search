# Search
SwiftUI

因目前设备性能问题，暂无法更新到SwiftUI 2.0版本，所以很多控件无法使用性能更好的，且暂未找到UIKit中基础的功能（键盘自动弹起等），因是纯SwiftUI Demo，所以删除了UIKit转SwiftUI的部分
在实际项目中更换版本可使用性能更好，bug更少的控件

---

## UI部分
---
### 主页面
包含一个navigationTitle，一个类似UISearchBar的按钮
1、因SwiftUI目前版本navigationLink到第二页面，即使隐藏了navigationBar，但其frame仍存在，所以采用sheet的形式弹出详情页

### 搜索详情页
包含一个SearchBar，一个列表及无数据时No Result的Text

### SearchBar
通过TextField+Image来实现

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






