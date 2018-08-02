//
//  ModifyDataViewController.m
//  LoveEducation
//
//  Created by mac on 2017/10/9.
//  Copyright © 2017年 郑州知信科技有限公司. All rights reserved.
//

#import "ModifyDataViewController.h"
#import "ModifyDataCell.h"
#import "ChangePasswordViewController.h"
#import "ModifyNumberViewController.h"
#import "MultipleViewController.h"
#import "StudentCertificationVC.h"
#import "CertificationViewController.h"
#import "StudentsInTheClassViewController.h"


@interface ModifyDataViewController ()<UIImagePickerControllerDelegate,WPhotoImagePickerViewControllerDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImage          *headerImg;

@property (nonatomic, strong) UICollectionView *modifyDataCollectionView;

//个人信息view
@property (nonatomic, strong) UIView       *IndividualView;
//头像label
@property (nonatomic, strong) UILabel      *headerImgLabel;
//头像
@property (nonatomic, strong) UIImageView  *headerImgView;
@property (nonatomic, strong) UIButton     *headerButton;
//分割线
@property (nonatomic, strong) UIView       *lineView;
//昵称
@property (nonatomic, strong) UILabel      *nickLabel;
@property (nonatomic, strong) UILabel      *nickNameLabel;
@property (nonatomic ,strong) UIButton     *nickButton;
//分割线
@property (nonatomic, strong) UIView       *lineView1;
//我的二维码
@property (nonatomic, strong) UILabel      *qrCodeLabel;
@property (nonatomic, strong) UIImageView  *qrCodeImgView;
@property (nonatomic, strong) UIButton     *qrCodeButton;

//认证
@property (nonatomic, strong) UIView       *certificationView;
//教师认证
@property (nonatomic, strong) UILabel      *schoolmasterLabel;
@property (nonatomic, strong) UIImageView  *goImgView;
@property (nonatomic, strong) UIButton     *schoolmasterButton;
//分割线
@property (nonatomic, strong) UIView       *lineView2;
//学生认证
@property (nonatomic, strong) UILabel      *studentLabel;
@property (nonatomic, strong) UIImageView  *goImgView1;
@property (nonatomic, strong) UIButton     *studentButton;

//修改
@property (nonatomic, strong) UIView       *changeView;
//修改账户密码
@property (nonatomic, strong) UILabel      *accountLabel;
@property (nonatomic, strong) UIImageView  *goImgView2;
@property (nonatomic, strong) UIButton     *accountButton;
//修改支付密码
@property (nonatomic, strong) UILabel      *payLabel;
@property (nonatomic, strong) UIImageView  *goImgView3;
@property (nonatomic, strong) UIButton     *payButton;
//分割线
@property (nonatomic, strong) UIView       *lineView3;

//地区
@property (nonatomic, strong) UIView       *areaView;
@property (nonatomic, strong) UILabel      *addressLabel;
@property (nonatomic, strong) UIButton     *addressButton;

//昵称
@property (nonatomic, strong) NSString     *nickNameStr;

@end

@implementation ModifyDataViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.view.backgroundColor = backColor;
    [self makeModifyDataViewControllerUI];
    
}




- (void)makeModifyDataViewControllerUI {
    

    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(10 * Height, 0, 0, 0);
    
    self.modifyDataCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WWidth, WHeight) collectionViewLayout:layout];
    self.modifyDataCollectionView.backgroundColor = backColor;
