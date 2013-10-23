//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)tweetId {
    return [self.data valueOrNilForKeyPath:@"id_str"];
}
- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)name {
    return [self.data valueOrNilForKeyPath:@"user.name"];
}

- (NSString *)timestamp {
    return [self.data valueOrNilForKeyPath:@"created_at"];
}
- (UIImage *)profileImage {
    NSString * profileImageURL = [self.data valueOrNilForKeyPath:@"user.profile_image_url"];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: profileImageURL]];
    return [UIImage imageWithData: imageData];
}
+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}
- (NSString *)screenName {
    return [self.data valueOrNilForKeyPath:@"user.screen_name"];
}
@end
