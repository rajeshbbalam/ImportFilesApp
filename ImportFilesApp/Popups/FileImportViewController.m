//
//  FileImportViewController.m
//  ImportFilesApp
//
//  Created by Rajesh on 28/11/15.
//  Copyright © 2015 Rajesh. All rights reserved.
//


#import "FileImportViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
@interface FileImportViewController ()

@end

@implementation FileImportViewController
{
    AttachmentsPopUp *importFilesPopup;
    UIImagePickerController *photoLibraryPicker;
    MPMediaPickerController *mediaPicker;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    float xOff = (CGRectGetWidth(self.view.frame)-200)/2;
    float yOff = CGRectGetMidY(self.view.frame)-75;
    CGRect rect = self.view.bounds;
    rect.origin = CGPointMake(xOff, yOff);
    rect.size = CGSizeMake(200,150);
    importFilesPopup = [[AttachmentsPopUp alloc] initWithFrame:rect];
    importFilesPopup.delegate = self;
    [self.view addSubview:importFilesPopup];
}
#pragma mark -AttachmentsPopupDelegate
-(void)selectedAttachmentType:(AttachmentType)type
{
    if(type<kAttachmentType_Audio){
        photoLibraryPicker = [[UIImagePickerController alloc] init];
        photoLibraryPicker.delegate = self;
        photoLibraryPicker.allowsEditing = YES;
    }
    switch (type) {
        case kAttachmentType_ImageGallery:
        {
            photoLibraryPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            photoLibraryPicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *)(NSString *)kUTTypeImage,nil];
            

        }
            break;
        case kAttachmentType_Camera:
        {
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ) {
                return;
            }
            photoLibraryPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
            break;
        case kAttachmentType_Video:
        {
            photoLibraryPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            photoLibraryPicker.mediaTypes =[[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie,nil];
            
        }
            break;
        case kAttachmentType_Audio:
        {
            mediaPicker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeAnyAudio];
            //mediaPicker.prompt = @"Select Song";
            mediaPicker.delegate = self;
            [self presentViewController:mediaPicker animated:YES completion:nil];
            return;

        }
            break;
        case kAttachmentType_Location:
            break;
        case kAttachmentType_Contact:
            break;
        default:
            break;
    }
    if(type<kAttachmentType_Audio){
        [self presentViewController:photoLibraryPicker animated:YES completion:^{
            
        }];
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ( [mediaType isEqualToString:@"public.movie" ])
    {
        
        //NSURL *url =  [info objectForKey:UIImagePickerControllerMediaURL];
        
    }else{
       
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
       // NSData* imageData = UIImageJPEGRepresentation(image, 1.0);
       
        
//        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString* documentsDirectory = [paths objectAtIndex:0];
//        
//        NSString* fullPathToFile2 = [documentsDirectory stringByAppendingPathComponent:incrementedImgStr];
//        [imageData writeToFile:fullPathToFile2 atomically:NO];
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [self dismissViewControllerAnimated:NO  completion:nil];
    }];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [self dismissViewControllerAnimated:NO  completion:nil];
    }];
}
#pragma mark -MPMediaPickerDelegate
- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
{
    MPMediaItem *theChosenSong = [[mediaItemCollection items]objectAtIndex:0];
    NSString *songTitle = [theChosenSong valueForProperty:MPMediaItemPropertyTitle];
    NSURL *assetURL = [theChosenSong valueForProperty:MPMediaItemPropertyAssetURL];
    AVURLAsset  *songAsset  = [AVURLAsset URLAssetWithURL:assetURL options:nil];
}
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker
{
    [self dismissViewControllerAnimated:YES completion:^{
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}
-(void)handleSingleTap:(UITapGestureRecognizer *)gesture
{
    CGPoint pt = [gesture locationInView:gesture.view];
    
    if ( CGRectContainsPoint(importFilesPopup.frame, pt)) {
        return;
    }
 
 [self dismissViewControllerAnimated:NO completion:^{
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
