//
//  NativeViewController.m
//  Runner
//
//  Created by 奇亚 on 2020/11/23.
//

#import "NativeViewController.h"
#import "UIFont+Custom.h"

@interface NativeViewController ()

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UILabel *regularLabel = ({
        UILabel *lbl = [[UILabel alloc] init];
        lbl.text = @"regular: qwertyuiopasdfghjklzxcvbnm";
        lbl.font = [UIFont ct_fontWithName:@"PolarisRegular" size:16];
        lbl;
    });
    
    UILabel *meduimLabel = ({
        UILabel *lbl = [[UILabel alloc] init];
        lbl.text = @"medium: qwertyuiopasdfghjklzxcvbnm";
        lbl.font = [UIFont ct_fontWithName:@"PolarisMedium" size:16];
        lbl;
    });
    
    UILabel *boldLabel = ({
        UILabel *lbl = [[UILabel alloc] init];
        lbl.text = @"bold: qwertyuiopasdfghjklzxcvbnm";
        lbl.font = [UIFont ct_fontWithName:@"PolarisBold" size:16];
        lbl;
    });
    
    regularLabel.frame = CGRectMake(10, 100, 400, 20);
    meduimLabel.frame = CGRectMake(10, 200, 400, 20);
    boldLabel.frame = CGRectMake(10, 300, 400, 20);

    [self.view addSubview:regularLabel];
    [self.view addSubview:meduimLabel];
    [self.view addSubview:boldLabel];
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
