//
//  BNCCatalogItem.m
//  Nerd Catalog
//
//  Created by J. HOWARD SMART on 2/13/14.
//  Copyright (c) 2014 Jimmy Garg. All rights reserved.
//

#import "BNCCatalogItem.h"

@interface BNCCatalogItem()

@end

@implementation BNCCatalogItem

-(instancetype)initWithCatalogItemDictionary:(NSDictionary *)dict
{
    if (self = [super init]){
        self.name = dict[@"name"];
        self.basePrice = [dict[@"basePrice"] doubleValue];
        self.imageURL = [NSURL URLWithString: dict[@"image"]];
        self.customizations = dict[@"customizations"];
    }
    return self;
}

+(NSArray *)catalogItemsFromJSON:(id)JSONObject
{
    NSError *err;
    NSArray *catArray = [NSJSONSerialization JSONObjectWithData:JSONObject options:0 error:&err];
    if (err || ![catArray isKindOfClass:[NSArray class]]){
        NSLog(@"Error deserializing JSON data.");
    }
    NSMutableArray *result = [NSMutableArray array];
    for (NSDictionary *dict in catArray){
        BNCCatalogItem *item = [[BNCCatalogItem alloc ]initWithCatalogItemDictionary:dict];
        [result addObject:item];
    }
    return result;
}

+(id)JSONObjectFromCatalogItems:(NSArray *)items
{
    if (![NSJSONSerialization isValidJSONObject:items]){
        NSLog(@"Invalid object passed in for JSON serialization.");
        return nil;
    }
    NSError *err;
    NSData *JSONObject = [NSJSONSerialization dataWithJSONObject:items options:0 error:&err];
    if (err){
        NSLog(@"Error creating JSON object from: %@", [err localizedDescription]);
    }
    return JSONObject;
}

@end
