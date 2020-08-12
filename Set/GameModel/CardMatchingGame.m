//
//  CardMatchingGame.m
//  SetProject 12/08/2020
//
//  Created by Gal Berezansky on 06/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "CardMatchingGame.h"

#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4
#define COST_TO_CHOOSE 1
#define MATCH_MODE2P 2
#define MATCH_MODE3P 3
static NSString * MATCHED_FORMAT = @"Matched %@ for %d points."; //CONST OR NOT?
static NSString * NOT_MATCHED_FORMAT = @"%@ Don't match! %d penalty points."; //CONST OR NOT?

@interface CardMatchingGame()
@property (nonatomic , readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;
@property (nonatomic , strong) NSString * gameStringRep;
@end


@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if(self){
        self.cards = [[NSMutableArray alloc] init];
        for(NSUInteger i = 0 ; i < count ; i++){
            Card * card = [deck drawRandomCard];
            if(card) [self.cards addObject:card];
            else return nil; //if draw failed we would return nil
        }
        self.matchMode = MATCH_MODE2P;
        self.gameStringRep = @"";
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index]: nil;
}

-(NSString *) description;
{
    return self.gameStringRep;
}

- (void)updateGameByScore:(Card *)card  otherCards:(NSMutableArray *)otherCards {
    int matchScore = [card match:otherCards];
    NSLog(@"%d is match score" , matchScore);
    if(matchScore){
        self.gameStringRep = [NSString stringWithFormat:MATCHED_FORMAT , self.gameStringRep , matchScore * MATCH_BONUS]; // the string rep of a match
        self.score +=matchScore * MATCH_BONUS;
        card.matched = YES;
        for(Card * otherCard in otherCards){
            otherCard.matched = YES;
        }
    }
    else{
        self.gameStringRep = [NSString stringWithFormat:NOT_MATCHED_FORMAT, self.gameStringRep , MISMATCH_PENALTY]; //the string rep of not a match
        self.score -= MISMATCH_PENALTY;
        for(Card * otherCard in otherCards){
            otherCard.chosen = NO;
        }
    }
}

- (void) chooseCardAtIndex:(NSUInteger)index
{
    if([self.gameStringRep containsString:@"points"]){//if the string contains the word 'points' in it means that the last round ended with an outcome - i.e a match or not a match.
        self.gameStringRep = @"";
    }
    Card *card = [self cardAtIndex:index];
    if(card.chosen){
        card.chosen = NO;
        self.gameStringRep = [self.gameStringRep stringByReplacingOccurrencesOfString:[card description] withString:@""];//removes the unchoosen card from the string rep
        return;
    }
    NSMutableArray * otherCards = [NSMutableArray array];
    self.gameStringRep = [NSString stringWithFormat:@"%@%@" , [self description] ,[card description]];
    for(Card * otherCard in self.cards){//create the Array for the match method of Card
        if(otherCard.isChosen && !otherCard.isMatched){
            [otherCards addObject:otherCard];
            if(![self.gameStringRep containsString:otherCard.contents]){//if the card is choosen it should be in the game string rep
                 self.gameStringRep = [NSString stringWithFormat:@"%@%@" , [self description] ,[otherCard description]];
            }
        }
    }
    if([otherCards count] == self.matchMode - 1){
        NSLog(@"match");
    }
    if([otherCards count] == self.matchMode - 1){//if enough cards where choosen
        [self updateGameByScore:card otherCards:otherCards];
    }
    self.score-=COST_TO_CHOOSE;
    card.chosen = YES;
}


@end
