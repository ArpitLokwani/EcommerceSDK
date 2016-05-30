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
    UITableView *tableView ;
    UIView *headerview;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//     menu = [[MenuView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width/2, self.view.frame.size.height-40)];
//    menu.layer.borderWidth = 1;
//    [self.view addSubview:menu];
    
     headerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    [self.view addSubview:headerview];
    headerview.backgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
    
    UIButton *menuButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 20, 20)];
    menuButton.backgroundColor = [UIColor redColor];
    [headerview addSubview:menuButton];
    [menuButton addTarget:self action:@selector(menuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    

    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 0, self.view.frame.size.height-60)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.layer.borderWidth = 0.5;
    tableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"Hello World";
    
    return cell;
}


- (void)menuButtonPressed:(id)sender {
    
    
    

    CGRect inFrame = CGRectMake(0, 60, 0, self.view.frame.size.height-60);
    CGRect outFrame = CGRectMake(0, 60, self.view.frame.size.width-self.view.frame.size.width/4, self.view.frame.size.height-60);
    
    if (self.viewisHidden) {
        self.viewisHidden = NO;
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                           //  menu.frame = outFrame;
                             tableView.frame = inFrame;

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
                            // menu.frame = inFrame;
                             tableView.frame = outFrame;

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
