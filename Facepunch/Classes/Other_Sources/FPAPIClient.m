//
//  FPAPIClient.m
//  Facepunch
//
//  Created by Austin Louden on 10/19/12.
//  Copyright (c) 2012 atl101. All rights reserved.
//

#import "FPAPIClient.h"
#import "AFJSONRequestOperation.h"

static NSString * const kAFAppDotNetAPIBaseURLString = @"https://alpha-api.app.net/";

@implementation FPAPIClient

+ (FPAPIClient *)sharedClient {
    static FPAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[FPAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kAFAppDotNetAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end