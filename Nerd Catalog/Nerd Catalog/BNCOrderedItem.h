//
//  BNCOrderedItem.h
//  Nerd Catalog
//
//  Created by J. HOWARD SMART on 2/13/14.
//  Copyright (c) 2014 Jimmy Garg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNCCatalogItem.h"

@interface BNCOrderedItem : BNCCatalogItem

@property (nonatomic) NSInteger quantity;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *logo;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *size;

+(instancetype)orderedItemWithCatalogItem:(BNCCatalogItem *)item
                                 quantity:(NSInteger)qty
                        andCustomizations:(NSDictionary *)customizations;

+(NSArray *)JSONObjectFromOrderedItems:(NSArray *)orederedItems;

@end
