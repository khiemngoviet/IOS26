//
//  Bob.c
//  MultiLanguages
//
//  Created by cuong minh on 12/9/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#include "Bob.h"
#define SWP(x,y) (x^=y, y^=x, x^=y)

/* function returning the max between two numbers */
int cmax(int num1, int num2)
{
    /* local variable declaration */
    int result;
    
    if (num1 > num2)
        result = num1;
    else
        result = num2;
    
    return result;
}

char* returnCString() {
    return "Hello World";
}

void swapCString(char** s1, char** s2)
{
    char* temp = *s1;
    *s1 = *s2;
    *s2 = temp;
}
//http://stackoverflow.com/questions/198199/how-do-you-reverse-a-string-in-place-in-c-or-c

void strrev(char *p)
{
    char *q = p;
    while(q && *q) ++q; /* find eos */
    for(--q; p < q; ++p, --q) SWP(*p, *q);
}
void strrev_utf8(char *p)
{
    char *q = p;
    strrev(p); /* call base case */
    
    /* Ok, now fix bass-ackwards UTF chars. */
    while(q && *q) ++q; /* find eos */
    while(p < --q)
        switch( (*q & 0xF0) >> 4 ) {
            case 0xF: /* U+010000-U+10FFFF: four bytes. */
                SWP(*(q-0), *(q-3));
                SWP(*(q-1), *(q-2));
                q -= 3;
                break;
            case 0xE: /* U+000800-U+00FFFF: three bytes. */
                SWP(*(q-0), *(q-2));
                q -= 2;
                break;
            case 0xC: /* fall-through */
            case 0xD: /* U+000080-U+0007FF: two bytes. */
                SWP(*(q-0), *(q-1));
                q--;
                break;
        }
}
