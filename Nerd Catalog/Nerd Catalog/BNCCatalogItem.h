//
//  BNCCatalogItem.h
//  Nerd Catalog
//
//  Created by J. HOWARD SMART on 2/13/14.
//  Copyright (c) 2014 Jimmy Garg. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TEXT_KEY @"text"
#define LOGO_KEY @"logo"
#define COLOR_KEY @"color"
#define SIZES_KEY @"sizes"

@interface BNCCatalogItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) double basePrice;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSDictionary *customizations;

+(NSArray *)catalogItemsFromJSON:(id)JSONObject;
+(id)JSONObjectFromCatalogItems:(NSArray *)items;

@end
