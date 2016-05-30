//
//  ViewController.m
//  EcommerceSDK
//
//  Created by Arpit Lokwani on 5/29/16.
//  Copyright © 2016 Arpit Lokwani. All rights reserved.
//

#import "ViewController.h"
#import "CategoryViewController.h"
#import "MenuView.h"
@interface ViewController ()
{
    MenuView * menu ;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     menu = [[MenuView alloc]initWithFrame:CGRectMake(0, 10, self.view.frame.size.width/2, 400)];
    [self.view addSubview:menu];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)MenuButtonClicked:(id)sender {
    
    
    

    CGRect inFrame = CGRectMake(0, 10, 0, 400);
    CGRect outFrame = CGRectMake(0, 10, self.view.frame.size.width/2, 400);
    
    if (self.viewisHidden) {
        self.viewisHidden = NO;
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             menu.frame = outFrame;
                         }
                         completion:^(BOOL finished){
                             NSLog(@"outFrame!");
                         }];
        

    } else {
        self.viewisHidden = YES;
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             menu.frame = inFrame;
                         }
                         completion:^(BOOL finished){
                             NSLog(@"inFrame!");
                         }];

    }
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    [UIView commitAnimations];
//    
    
//    [self addChildViewController:controller];
//    [controller didMoveToParentViewController:self];
}
@end
