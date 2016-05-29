# MoreView
显示类似支付宝的菜单

类似支付宝菜单页面 可以只要colcount 列 以及每一列的高度。
会自动去布局 
MoreMenuView * moremenView = [[MoreMenuView alloc]initWithArray:MenuArray colcount:3 height:60]; 
moremenView.delegate = self;
moremenView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49); 
[self.view addSubview:moremenView];
下面是设置效果
![图片1](https://github.com/liu122468551/MoreView/blob/master/MoreBtn/Preview/7A33E4FC-D15F-4FA2-99D4-371FA7C8DEAA.png)
![图片1](https://github.com/liu122468551/MoreView/blob/master/MoreBtn/Preview/ECAC164F-4649-47F7-8BA4-43EC87239F9A.png)
