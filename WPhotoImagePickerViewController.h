//
//  WPhotoImagePickerViewController.h
//  LoveEducation
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 郑州知信科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSUInteger,imagePickerStyle){
    ImagePickerStyleCamera,        //相机
    ImagePickerStylePhotoLibrary   //相册
};

@protocol WPhotoImagePickerViewControllerDelegate <NSObject>

-(void)imageChooseFinish:(UIImage *)image;

@end

/**
 *  保存成功回调
 *
 *  @param success 保存成功的block
 */
typedef void(^resultBlock)(BOOL success);

@interface WPhotoImagePickerViewController : UIImagePickerController

/**
 *  SZKImagePickerVCDelegate
 */
@property(nonatomic,assign)id<WPhotoImagePickerViewControllerDelegate>WPhotoImageDelegate;

/**
 *  初始化SZKImagePicker
 *
 *  @param style 打开照相机或者图库
 *
 *  @return  初始化SZKImagePicker
 */
-(instancetype)initWithImagePickerStyle:(imagePickerStyle)style;
/**
 *  保存图片到沙盒
 *
 *  @param image     要保存的图片
 *  @param imageName 保存的图片名称
 *  @param block     保存成功的值
 */
+(void)saveImageToSandbox:(UIImage *)image
             andImageNage:(NSString *)imageName
           andResultBlock:(resultBlock)block;
/**
 *  沙盒中获取到的照片
 *
 *  @param imageName 读取的照片名称
 *
 *  @return 从沙盒读取到的照片
 */
+(UIImage *)loadImageFromSandbox:(NSString *)imageName;
/**
 *  根据文件获取沙盒路径
 *
 *  @param fileName 文件名称
 *
 *  @return 文件在沙盒中的路径
 */
+(NSString *)filePath:(NSString *)fileName;

@end
