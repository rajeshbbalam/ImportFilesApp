//
//  AttachmentsPopUp.h
//  ImportFilesApp
//
//  Created by Rajesh on 28/11/15.
//  Copyright © 2015 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageButton.h"

typedef NS_ENUM(NSUInteger, AttachmentType) {
    kAttachmentType_ImageGallery = 0,
    kAttachmentType_Camera,
    kAttachmentType_Video,
    kAttachmentType_Audio,
    kAttachmentType_Location,
    kAttachmentType_Contact,
    kAttachmentType_count
    
};
@protocol AttachmentsPopUpDelegate <NSObject>

@optional
-(void)selectedAttachmentType:(AttachmentType)type;

@end
@interface AttachmentsPopUp : UIView<ImageButtonDelegate>
@property (weak)id<AttachmentsPopUpDelegate> delegate;
@end
