//
//  PlayingCard.h
//  SetProject 12/08/2020
//
//  Created by Gal Berezansky on 05/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

///An implemantation of the Card abstract class.
@interface PlayingCard : Card

///A string representation of the suit (for example ♥️).
@property (strong , nonatomic) NSString *suit;

///An int representation of the rank.
@property (nonatomic) NSUInteger rank;

///Returns an array of all the valid suits
+ (NSArray *) validSuits;

///returns the max rank (all ranks from 1 to max rank are valid).
+ (NSUInteger) maxRank;

@end

NS_ASSUME_NONNULL_END
