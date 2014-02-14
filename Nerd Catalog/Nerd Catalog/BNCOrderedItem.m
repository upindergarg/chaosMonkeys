//
//  BNCOrderedItem.m
//  Nerd Catalog
//
//  Created by J. HOWARD SMART on 2/13/14.
//  Copyright (c) 2014 Jimmy Garg. All rights reserved.
//

#import "BNCOrderedItem.h"

@implementation BNCOrderedItem

+(instancetype)orderedItemWithCatalogItem:(BNCCatalogItem *)item
                                 quantity:(NSInteger)qty
                        andCustomizations:(NSDictionary *)customizations
{
    BNCOrderedItem *orderedItem = [[BNCOrderedItem alloc] init];
    orderedItem.name = item.name;
    orderedItem.basePrice = item.basePrice;
    orderedItem.imageURL = item.imageURL;
    orderedItem.customizations = customizations;
    orderedItem.quantity = qty;
    
    return orderedItem;
}

+(NSArray *)JSONObjectFromOrderedItems:(NSArray *)orederedItems
{
    return nil;
}

-(void)setText:(NSString *)text
{
    if (self.customizations[TEXT_KEY] != nil){
        NSMutableDictionary *newCust = [NSMutableDictionary dictionaryWithDictionary:self.customizations];
        newCust[TEXT_KEY] = text;
        self.customizations = [newCust copy];
    }
}

-(void)setLogo:(NSString *)logo
{
    if (self.customizations[LOGO_KEY] != nil){
        NSMutableDictionary *newCust = [NSMutableDictionary dictionaryWithDictionary:self.customizations];
        newCust[LOGO_KEY] = logo;
        self.customizations = [newCust copy];
    }
}

-(void)setColor:(NSString *)color
{
    if (self.customizations[COLOR_KEY] != nil){
        NSMutableDictionary *newCust = [NSMutableDictionary dictionaryWithDictionary:self.customizations];
        newCust[COLOR_KEY] = color;
        self.customizations = [newCust copy];
    }
}

-(void)setSize:(NSString *)size
{
    if (self.customizations[SIZES_KEY] != nil){
        NSMutableDictionary *newCust = [NSMutableDictionary dictionaryWithDictionary:self.customizations];
        newCust[SIZES_KEY] = size;
        self.customizations = [newCust copy];
    }
}

@end
