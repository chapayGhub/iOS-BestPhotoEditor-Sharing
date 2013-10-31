//
//  ViewController.h
//  iOS-BestPhotoEditor-ShareDemo
//
//  Created by Glare52 on 22/10/13.
//  Copyright (c) 2013 Glare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIDocumentInteractionControllerDelegate>
{
    IBOutlet UIImageView                * aImageView;
}

@property (nonatomic, strong) UIDocumentInteractionController       * documentInterActionController;

@end
