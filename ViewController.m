//
//  ViewController.m
//  iOS-BestPhotoEditor-ShareDemo
//
//  Created by Glare52 on 22/10/13.
//  Copyright (c) 2013 Glare. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)selecteImage:(id)sender
{
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    
    picker.mediaTypes = [NSArray arrayWithObjects:(NSString *) kUTTypeImage,nil];
    picker.allowsEditing = NO;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        aImageView.image = image;
    }
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)shareViaApp:(id)sender
{
    if (aImageView.image == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Please select an Image." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        return;
    }
    
    NSURL *photoEditingURL = [NSURL URLWithString:@"photoediting://"];
    if ([[UIApplication sharedApplication] canOpenURL:photoEditingURL])
    {
        UIImage * aImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Image Document.jpg" ofType:nil]];
        NSData *data = UIImageJPEGRepresentation(aImage, 0.75);
        NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/test.peimg"];
        [data writeToFile:jpgPath atomically:YES];
        
        NSURL *imageFile = [NSURL fileURLWithPath:jpgPath];
        
        _documentInterActionController.UTI = @"com.glaresoftware.photoediting.peimg";
        _documentInterActionController = [self setupControllerWithURL:imageFile usingDelegate:self];
        _documentInterActionController = [UIDocumentInteractionController interactionControllerWithURL:imageFile];
        [_documentInterActionController presentOpenInMenuFromRect:CGRectMake(0, 0, 0, 0) inView:self.view animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"You have not installed Photo Editor App in device." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (UIDocumentInteractionController *) setupControllerWithURL: (NSURL*) fileURL usingDelegate: (id <UIDocumentInteractionControllerDelegate>) interactionDelegate
{
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL: fileURL];    
    interactionController.delegate = interactionDelegate;    
    return interactionController;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:APP_LINK]];
}

- (IBAction)openApp:(id)sender
{
    NSURL *instagramURL = [NSURL URLWithString:@"bestphotoeditor://"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
