#include "test.h"

void    test_strlen(char *phrase)
{
	int		my_ret;
	int		esp_ret;

	errno = 0;
	dprintf(1, "\033[1;36mExpected:\033[0m size= ");
	esp_ret = strlen(phrase);
	dprintf(1, "%-5d \033[1;31merrno\033[0m=%d\n", esp_ret, errno);
	errno = 0;
	dprintf(1, "\033[1;32mGot     :\033[0m size= ");
	my_ret = ft_strlen(phrase);
	dprintf(1, "%-5d \033[1;31merrno\033[0m=%d\n\n", my_ret, errno);
}

void    tester_strlen(void)
{
	print_head("ft-strlen");
    test_strlen("0123456789");
    test_strlen("caractere\0null");
    test_strlen("");
    test_strlen("h\0hey");
    test_strlen("loooooooooooooooooooooooooo\033\t\rooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong test");
}