//
//  CurrentGameState.h
//  Set
//
//  Created by Gal Berezansky on 13/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN


@interface CurrentGameState : NSObject

-(instancetype) initWithCards:(NSMutableArray *) cards;

///An array of the choosen and not matched cards
@property (nonatomic , strong) NSMutableArray<Card *> * cardsChoosenNotMatched;

///Returns true if the current set of cards matched , false otherwise
@property (nonatomic) BOOL didTheCardsMatched;

///holds the score that the current cards choosen gave.
@property (nonatomic) NSInteger currentRoundScore;

///update the current cards choosen and not matched
-(void) updateCurrentRoundGameCardsChoosen;

///update the current round score
-(void) updateCurrentRoundGameScore : (NSUInteger) currentScore;

@end

NS_ASSUME_NONNULL_END
