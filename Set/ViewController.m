//
//  ViewController.m
//  Matchismo
//
//  Created by Gal Berezansky on 05/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

#define MATCH_MODE2P 2
#define MATCH_MODE3P 3

@interface ViewController ()
@property (strong , nonatomic) CardMatchingGame * game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *redealButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchmodeControl;
@property (weak, nonatomic) IBOutlet UILabel *reultsLabel;
@end

@implementation ViewController

- (CardMatchingGame *)game
{
    if(!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]]; //couldnt initialize , used lazy initalizer.
    }
    return _game;
}

-(Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    _matchmodeControl.enabled = NO; //in the first touch of a card button we should disable the segment control.
    NSUInteger chooseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
    
}

- (IBAction)touchRedealButton:(UIButton * )sender{
    _matchmodeControl.enabled = YES;
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    self.game.matchMode = self.matchmodeControl.selectedSegmentIndex ? MATCH_MODE3P : MATCH_MODE2P;
    [self updateUI];
    
}


- (IBAction)segmentValueChanged:(id)sender {
    self.game.matchMode = self.matchmodeControl.selectedSegmentIndex ? MATCH_MODE3P : MATCH_MODE2P;
    //if the selected segment index is 0 it is 2 players match mode, otherwise its 3 players match mode.
}

- (void)updateCardButton:(UIButton *)cardButton {
    NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
    Card * card = [self.game cardAtIndex:cardButtonIndex];
    [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
    [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
    cardButton.enabled = !card.isMatched;

}

-(void) updateUI
{
    for(UIButton * cardButton in self.cardButtons){
        [self updateCardButton:cardButton];
    }
    self.reultsLabel.text =  [self.game description];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld" , self.game.score];
}

-(NSString *)titleForCard:(Card *) card{
    return card.isChosen ? card.description : @"";
}

-(UIImage *)backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end

//test1