//    self.modifyDataCollectionView.delegate = self;
//    self.modifyDataCollectionView.dataSource = self;
    [self.view addSubview:self.modifyDataCollectionView];
    
    
    //个人信息view
    UserInfo *userInfo = [UserManager getUserObject];
    self.IndividualView = [[UIView alloc] initWithFrame:CGRectMake(10 * Width, 20 * Height, WWidth - 20 * Width, 170 * Height)];
    self.IndividualView.backgroundColor = [UIColor whiteColor];
    [self.modifyDataCollectionView addSubview:self.IndividualView];
    
    self.headerImgLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * Width, 20 * Height, WWidth * 0.3, 30 * Height)];
    self.headerImgLabel.text = @"头像";
    self.headerImgLabel.font = kTitleFont;
    self.headerImgLabel.textColor = [UIColor blackColor];
    [self.IndividualView addSubview:self.headerImgLabel];
    self.headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.IndividualView.frame.size.width - 70 * Width, 5 * Height, 60 * Width, 60 * Height)];
    [self.headerImgView sd_setImageWithURL:[NSURL URLWithString:userInfo.HeadImg]];
    [self.IndividualView addSubview:self.headerImgView];
    
    self.headerButton = [[UIButton alloc] initWithFrame:CGRectMake(10 * Width, 5 * Height, self.IndividualView.frame.size.width - 20 * Width, 60 * Height)];
    self.headerButton.backgroundColor = [UIColor clearColor];
    [self.headerButton addTarget:self action:@selector(headerButtonSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.IndividualView addSubview:self.headerButton];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(10 * Width, 71 * Height, self.IndividualView.frame.size.width - 20 * Width, 0.7 * Height)];
    self.lineView.backgroundColor = fengeLineColor;
    [self.IndividualView addSubview:self.lineView];
    
    self.nickLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * Width, 81 * Height, WWidth * 0.2, 30 * Height)];
    self.nickLabel.text = @"昵称";
    self.nickLabel.font = kTitleFont;
    self.nickLabel.textColor = [UIColor blackColor];
    [self.IndividualView addSubview:self.nickLabel];
    self.nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.IndividualView.frame.size.width - WWidth * 0.3 - 10 * Width, 81 * Height, WWidth * 0.3, 30 * Height)];
    if ([userInfo.userNickName isEqualToString:@""]) {
        self.nickNameLabel.text = userInfo.userName;
    } else {
        self.nickNameLabel.text = userInfo.userNickName;
    }
    self.nickNameLabel.textAlignment = NSTextAlignmentRight;
    self.nickNameLabel.font = kTitleFont;
    self.nickNameLabel.textColor = [UIColor blackColor];
    [self.IndividualView addSubview:self.nickNameLabel];
    self.nickButton = [[UIButton alloc] initWithFrame:CGRectMake(10 * Width, 81 * Height, self.IndividualView.frame.size.width - 20 * Width, 30 * Height)];
    self.nickButton.backgroundColor = [UIColor clearColor];
    [self.nickButton addTarget:self action:@selector(nickButtonSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.IndividualView addSubview:self.nickButton];
    
    self.lineView1 = [[UIView alloc] initWithFrame:CGRectMake(10 * Width, 122 * Height, self.IndividualView.frame.size.width - 20 * Width, 0.7 * Height)];
    self.lineView1.backgroundColor = fengeLineColor;
    [self.IndividualView addSubview:self.lineView1];
    
    self.qrCodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * Width, 133 * Height, WWidth * 0.3, 30 * Height)];
    self.qrCodeLabel.text = @"我的二维码";
    self.qrCodeLabel.font = kTitleFont;
    self.qrCodeLabel.textColor = [UIColor blackColor];
    [self.IndividualView addSubview:self.qrCodeLabel];
    self.qrCodeImgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.IndividualView.frame.size.width - 50 * Width, 133 * Height, 30 * Width, 30 * Height)];
    self.qrCodeImgView.image = [UIImage imageNamed:@"我的二维码"];
    [self.IndividualView addSubview:self.qrCodeImgView];
    self.qrCodeButton = [[UIButton alloc] initWithFrame:CGRectMake(10 * Width, 133 * Height, self.IndividualView.frame.size.width - 20 * Width, 30 * Height)];
    self.qrCodeButton.backgroundColor = [UIColor clearColor];
    [self.qrCodeButton addTarget:self action:@selector(qrCodeButtonSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.IndividualView addSubview:self.qrCodeButton];
    
    //认证
    self.certificationView = [[UIView alloc] initWithFrame:CGRectMake(10 * Width, 210 * Height, WWidth - 20 * Width, 101 * Height)];
    self.certificationView.backgroundColor = [UIColor whiteColor];
    [self.modifyDataCollectionView addSubview:self.certificationView];
    
    self.schoolmasterLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * Width, 10 * Height, WWidth * 0.3, 30 * Height)];
    self.schoolmasterLabel.text = @"教师认证";
    self.schoolmasterLabel.font = kTitleFont;
    self.schoolmasterLabel.textColor = [UIColor blackColor];
    [self.certificationView addSubview:self.schoolmasterLabel];
    self.goImgView= [[UIImageView alloc] initWithFrame:CGRectMake(self.certificationView.frame.size.width - 40 * Width, 10 * Height, 30 * Width, 30 * Height)];
    self.goImgView.image = [UIImage imageNamed:@"向右"];
    [self.certificationView addSubview:self.goImgView];
    self.schoolmasterButton = [[UIButton alloc] initWithFrame:CGRectMake(10 * Width, 10 * Height, self.certificationView.frame.size.width - 20 * Width, 30 * Height)];
    self.schoolmasterButton.backgroundColor = [UIColor clearColor];
    [self.schoolmasterButton addTarget:self action:@selector(schoolmasterButtonSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.certificationView addSubview:self.schoolmasterButton];
    
    self.lineView2 = [[UIView alloc] initWithFrame:CGRectMake(10 * Width, 51 * Height, self.certificationView.frame.size.width - 20 * Width, 0.7 * Height)];
    self.lineView2.backgroundColor = fengeLineColor;
    [self.certificationView addSubview:self.lineView2];
    
    self.studentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * Width, 61 * Height, self.certificationView.frame.size.width - 20 * Width, 30 * Height)];
    self.studentLabel.text = @"学生认证";
    self.studentLabel.font = kTitleFont;
    self.studentLabel.textColor = [UIColor blackColor];
    [self.certificationView addSubview:self.studentLabel];
    self.goImgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.certificationView.frame.size.width - 40 * Width, 61 * Height, 30 * Width, 30 * Height)];
    self.goImgView1.image = [UIImage imageNamed:@"向右"];
    [self.certificationView addSubview:self.goImgView1];
    self.studentButton = [[UIButton alloc] initWithFrame:CGRectMake(10 * Width, 61 * Height, self.certificationView.frame.size.width - 20 * Width, 30 * Height)];
    self.studentButton.backgroundColor = [UIColor clearColor];
    [self.studentButton addTarget:self action:@selector(studentButtonSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.certificationView addSubview:self.studentButton];
    
    self.changeView = [[UIView alloc] initWithFrame:CGRectMake(10 * Width, 320 * Height, WWidth - 20 * Width, 101 * Height)];
    self.changeView.backgroundColor = [UIColor whiteColor];
    [self.modifyDataCollectionView addSubview:self.changeView];
    
    self.accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * Width, 10 * Height, WWidth * 0.4, 30 * Height)];
    self.accountLabel.text = @"修改账户密码";
    self.accountLabel.font = kTitleFont;
    self.accountLabel.textColor = [UIColor blackColor];
    [self.changeView addSubview:self.accountLabel];
    self.goImgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.changeView.frame.size.width - 40 * Width, 10 * Height, 30 * Width, 30 * Height)];
    self.goImgView2.image = [UIImage imageNamed:@"向右"];
    [self.changeView addSubview:self.goImgView2];
    self.accountButton = [[UIButton alloc] initWithFrame:CGRectMake(10 * Width, 10 * Height, self.changeView.frame.size.width - 20 * Width, 30 * Height)];
    self.accountButton.backgroundColor = [UIColor clearColor];
    [self.accountButton addTarget:self action:@selector(accountButtonSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.changeView addSubview:self.accountButton];
    
    self.lineView3 = [[UIView alloc] initWithFrame:CGRectMake(10 * Width, 50 * Height, self.changeView.frame.size.width - 20 * Width, 0.7 * Height)];
    self.lineView3.backgroundColor = fengeLineColor;
    [self.changeView addSubview:self.lineView3];
    
    self.payLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * Width, 61 * Height, WWidth * 0.4, 30 * Height)];
    self.payLabel.text = @"修改支付密码";
    self.payLabel.font = kTitleFont;
    self.payLabel.textColor = [UIColor blackColor];
    [self.changeView addSubview:self.payLabel];
    self.goImgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.changeView.frame.size.width - 40 * Width, 61 * Height, 30 * Width, 30 * Height)];
    self.goImgView3.image = [UIImage imageNamed:@"向右"];
    [self.changeView addSubview:self.goImgView3];
    self.payButton = [[UIButton alloc] initWithFrame:CGRectMake(10 * Width, 61 * Height, self.changeView.frame.size.width - 20 * Width, 30 * Height)];
    self.payButton.backgroundColor = [UIColor clearColor];
    [self.payButton addTarget:self action:@selector(payButtonSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.changeView addSubview:self.payButton];
    
    self.areaView = [[UIView alloc] initWithFrame:CGRectMake(10 * Width, 430 * Height, WWidth - 20 * Width, 50 * Height)];
    self.areaView.backgroundColor = [UIColor whiteColor];
    [self.modifyDataCollectionView addSubview:self.areaView];
    self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * Width, 10 * Height, WWidth * 0.2, 30 * Height)];
    self.addressLabel.text = @"地区";
    self.addressLabel.font = kTitleFont;
    self.addressLabel.textColor = [UIColor blackColor];
    [self.areaView addSubview:self.addressLabel];
    self.addressButton = [[UIButton alloc] initWithFrame:CGRectMake(self.areaView.frame.size.width * 0.4 - 10 * Width, 10 * Height, self.areaView.frame.size.width * 0.6, 30 * Height)];
    [self.addressButton setTitle:@"郑州" forState:UIControlStateNormal];
    [self.addressButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.addressButton.backgroundColor = [UIColor clearColor];
    [self.addressButton addTarget:self action:@selector(addressButtonSelector:) forControlEvents:UIControlEventTouchUpInside];
    self.addressButton.titleLabel.font = kTitleFont;
    self.addressButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.areaView addSubview:self.addressButton];
    
}

