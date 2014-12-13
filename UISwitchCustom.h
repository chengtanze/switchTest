//
//  UISwitchCustom.h
//  switchTest
//
//  Created by wangsl-iMac on 14-10-17.
//  Copyright (c) 2014年 wangsl-iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UISwitchCustom : UIControl



@property(nonatomic, retain) UIView *contentview;
@property(nonatomic, retain) UIView *ballview;

@property (nonatomic, strong) UIColor *onTintColor;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *thumbTintColor;

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, strong) NSString *onText;
@property (nonatomic, strong) NSString *offText;

@property(nonatomic, assign, getter = isOn) BOOL on;


@end
