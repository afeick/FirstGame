//
//  GamePlay.m
//  FirstGame
//
//  Created by Anthony Feick on 2/18/11.
//  Copyright 2011 W3i. All rights reserved.
//

#import "GamePlay.h"
#import "PauseScene.h"
#import "GameOver.h"

enum {
	kTagHero,
	kTagEnemy
};

@implementation GamePlay


+(id) scene {

	// ‘scene’ is an autorelease object.
	CCScene *scene = [CCScene node];

	// ‘layer’ is an autorelease object.
	GamePlay *layer = [GamePlay node];

	// add layer as a child to scene
	[scene addChild: layer];

	// return the scene
	return scene;
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

	//convert touch to game coordinates
	UITouch *myTouch = [touches anyObject];
	CGPoint point = [myTouch locationInView:[myTouch view]];
	point = [[CCDirector sharedDirector] convertToGL:point];
	
	//move hero to new coords
	CCNode *hero = [self getChildByTag:kTagHero];
	[hero setPosition:point];
	
	//enemy moves toward new position
	CCNode *enemy = [self getChildByTag:kTagEnemy]; [enemy runAction:[CCMoveTo actionWithDuration:5.0 position:ccp(hero.position.x, hero.position.y)]];

}

-(void) pause: (id) sender {
	
	[[CCDirector sharedDirector] pushScene:[PauseScene node]];
}

-(void) SpritesDidColide {
	
	CCNode *enemy = [self getChildByTag:kTagEnemy];
	CCNode *hero = [self getChildByTag:kTagHero];
	
	float xDif = enemy.position.x - hero.position.x;
	float yDif = enemy.position.y - hero.position.y;
	float distance = sqrt(xDif * xDif + yDif * yDif);
	
	if (distance < 45) {
		[self unschedule:@selector(SpritesDidColide)];
		[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[GameOver node]]];
	}
	
}

-(id) init {

	if( (self=[super init] )) {

		//create and add pause button
		CCMenuItem *Pause = [CCMenuItemImage itemFromNormalImage:@"pausebutton.png" selectedImage: @"pausebutton.png" target:self selector:@selector(pause:)];
		CCMenu *PauseButton = [CCMenu menuWithItems: Pause, nil];
		PauseButton.position = ccp(25, 295);
		
		[self addChild:PauseButton z:1000];
				
		//add sprites
		CCSprite *hero = [CCSprite spriteWithFile:@"hero.png"];
		hero.position = ccp(60, 160);
		[self addChild:hero z:2 tag:kTagHero];
		
		CCSprite *enemy = [CCSprite spriteWithFile:@"enemy.png"];
		enemy.position = ccp(440, 160);
		[self addChild:enemy z:1 tag:kTagEnemy];
		
		//make the enemy move to the hero
		[enemy runAction:[CCMoveTo actionWithDuration:5.0 position:ccp(hero.position.x, hero.position.y)]];
		
		//enable touch support
		self.isTouchEnabled = YES;
		
		//detect collisions
		[self schedule:@selector(SpritesDidColide) interval:.01];
		
	}

	return self;
}

@end
