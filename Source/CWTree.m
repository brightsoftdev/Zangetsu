//
//  CWTree.m
//  Zangetsu
//
//  Created by Colin Wheeler on 7/12/11.
//  Copyright 2011. All rights reserved.
//

#import "CWTree.h"

@interface CWTreeNode()
@property(nonatomic, readwrite, retain) NSMutableArray *children;
@end

@implementation CWTreeNode

@synthesize value;
@synthesize children;
@synthesize parent;

-(id)init {
    self = [super init];
    if (self) {
        value = nil;
        children = [[NSMutableArray alloc] init];
        parent = nil;
    }
    
    return self;
}

-(id)initWithValue:(id)aValue {
    self = [super init];
    if (self) {
        value = aValue;
        children = [[NSMutableArray alloc] init];
        parent = nil;
    }
    
    return self;
}

-(void)addChild:(CWTreeNode *)node {
    [node setParent:self];
    [[self children] addObject:node];
}

-(void)removeChild:(CWTreeNode *)node {
    if ([[self children] containsObject:node]) {
        [node setParent:nil];
        [[self children] removeObject:node];
    }
}

-(BOOL)isEqualTo:(id)node {
    if ([node isMemberOfClass:[self class]]) {
        if ([[node value] isEqualTo:[self value]]) {
            if ([[node parent] isEqualTo:[self parent]]) {
                if ([[node children] isEqualTo:[self children]]) {
                    return YES;
                }
            }
        }
    }
    
    return NO;
}

-(BOOL)isNodeValueEqualTo:(id)node {
    if ([node isMemberOfClass:[self class]]) {
        if ([[node value] isEqualTo:[self value]]) {
            return YES;
        }
    }
    
    return NO;
}

@end

@implementation CWTree

@synthesize rootNode;

-(id)initWithRootNodeValue:(id)value {
    self = [super init];
    if (self) {
        CWTreeNode *aRootNode = [[CWTreeNode alloc] initWithValue:value];
        rootNode = aRootNode;
    }
    
    return self;
}

-(BOOL)isEqualTo:(id)tree {
    if ([tree isMemberOfClass:[self class]]) {
        if ([[[self rootNode] children] isEqualTo:[[tree rootNode] children]]) {
            return YES;
        }
    }
    
    return NO;
}

@end
