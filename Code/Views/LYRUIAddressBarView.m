//
//  LYRUIAddressBarView.m
//  Atlas
//
//  Created by Kevin Coleman on 10/30/14.
//  Copyright (c) 2015 Layer. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
#import "LYRUIAddressBarView.h"
#import "LYRUIConstants.h"

@interface LYRUIAddressBarView ()

@property (nonatomic) UIView *bottomBorder;

@end

@implementation LYRUIAddressBarView

- (id)init
{
    self = [super init];
    if (self) {
        [self lyr_commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self lyr_commonInit];
    }
    return self;
}

- (void)lyr_commonInit
{
    _addressBarTextView = [[LYRUIAddressBarTextView alloc] init];
    _addressBarTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _addressBarTextView.translatesAutoresizingMaskIntoConstraints = NO;
    _addressBarTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    [_addressBarTextView sizeToFit];
    [self addSubview:_addressBarTextView];
    
    _addContactsButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    _addContactsButton.translatesAutoresizingMaskIntoConstraints = NO;
    _addContactsButton.tintColor = LYRUIBlueColor();
    [self addSubview:_addContactsButton];
    
    _bottomBorder = [[UIView alloc] init];
    _bottomBorder.translatesAutoresizingMaskIntoConstraints = NO;
    _bottomBorder.backgroundColor = LYRUIGrayColor();
    [self addSubview:_bottomBorder];
    
    [self configureAddressBarTextViewConstrants];
    [self configureAddContactsButtonConstraints];
    [self configureBottomBorderConstraints];
}

- (void)configureAddressBarTextViewConstrants
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_addressBarTextView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-40]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_addressBarTextView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_addressBarTextView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
}

- (void)configureAddContactsButtonConstraints
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_addContactsButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_addressBarTextView attribute:NSLayoutAttributeRight multiplier:1.0 constant:8]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_addContactsButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:6]];
}

- (void)configureBottomBorderConstraints
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_bottomBorder attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_bottomBorder attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-0.5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_bottomBorder attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_bottomBorder attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
}

@end
