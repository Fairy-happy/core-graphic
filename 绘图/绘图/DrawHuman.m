//
//  DrawHuman.m
//  绘图
//
//  Created by fairy on 16/1/5.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "DrawHuman.h"
#define JKRadius 70
#define JKTopY 100
#define JKColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation DrawHuman


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    drawBody(context,rect);//身体
    
    drawMouse(context,rect);//嘴
    drawEyes(context,rect);//眼睛
}

//画身体
void drawBody(CGContextRef context,CGRect rect)
{
    //上半圆
    CGFloat topX = rect.size.width*0.5;
    CGFloat topY = JKTopY;
    CGFloat topRadius = JKRadius;
    CGContextAddArc(context, topX, topY, topRadius, 0, M_PI, 1);
    
    //向下延展
    CGFloat middleX = topX-topRadius;
    CGFloat middleH = JKTopY;
    CGFloat middleY = topY +middleH;
    CGContextAddLineToPoint(context, middleX, middleY);
    
    //下半圆
    CGFloat bottomX = topX;
    CGFloat bottomY = middleY;
    CGFloat bottomRadiud = topRadius;
    CGContextAddArc(context, bottomX, bottomY, bottomRadiud, M_PI, 0, 1);
    //合并路径
    CGContextClosePath(context);
    //设置颜色
    [JKColor(252,218,0) set];
    CGContextFillPath(context);
    
}

//画嘴
void drawMouse(CGContextRef context,CGRect rect)
{
   //设置控制点
    CGFloat controlX = rect.size.width*0.5;
    CGFloat controlY = rect.size.height*0.3;
    //设置当前点
    CGFloat marginX = 20;
    CGFloat marginY = 10;
    CGFloat currentX = controlX-marginX;
    CGFloat currentY = controlY-marginY;
    CGContextMoveToPoint(context, currentX, currentY);
    //结束点
    CGFloat endX = controlX+marginX;
    CGFloat endY = currentY;
    //贝塞尔曲线
    CGContextAddQuadCurveToPoint(context, controlX, controlY, endX, endY);
    //设置颜色
    [[UIColor blackColor]set];
    
    //显示
    CGContextStrokePath(context);
    
}


//画眼睛
void drawEyes(CGContextRef context,CGRect rect)
{
    //黑色绑带
    CGFloat startX = rect.size.width*0.5-JKRadius;
    CGFloat startY = JKTopY;
    CGContextMoveToPoint(context, startX, startY);
    CGFloat endX = startX + 2*JKRadius;
    CGFloat endY = startY;
    CGContextAddLineToPoint(context, endX, endY);
    CGContextSetLineWidth(context, 15);
    [[UIColor blackColor] set];
    //显示
    CGContextStrokePath(context);
    //灰色镜框
    [JKColor(61, 62, 66)set];
    CGFloat kuangRadius = JKRadius * 0.4;
    CGFloat kuangX = rect.size.width -kuangRadius;
    CGFloat kuangY = startY;
    CGContextAddArc(context, kuangX-155, kuangY, kuangRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    //里面白色框
    [[UIColor whiteColor]set];
    CGFloat whiteRadius = kuangRadius*0.7;
    CGFloat whiteX = kuangX;
    CGFloat whiteY = kuangY;
    CGContextAddArc(context, whiteX-155, whiteY, whiteRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    //眼睛
    [[UIColor blackColor]set];
    CGFloat blackRadius = whiteRadius*0.5;
    CGFloat blackX = whiteX-155;
    CGFloat blackY = whiteY;
    CGContextAddArc(context, blackX, blackY, blackRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
}

@end
