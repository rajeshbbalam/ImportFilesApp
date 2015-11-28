//
//  ImageButton.m
//  ImportFilesApp
//
//  Created by Rajesh on 28/11/15.
//  Copyright © 2015 Rajesh. All rights reserved.
//


#import "ImageButton.h"

@implementation ImageButton
{
    UIButton *buttonObj;
    UILabel *labelObj;
    
}
@synthesize delegate;
-(instancetype)initWithFrame:(CGRect)frame
{
    self =[ super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        float BtnHtOff = 15;
        CGRect rect = self.frame;
        rect.origin = CGPointZero;
        rect.size.height -= BtnHtOff;
        
        buttonObj = [[UIButton alloc] initWithFrame:rect];
        buttonObj.backgroundColor = [UIColor clearColor];
        [buttonObj addTarget:self action:@selector(handleImageBtnTouch) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttonObj];
        
        rect.origin.y = CGRectGetMaxY(rect);
        rect.size.height = BtnHtOff;
        
        labelObj = [[UILabel alloc]initWithFrame:rect];
        //labelObj.backgroundColor = [UIColor redColor];
        labelObj.textAlignment = NSTextAlignmentCenter;
        labelObj.textColor = [UIColor whiteColor];
        [self addSubview:labelObj];
        
       
    }
    
    return self;
}
-(void)setBtnImage:(UIImage *)image Title:(NSString *)strTitle
{
    [buttonObj setBackgroundImage:image forState:UIControlStateNormal];
    labelObj.text = strTitle;
    labelObj.adjustsFontSizeToFitWidth = YES;
    
}
-(void)handleImageBtnTouch
{
    [delegate selectedImageButton:self];
}
@end
