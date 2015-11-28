//
//  ViewController.m
//  ImportFilesApp
//
//  Created by Sandeep Gandra on 28/11/15.
//  Copyright © 2015 sampleApps. All rights reserved.
//

#import "ViewController.h"
#import "FileImportViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    FileImportViewController *fVc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
}
- (IBAction)ShowFilesImportPopUp:(id)sender {
    fVc = [[FileImportViewController alloc] init];
    fVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:fVc animated:YES completion:^{
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
