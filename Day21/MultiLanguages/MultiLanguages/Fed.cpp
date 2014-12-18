//
//  Fed.cpp
//  MultiLanguages
//
//  Created by cuong minh on 12/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#include "Fed.h"

void Rectangle::set_values (int x, int y) {
    width = x;
    height = y;
}

CVector CVector::operator+ (const CVector& param) {
    CVector temp;
    temp.x = x + param.x;
    temp.y = y + param.y;
    return temp;
}