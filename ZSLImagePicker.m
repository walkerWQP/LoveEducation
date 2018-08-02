//
//  ZSLImagePicker.m
//  LoveEducation
//
//  Created by mac on 2017/9/28.
//  Copyright © 2017年 郑州知信科技有限公司. All rights reserved.
//

#import "ZSLImagePicker.h"

@interface ZSLImagePicker () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end


@implementation ZSLImagePicker

#pragma mark - public
+ (ZSLImagePicker *)defaultImagePicker
{
    static ZSLImagePicker *imagePicker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imagePicker = [self new];
    });
    return imagePicker;
}

- (void)startPickImageWithVC:(UIViewController *)vc
{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil message:@"添加照片" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancelAction");
    }];
    
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"takePhoto");
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *imagePC = [UIImagePickerController new];
            imagePC.delegate = self;
            imagePC.editing = YES;
            imagePC.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [vc presentViewController:imagePC animated:YES completion:nil];
        }else {
            NSLog(@"无相机");
        }
    }];
    
    UIAlertAction *selectPhoto = [UIAlertAction actionWithTitle:@"从相册选择 " style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"selectPhoto");
        
        UIImagePickerController *ipc = [UIImagePickerController new];
        ipc.delegate = (id)self;
        ipc.allowsEditing = YES;
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [vc presentViewController:ipc animated:YES completion:nil];
    }];
    [ac addAction:cancelAction];
    [ac addAction:takePhoto];
    [ac addAction:selectPhoto];
    [vc presentViewController:ac animated:YES completion:nil];
}

- (void)completion:(Completion)completion
{
    self.completion = completion;
}

#pragma mark - <UIImagePickerControllerDelegate>
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]) {
        //得到照片
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        self.completion(image);
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
