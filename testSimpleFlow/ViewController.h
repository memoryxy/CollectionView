//
//  ViewController.h
//  testSimpleFlow
//
//  Created by wangjianfei on 2020/4/8.
//  Copyright © 2020 wangjianfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, strong) UICollectionView *cv;

@end

