//
//  ViewController.m
//  滚动视图
//
//  Created by 谢鑫 on 2019/6/10.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate=self;
    //scrollView的属性
    self.scrollView.contentSize=self.imageView.bounds.size;//显示区域为图片的size，图片比手机屏幕大
    //self.scrollView.contentOffset=CGPointZero;//开始的原点，前两个属性可以实现基本的scrollView
    self.scrollView.contentOffset=CGPointMake(200, 50);//偏移量
    self.view.backgroundColor=[UIColor redColor];
    self.scrollView.contentInset=UIEdgeInsetsMake(100, 100, 100, 0);//self.scrollView.contentInset=UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)拉出后弹簧效果弹回后会有一个边框的存在，上左下右分别边框多大多少
    self.scrollView.bounces=NO;//默认是有弹簧效果的。设为NO后就不会有弹簧效果，拖动到可拖动的范围就不能 拖了。
    self.scrollView.showsHorizontalScrollIndicator=NO;//水平提示器，默认是有的
    self.scrollView.showsVerticalScrollIndicator=NO;//垂直提示器，默认是有的
    
    //设置缩放比例
    self.scrollView.minimumZoomScale=0.5;
    self.scrollView.maximumZoomScale=2;
    
}
- (UIImageView *)imageView{
    if (_imageView==nil) {
        _imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
        [self.scrollView addSubview:_imageView];
    }
    return _imageView;
}
#pragma mark -UIScrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%s",__func__);
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imageView;
}
@end
