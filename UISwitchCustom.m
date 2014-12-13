//
//  UISwitchCustom.m
//  switchTest
//
//  Created by wangsl-iMac on 14-10-17.
//  Copyright (c) 2014年 wangsl-iMac. All rights reserved.
//

#import "UISwitchCustom.h"

@implementation UISwitchCustom


-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        NSLog(@"Init OK");
        [self UIViewsInit];
    }
    
    return self;
}

-(void)UIViewsInit
{
    _on = YES;
    _contentview = [[UIView alloc]initWithFrame:self.bounds];
    _contentview.backgroundColor = [UIColor blackColor];
    _contentview.layer.cornerRadius = self.frame.size.height / 2.0;
    
    _contentview.layer.masksToBounds = YES;
    
    _ballview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height)];
    _ballview.backgroundColor = [UIColor yellowColor];
    _ballview.layer.cornerRadius = self.bounds.size.height / 2.0;
  
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTapTapGestureRecognizerEvent:)];
    [self addGestureRecognizer:tapGesture];
    
    [self addSubview:_contentview];
    [_contentview addSubview:_ballview];
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self setNeedsLayout];
}

-(void)setBounds:(CGRect)frame
{
    [super setBounds:frame];
    
    [self setNeedsLayout];
}

- (void)handleTapTapGestureRecognizerEvent:(UITapGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self SetOn:!_on Animat:YES];
    }
}

-(void)SetOn:(BOOL)on Animat:(BOOL)animat
{
    if (_on == on) {
        return;
    }
    
    _on = on;
    
    if (!on)
    {
        if (!animat)
        {
            _ballview.frame = CGRectMake(self.frame.size.width - _ballview.frame.size.width, _ballview.bounds.origin.y, _ballview.bounds.size.width, _ballview.bounds.size.height);
        }
        else
        {
            [UIView animateWithDuration:0.5
                             animations:^(void)
             {
                 _ballview.frame = CGRectMake(self.frame.size.width - _ballview.frame.size.width, _ballview.bounds.origin.y, _ballview.bounds.size.width, _ballview.bounds.size.height);
                 
                 
                 NSLog(@"contentview width: %f, self width :%f", _contentview.frame.size.width, self.frame.size.width);
             } completion:^(BOOL finsh)
             {
                 NSLog(@"finsh");
             }];
            
            [UIView animateWithDuration:0.5
                             animations:^(void)
             {
                 [UIView animateWithDuration:0.5
                                  animations:^(void)
                  {
                      _contentview.backgroundColor = [UIColor redColor];
                  }];
             } ];
        }
    }
    else
    {
        if (!animat)
        {
            _ballview.frame = CGRectMake(_ballview.bounds.origin.x, _ballview.bounds.origin.y, _ballview.bounds.size.width, _ballview.bounds.size.height);
        }
        else
        {
            [UIView animateWithDuration:0.5
                             animations:^(void)
             {
                    _ballview.frame = CGRectMake(_ballview.bounds.origin.x, _ballview.bounds.origin.y, _ballview.bounds.size.width, _ballview.bounds.size.height);
             } completion:^(BOOL finsh)
             {
                 NSLog(@"finsh");
                 //_contentview.backgroundColor = [UIColor blackColor];
                 [UIView animateWithDuration:0.5
                                  animations:^(void)
                  {
                      _contentview.backgroundColor = [UIColor blackColor];
                  }];
             }];
        }
    }
    
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _contentview.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height);
    
    NSLog(@"origin x: %f y: %f, frame: %f:%f", self.bounds.origin.x, self.bounds.origin.y, self.frame.origin.x, self.frame.origin.y);
    if ([self isOn]) {

        _ballview.frame = CGRectMake(_ballview.bounds.origin.x, _ballview.bounds.origin.y, _ballview.bounds.size.width, _ballview.bounds.size.height);
    }
    else
    {
        _ballview.frame = CGRectMake(self.frame.size.width - _ballview.frame.size.width, _ballview.bounds.origin.y, _ballview.bounds.size.width, _ballview.bounds.size.height);
    }
}

@end
