//
//  Fed.h
//  MultiLanguages
//
//  Created by cuong minh on 12/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#ifndef __MultiLanguages__Fed__
#define __MultiLanguages__Fed__

#include <stdio.h>
class Rectangle {
    int width, height;
public:
    void set_values (int,int);
    int area() {return width*height;}
};


class CVector {
public:
    int x,y;
    CVector () {};
    CVector (int a,int b) : x(a), y(b) {}
    CVector operator + (const CVector&);
};
#endif /* defined(__MultiLanguages__Fed__) */
