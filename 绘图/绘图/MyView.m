//
//  MyView.m
//  绘图
//
//  Created by fairy on 16/1/5.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "MyView.h"
//求弧度
CGFloat arc(CGFloat angle)
{
    return angle*(M_PI/180);
}
@implementation MyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//系统自动调用，视图显示在屏幕上的时候调用切调用一次
- (void)drawRect:(CGRect)rect {
     //Drawing code
    
    //画线
    //draeLine();
    
    //绘制四边形
    //drawR();
    
    //绘制三角形
    //drawTriangle();
    
    //画圆
    //drawCircle();
    
    //画圆弧
    //drawArc();
    
    //绘制文字
    //drawtext();
    
    //绘制图片
    //drawImage();
    
    //贝塞尔曲线
    drawBezier();
    
    
}

//划线
void draeLine()
{
    //获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
//    将上下文复制一份放到栈中
    CGContextSaveGState(context);
    
    //绘制图形
    //第一条线
    //设置线段宽度
    CGContextSetLineWidth(context, 20);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);//空心颜色
    //设置起点
    CGContextMoveToPoint(context, 10, 10);
    //设置线条头尾部样式
    CGContextSetLineCap(context, kCGLineCapRound);

    //画线
    CGContextAddLineToPoint(context, 100, 100);
    //显示到view
    CGContextStrokePath(context);//以空心的方式画出
    //将图形上下文出栈，替换当前上下文
    CGContextRestoreGState(context);
    
    //2条线
    //[[UIColor blueColor]set];
    //设置线条头尾部样式
    //CGContextSetLineCap(context, kCGLineCapRound);
    //设置线条转折点样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    //画线
    CGContextMoveToPoint(context, 100, 120);
    CGContextAddLineToPoint(context, 150, 120);
    CGContextAddLineToPoint(context, 150, 180);
    //显示到view
    CGContextStrokePath(context);//以空心的方式画出

    
}

//画四边形
 void drawR()
{
    //获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制四边形
    CGContextAddRect(context, CGRectMake(10, 10, 120, 180));
    //设置颜色
    [[UIColor purpleColor]setFill];
    //显示在view上
    CGContextFillPath(context);
    
    
}


//绘制三角形
 void drawTriangle()
{
    //获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制三角形
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 100);
    //关闭路径，连接起点和最后一个点
    CGContextClosePath(context);
    [[UIColor redColor]set];
    CGContextStrokePath(context);
}


//画圆
 void drawCircle()
{
    //获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制圆形
    CGContextAddEllipseInRect(context, CGRectMake(50, 50, 100, 100));
    CGContextSetLineWidth(context, 5);
    CGContextStrokePath(context);
}

//画圆弧
 void drawArc()
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画圆弧
    //x,y:圆心
//    radius： 半径
//    startAngle：开始角度 必须填写弧度
//    endAngle：结束角度
//    clockwise：圆弧的伸展方向（0：顺时针，1：逆时针）
    CGContextAddArc(context, 100, 100, 50, arc(90), arc(200), 1);//1代表逆时针
    CGContextStrokePath(context);
}

//绘制文字
void drawtext()
{
    NSString *str = @"fairy";
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName]= [UIColor purpleColor];//设置文字颜色
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];//设置文字大小
    [str drawInRect:CGRectMake(100, 100, 100, 40) withAttributes:attributes];
    
}

//绘制图片
void drawImage()
{
    //拿到图片
    UIImage *img =[UIImage imageNamed:@"139-150309101A0.jpg"];
    //画
    //[img drawAtPoint:CGPointMake(50, 50)];//从固定点开始画
    //[img drawInRect:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];//规定图片坐标与宽高
    [img drawAsPatternInRect:CGRectMake(0, 0, 200, 200)];//规定宽高，用图片填充
    //图片添加文字
    NSString *str = @"fairy";
    [str drawInRect:CGRectMake(0, 0, 100, 40) withAttributes:nil];//可以给图片设置水印
}

//贝塞尔曲线
void drawBezier()
{
    //取得图片上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //起点
    CGContextMoveToPoint(context, 10, 10);
    //2个控制点
    CGContextAddCurveToPoint(context, 120, 100, 180, 50, 190, 190);
   
    //添加一个控制点
    //CGContextAddQuadCurveToPoint(context, 150, 200, 200, 100);
    
     CGContextStrokePath(context);
    
    
}

@end
