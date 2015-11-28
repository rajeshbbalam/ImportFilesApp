//
//  AttachmentsPopUp.m
//  ImportFilesApp
//
//  Created by Rajesh on 28/11/15.
//  Copyright © 2015 Rajesh. All rights reserved.
//

#import "AttachmentsPopUp.h"


@implementation AttachmentsPopUp
{
    ImageButton *attachmentTypeBtn;
}
@synthesize delegate;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.layer.cornerRadius = 8.0;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.backgroundColor = [UIColor grayColor];
        [self setupControls];
    }
    return self;
}
-(void)setupControls
{
    float xOff = 10.0,yOff = 10.0;
    CGRect rect = self.frame;
    rect = CGRectMake(xOff, yOff, (CGRectGetWidth(rect)-4*xOff)/3,
                             (CGRectGetHeight(rect)-3*yOff)/2);
    
    for (int k=kAttachmentType_ImageGallery;k<kAttachmentType_count;k++) {
        attachmentTypeBtn = [[ImageButton alloc] initWithFrame:rect];
        attachmentTypeBtn.delegate = self;
        attachmentTypeBtn.tag = k;
        [self addSubview:attachmentTypeBtn];
        [self setAttachmentTypeBtnData:attachmentTypeBtn];
        rect.origin.x = CGRectGetMaxX(rect)+xOff;
        if (k==kAttachmentType_Video) {
            rect.origin.x = xOff;
            rect.origin.y = CGRectGetMaxY(rect)+yOff;
        }
        
    }
    
}
-(void)setAttachmentTypeBtnData:(ImageButton *)btn
{
    NSString *strImgNormal    = nil;
    NSString *strImgHighlight = nil;
    NSString *strTitle = @"";
    
    switch (btn.tag) {
        case kAttachmentType_ImageGallery:
            strImgNormal    = @"Gallary.png";
            strTitle = @"Gallery";
            strImgHighlight = @"";
            break;
        case kAttachmentType_Camera:
            strImgNormal    = @"Camera.png";
            strTitle = @"Camera";
            strImgHighlight = @"";
            break;
        case kAttachmentType_Video:
            strImgNormal    = @"Video.png";
            strTitle = @"Video";
            strImgHighlight = @"";
            break;
        case kAttachmentType_Audio:
            strImgNormal    = @"Audio.png";
            strTitle = @"Audio";
            strImgHighlight = @"";
            break;
        case kAttachmentType_Location:
            strImgNormal    = @"Location.png";
            strTitle = @"Location";
            strImgHighlight = @"";
            break;
        case kAttachmentType_Contact:
            strImgNormal    = @"Contact.png";
            strTitle = @"Contact";
            strImgHighlight = @"";
            break;
        default:
            break;
    }
    
    UIImage *imageNormal = [UIImage imageNamed:strImgNormal];
    [btn setBtnImage:imageNormal Title:strTitle];
}
#pragma mark -ImageButtonDelegate
-(void)selectedImageButton:(ImageButton *)imgBtn
{
    
   
    [delegate selectedAttachmentType:imgBtn.tag];
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