//头像点击事件
- (void)headerButtonSelector : (UIButton *)sender {
    
    [self photoBtnSelector];
}

//昵称点击事件
- (void)nickButtonSelector : (UIButton *)sender {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"修改昵称" message:nil preferredStyle:UIAlertControllerStyleAlert];
    //弹框添加输入框
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.backgroundColor = [UIColor colorWithRed:252.0/35 green:255.0/123 blue:255.0/198 alpha:1];
        
    }];
    
    UIAlertAction *falseA = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击取消");
        
        
    }];
    
    UIAlertAction *trueA = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UserInfo *userInfo = [UserManager getUserObject];
        
        self.nickNameStr = alertVC.textFields.firstObject.text;
      
        
        [SVProgressHUD showWithStatus:@"修改昵称中..."];
        
        if (![self.nickNameStr isEqualToString:@""]) {
            
            NSDictionary *dic = @{@"nickname" : self.nickNameStr, @"id" : userInfo.userID};
        
            [WNetworkHelper POST:ChangNickNameURL parameters:dic success:^(id responseObject) {
                
                NSString *str = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"msg"]];
                if ([str isEqualToString:@"101"]) {
                    [SVProgressHUD showWithStatus:@"修改成功"];
                  
                    for (NSDictionary *dic in [responseObject objectForKey:@"data"]) {
                        UserInfo *userInfo       = [UserManager getUserObject];
                        NSString *userID         = userInfo.userID;
                        NSString *userName       = userInfo.userName;
                        NSString *userPassword   = userInfo.userPassword;
                        NSString *headImg        = userInfo.HeadImg;
                        NSString *createTime     = userInfo.createTime;
                        NSString *ringLetterName = userInfo.ringLetterName;
                        NSString *thearchID      = userInfo.thearchID;
                        NSString *studentID      = userInfo.studentID;
                        userInfo.userID          = userID;
                        userInfo.userName        = userName;
                        userInfo.userPassword    = userPassword;
                        userInfo.userNickName    = [dic objectForKey:@"nickname"];
                        userInfo.createTime      = createTime;
                        userInfo.ringLetterName  = ringLetterName;
                        userInfo.HeadImg         = headImg;
                        userInfo.studentID       = studentID;
                        userInfo.thearchID       = thearchID;
                        [UserManager saveUserObject:userInfo];
                        UserInfo *userInfo1 = [UserManager getUserObject];
                        self.nickNameLabel.text = userInfo1.userNickName;
                        
                    }
                    
                    
                    
                } else {
                    [SVProgressHUD  showWithStatus:[responseObject objectForKey:@"修改失败, 请重试"]];
                    [SVProgressHUD dismissWithDelay:1];
                    return;
                }
                [SVProgressHUD dismissWithDelay:1];
                
            } failure:^(NSError *error) {
                [SVProgressHUD showWithStatus:@"请检查网络连接是否连接正常"];
            }];
            [SVProgressHUD dismissWithDelay:0.3];
        }
        
        [SVProgressHUD dismiss];
    }];
    [alertVC addAction:falseA];
    [alertVC addAction:trueA];
    [self presentViewController:alertVC animated:YES completion:nil];
    
    
    
}

