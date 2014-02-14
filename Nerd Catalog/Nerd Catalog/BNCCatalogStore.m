//
//  BNCCatalogStore.m
//  Nerd Catalog
//
//  Created by Jimmy Garg on 2/13/14.
//  Copyright (c) 2014 Jimmy Garg. All rights reserved.
//

#import "BNCCatalogStore.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface BNCCatalogStore ()

@property (nonatomic, strong) id data;

@end

@implementation BNCCatalogStore

-(id) getData:(NSURL *) url {
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
                                         initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Completed: %@", responseObject);
        _data = responseObject;
    } failure:nil];
    
    [operation start];
    return _data;
}

-(id)getCatalog {
    
    NSURL *url = [NSURL URLWithString:@"http://bnr-fruititems.appspot.com/"];
    return [self getData:url];
}

-(id) getOrderStatus {
    
    NSURL *url = [NSURL URLWithString:@"http://bnr-fruititems.appspot.com/status"];
    return [self getData:url];

}

-(id) getHistory {
    NSURL *url = [NSURL URLWithString:@"http://bnr-fruititems.appspot.com/history"];
    return [self getData:url];

}

@end
