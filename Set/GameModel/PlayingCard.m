//
//  PlayingCard.m
//  SetProject 12/08/2020
//
//  Created by Gal Berezansky on 05/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)otherCards{
    int score = 0;
    if([otherCards count] == 1){
        PlayingCard * otherCard = [otherCards firstObject];
        if(self.rank == otherCard.rank){
            score = 4;
        }
        else if([self.suit isEqualToString:otherCard.suit]){
            score = 1;
        }
    }
    else if([otherCards count] == 2){
        PlayingCard * otherCard1 = [otherCards firstObject];
        PlayingCard * otherCard2 = [otherCards objectAtIndex:1];
        if(self.rank == otherCard1.rank && self.rank == otherCard2.rank){
            score =6;
        }
        else if([self.suit isEqualToString: otherCard1.suit] && [self.suit isEqualToString:otherCard2.suit]){
            score = 4;
        }
        else if(self.rank == otherCard1.rank || self.rank == otherCard2.rank || otherCard1.rank == otherCard2.rank){
            score = 2;
        }
        else if([self.suit isEqualToString: otherCard1.suit] || [self.suit isEqualToString: otherCard2.suit] || [otherCard1.suit isEqualToString: otherCard2.suit]){
            score = 1;
        }
    }
    return score;
}

- (NSString *) description{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (NSString * ) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
@synthesize suit = _suit;

+ (NSArray * )validSuits
{
    return @[@"♥️" , @"♦️" , @"♠️" , @"♣️"];
}

-(void)setSuit:(NSString *) suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankStrings
{
    return  @[@"?" ,@"A",@"2" ,@"3" , @"4" , @"5" ,@"6" ,@"7" ,@"8",@"9",@"10",
                                @"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank
{
    return [[self rankStrings] count] - 1;
}

- (void) setRank:(NSUInteger)rank
{
    if(rank<= [PlayingCard maxRank]){
        _rank = rank;
    }
}


@end
