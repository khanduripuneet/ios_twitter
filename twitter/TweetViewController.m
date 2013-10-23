//
//  TweetViewController.m
//  twitter
//
//  Created by Puneet Khanduri on 10/23/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "ComposeViewController.h"

@interface TweetViewController ()

@end

@implementation TweetViewController

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
    self.tweetText.text = self.tweet.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)retweetButton:(id)sender {
    [[TwitterClient instance] retweetWithTweet:self.tweet success:^(AFHTTPRequestOperation * operation, id response){
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Retweet" message:@"Retweeted Successfully" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
        
        
        
        [alert show];
        
        
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error){
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Retweet" message:@"We were unabel to retweet." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
        
        [alert show];
        
    }];
}

- (IBAction)favButton:(id)sender {
    [[TwitterClient instance] favWithTweet:self.tweet success:^(AFHTTPRequestOperation * operation, id response){
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Favorite" message:@"Favourite Successfully" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
        
        
        
        [alert show];
        
        
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error){
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Favorite" message:@"We were unable to favourite." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
        
        [alert show];
        
    }];
}

- (IBAction)replyButton:(id)sender {
    ComposeViewController * composeVC = [[ComposeViewController alloc] initWithNibName:@"ComposeViewController" bundle:nil];
    [composeVC setTweet:self.tweet];
    [[self navigationController] pushViewController:composeVC animated:YES];
}
@end