//二维码点击事件
- (void)qrCodeButtonSelector : (UIButton *)sender {
    NSLog(@"点击二维码");
}

//教师认证点击事件
- (void)schoolmasterButtonSelector : (UIButton *)sender {
    
    UserInfo *userInfo = [UserManager getUserObject];
    
    if ([userInfo.thearchID isEqualToString:@"1"]) {
        
        MultipleViewController *VC = [[MultipleViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    } else {
        
        CertificationViewController *VC = [[CertificationViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
}

//学生认证点击事件
- (void)studentButtonSelector : (UIButton *)sender {
    
    UserInfo *userInfo = [UserManager getUserObject];
    
    if ([userInfo.studentID isEqualToString:@"2"]) {
        
        StudentsInTheClassViewController *VC = [[StudentsInTheClassViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    } else {
       
        StudentCertificationVC *VC = [[StudentCertificationVC alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }

}

//点击修改密码
- (void)accountButtonSelector : (UIButton *)sender {
    
    ChangePasswordViewController *changVC = [[ChangePasswordViewController alloc] init];
    [self.navigationController pushViewController:changVC animated:YES];
}

//修改支付密码
- (void)payButtonSelector : (UIButton *)sender {
    NSLog(@"点击修改支付密码");
}

//地区
-(void)addressButtonSelector : (UIButton *)sender {
    NSLog(@"点击地区");
}


//点击相机相应时间
- (void)photoBtnSelector {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"添加照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cleanAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self presentViewController:ImagePickerStyleCamera];
            
        } else {
            NSLog(@"你现实使用的是模拟器，请切换真机尝试");
        }
    }];
    
    UIAlertAction *choseAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self presentViewController:ImagePickerStylePhotoLibrary];
        
    }];
    
    
    [alertVC addAction:photoAction];
    [alertVC addAction:choseAction];
    [alertVC addAction:cleanAction];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
    
    
}


#pragma mark----跳转到WPhotoImagePickerViewController
-(void)presentViewController:(imagePickerStyle)style {
    WPhotoImagePickerViewController *picker=[[WPhotoImagePickerViewController alloc]initWithImagePickerStyle:style];
    picker.WPhotoImageDelegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}



-(void)imageChooseFinish:(UIImage *)image {
    //
    [WPhotoImagePickerViewController saveImageToSandbox:image andImageNage:[NSString stringWithFormat:@"%@.jpg",[Help getCurrentTime]] andResultBlock:^(BOOL success) {
        NSLog(@"保存成功");
        
    }];
    
    
    self.headerImg = image;
    
    self.headerImgView.image = self.headerImg;
    

    [self SubmitAvatarBtnSelector];
}



//点击取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

//上传头像
- (void)SubmitAvatarBtnSelector {
    
    //读取文件夹
    NSString *nameStr = [WPhotoImagePickerViewController filePath:@"Documents.jpg"];
    
    UserInfo *userInfo = [UserManager getUserObject];
    
    NSDictionary *dic = @{@"id" : userInfo.userID};
    
    NSData *imageData = UIImageJPEGRepresentation(self.headerImg, 0.5);
    
    [SVProgressHUD showInfoWithStatus:@"图片上传中..."];
    
    [WNetworkHelper postUploadWithUrl:UpheadimgUrl parameters:dic fileData:imageData name:@"image" fileName:nameStr fileType:@"666.jpg" success:^(id responseObject) {
        
        NSString *str = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"msg"]];
        if ([str isEqualToString:@"101"]) {
            for (NSDictionary*dataDic in [responseObject objectForKey:@"data"]) {
                NSLog(@"%@",[dataDic objectForKey:@"imgurl"]);
                UserInfo *userInfo = [UserManager getUserObject];
                NSString *userID = userInfo.userID;
                NSString *userName = userInfo.userName;
                NSString *userPassword = userInfo.userPassword;
                NSString *userNickName = userInfo.userNickName;
                NSString *createTime   = userInfo.createTime;
                NSString *ringLetterName = userInfo.ringLetterName;
                NSString *studentID = userInfo.studentID;
                NSString *thearchID = userInfo.thearchID;
                NSString *groupIDStr = userInfo.groupIDStr;
                NSString *classNameStr = userInfo.classNameStr;
                userInfo.userID = userID;
                userInfo.userName = userName;
                userInfo.userPassword = userPassword;
                userInfo.userNickName = userNickName;
                userInfo.createTime = createTime;
                userInfo.ringLetterName = ringLetterName;
                userInfo.studentID = studentID;
                userInfo.thearchID = thearchID;
                userInfo.groupIDStr = groupIDStr;
                userInfo.classNameStr = classNameStr;
                userInfo.HeadImg = [dataDic objectForKey:@"imgurl"];
                [UserManager saveUserObject:userInfo];

            }
        } else {
            [SVProgressHUD showErrorWithStatus:[responseObject objectForKey:@"content"]];
        }
        
    } fail:^{
        [SVProgressHUD dismiss];
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
