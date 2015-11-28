//
//  FileImportViewController.h
//  TingTing
//
//  Created by Sandeep Gandra on 28/11/15.
//  Copyright © 2015 Billionusers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttachmentsPopUp.h"
#import <MediaPlayer/MPMediaPickerController.h>

@interface FileImportViewController : UIViewController<AttachmentsPopUpDelegate,UIImagePickerControllerDelegate,MPMediaPickerControllerDelegate>

@end
