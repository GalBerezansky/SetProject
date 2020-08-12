//
//  ViewController.m
//  Matchismo
//
//  Created by Gal Berezansky on 05/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "ViewController.h"


#define MATCH_MODE2P 2
#define MATCH_MODE3P 3

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *redealButton;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *matchmodeControl;
@property (weak, nonatomic) IBOutlet UILabel *reultsLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    [self updateUI];
}

-(Deck *) createDeck //Abstract Method
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger chooseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
    
}

- (IBAction)touchRedealButton:(UIButton * )sender{
    [self viewDidLoad];
    
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

-(NSString *)titleForCard:(Card *) card{ //abstract
    return nil;
}

-(UIImage *)backgroundImageForCard:(Card *) card //abstract
{
    return nil;
}

@end

//test1
