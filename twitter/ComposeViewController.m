//
//  ComposeViewController.m
//  twitter
//
//  Created by Puneet Khanduri on 10/23/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.tweet != Nil) {
        
        self.tweetMessage.text = [NSString stringWithFormat:@"@%@ ",self.tweet.screenName ];
        [self.sendButton setTitle:@"Reply" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendTweet:(id)sender {
    if (self.tweet == Nil) {
    [[TwitterClient instance] composeWithText:self.tweetMessage.text success:^(AFHTTPRequestOperation * operation, id response){
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Tweet" message:@"Tweeted Successfully" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
        
        
        
        [alert show];
        
        
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error){
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Tweet" message:@"We were unable to tweet." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
        
        [alert show];
        
    }];
    } else{
        [[TwitterClient instance] replyToTweet:self.tweet withText:self.tweetMessage.text success:^(AFHTTPRequestOperation * operation, id response){
            
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Reply" message:@"Replied Successfully" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
            
            
            
            [alert show];
            
            
            
        } failure:^(AFHTTPRequestOperation * operation, NSError * error){
            
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Reply" message:@"We were unable to reply." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
            
            [alert show];
            
        }];
    }
    
}
@end
