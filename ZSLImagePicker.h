//
//  ZSLImagePicker.h
//  LoveEducation
//
//  Created by mac on 2017/9/28.
//  Copyright © 2017年 郑州知信科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

typedef void(^Completion)(UIImage *image);

@interface ZSLImagePicker : NSObject

@property (copy, nonatomic) Completion completion;
- (void)completion:(Completion)completion;

+ (ZSLImagePicker *)defaultImagePicker;

- (void)startPickImageWithVC:(UIViewController *)vc;

@end
