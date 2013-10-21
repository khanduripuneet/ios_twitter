//
//  Tweet.h
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : RestObject

@property (nonatomic, weak, readonly) NSString *text;
@property (nonatomic, weak, readonly) NSString *name;
@property (nonatomic, weak, readonly) UIImage *profileImage;
@property (nonatomic, weak, readonly) NSString *timestamp;

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;

@end
