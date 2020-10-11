#include "test.h"

void    test_strcpy(char *des, char *src)
{
	char	*my_ret;
	char    *esp_ret;

	errno = 0;
	dprintf(1, "\033[1;36mExpected:\033[0m size= ");
	esp_ret = strcpy(des,src);
	dprintf(1, "%s|%-8p \033[1;31merrno\033[0m=%d\n", esp_ret, esp_ret, errno);
	errno = 0;
	dprintf(1, "\033[1;32mGot     :\033[0m size= ");
	my_ret = ft_strcpy(des, src);
	dprintf(1, "%s|%-8p \033[1;31merrno\033[0m=%d\n\n", my_ret, my_ret, errno);
}

void    tester_strcpy(void)
{
    char    des[22];
	print_head("ft-strcpy");
    test_strcpy(des, "0123456789");
    test_strcpy(des, "caractere\0null");
    test_strcpy(des, "");
    test_strcpy(des, "h\0hey");
    // test_strcpy(des, "loooooooooooooooooooooooooo\033\t\rooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong test");
}