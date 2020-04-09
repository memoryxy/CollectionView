//
//  YXYoulikeBaseCell.h
//  testSimpleFlow
//
//  Created by wangjianfei on 2020/4/8.
//  Copyright © 2020 wangjianfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXYoulikeBaseCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, weak) ViewController *delegate;
@property (nonatomic, strong) NSIndexPath *ip;

@end

NS_ASSUME_NONNULL_END
