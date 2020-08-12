//
//  SetCard.h
//  SetProject 12/08/2020
//
//  Created by Gal Berezansky on 11/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//
//
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetCard : Card

@property (strong , nonatomic) NSString * shape;
@property (nonatomic) NSUInteger numberOfShapes;
@property (strong , nonatomic) NSString * shading;
@property (strong , nonatomic) NSString * color;

+(NSArray *) validShapes;
+(NSUInteger) maxAmountOfShapes;
+(NSArray *) validShadings;
+(NSArray *) validColors;

@end

NS_ASSUME_NONNULL_END
