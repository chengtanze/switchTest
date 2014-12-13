//
//  ViewController.m
//  switchTest
//
//  Created by wangsl-iMac on 14-10-17.
//  Copyright (c) 2014年 wangsl-iMac. All rights reserved.
//

#import "ViewController.h"
#import "UISwitchCustom.h"
@interface ViewController ()
{
    UISwitchCustom *CustomSwitch;
    UIButton *button;
}

 -(void)ValueChanged:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //[self CreateUISwitch];
    button = [[UIButton alloc]initWithFrame:CGRectMake(25, 25, 50, 25)];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    CustomSwitch = [[UISwitchCustom alloc]initWithFrame:CGRectMake(100, 50, 150, 50)];
    //pSwitch.backgroundColor = [UIColor blackColor];
    [CustomSwitch addTarget:self action:@selector(ValueChanged:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:CustomSwitch];
}

-(void)buttonClick:(id)sender
{
    NSLog(@"button click");
    //[CustomSwitch setBounds:CGRectMake(0, 0, 200, 100)];
    [CustomSwitch setFrame:CGRectMake(50, 50,200, 50)];
}

-(void)ValueChanged:(id)sender
{
    NSLog(@"ValueChanged:%D", [sender isOn]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)CreateUISwitch
{
    UISwitch *pSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    //[pSwitch setBackgroundColor:[UIColor blueColor]];
    [pSwitch setTintColor:[UIColor yellowColor]];
    pSwitch.onTintColor = [UIColor redColor];
    pSwitch.thumbTintColor = [UIColor blackColor];
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    view.layer.cornerRadius = 25;
    view.layer.masksToBounds = YES;
    
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    
    [self.view addSubview:pSwitch];
}

@end
