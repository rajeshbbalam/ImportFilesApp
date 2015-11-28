//
//  ImageButton.h
//  ImportFilesApp
//
//  Created by Rajesh on 28/11/15.
//  Copyright © 2015 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  ImageButton;

@protocol ImageButtonDelegate <NSObject>

@optional
-(void)selectedImageButton:(ImageButton *)imgBtn;

@end

@interface ImageButton : UIView

@property (strong,nonatomic)id<ImageButtonDelegate> delegate;
-(void)setBtnImage:(UIImage *)image Title:(NSString *)strTitle;

@end
