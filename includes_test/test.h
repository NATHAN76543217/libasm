#ifndef TEST_H
#define TEST_H

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>

#include "libasm.h"

void    print_head(char *s);
void    tester_write(void);
void    tester_read(void);
void    tester_strlen(void);
void    tester_strcpy(void);
void    tester_strcmp(void);
void    tester_strdup(void);
#endif //TEST_H