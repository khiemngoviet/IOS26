//
//  Bob.h
//  MultiLanguages
//
//  Created by cuong minh on 12/9/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#ifndef __MultiLanguages__Bob__
#define __MultiLanguages__Bob__

#include <stdio.h>

#endif /* defined(__MultiLanguages__Bob__) */
int cmax(int num1, int num2);
char* returnCString();

void strrev(char *p);
void strrev_utf8(char *p);

void swapCString(char** s1, char** s2);
struct Book
{
    char* title;
    int   book_id;
};