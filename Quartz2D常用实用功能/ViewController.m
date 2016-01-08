//
//  ViewController.m
//  Quartz2D常用实用功能
//
//  Created by kouhanjin on 16/1/8.
//  Copyright © 2016年 khj. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Expansion.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
- (IBAction)clipImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 图片水印
//    [self drawWater];
    UIImage *newImage = [UIImage circleImageWithName:@"me" borderWidth:2 borderColor:[UIColor whiteColor]];
    self.iconView.image = newImage;

//    UIImage *newImage = [UIImage waterImageWithBg:@"scene" logo:@"logo"];
//    self.iconView.image = newImage;
    
//    NSData *data = UIImagePNGRepresentation(newImage);
//    
//    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"waterImage.png"];
//    NSLog(@"%@",path);
//    [data writeToFile:path atomically:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clipImage {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *newImage = [UIImage captureWithView:self.view];
        // 写入文件
        NSData *data = UIImagePNGRepresentation(newImage);
        
        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
        NSLog(@"%@",path);
        [data writeToFile:path atomically:YES];
    });
}
@end
