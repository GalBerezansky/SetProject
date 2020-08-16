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

///A string representation of the shape (for example 🔺).
@property (strong , nonatomic) NSString * shape;

///An int representation of the number of shapes.
@property (nonatomic) NSUInteger numberOfShapes;

///A string representation of the shape (for example hollow).
@property (strong , nonatomic) NSString * shading;

///A string representation of the shape (for example red).
@property (strong , nonatomic) NSString * color;

///Returns an array of the valid shpaes available.
+(NSArray *) validShapes;

//Returns the maximum amount of shapes available
+(NSUInteger) maxAmountOfShapes;

///Returns an array of the valid shadings available.
+(NSArray *) validShadings;

///Returns an array of the valid colors available.
+(NSArray *) validColors;

@end

NS_ASSUME_NONNULL_END
