#include "test.h"

void    test_strcmp(const char*s1, const char *s2)
{
	int		my_ret;
	int		esp_ret;

	errno = 0;
	dprintf(1, "\033[1;36mExpected:\033[0m return= ");
	esp_ret = strcmp(s1, s2);
	dprintf(1, "%-5d \033[1;31merrno\033[0m=%d\n", esp_ret, errno);
	errno = 0;
	dprintf(1, "\033[1;32mGot     :\033[0m return= ");
	my_ret = ft_strcmp(s1, s2);
	dprintf(1, "%-5d \033[1;31merrno\033[0m=%d\n\n", my_ret, errno);

}

void    tester_strcmp()
{
	print_head("ft-strcmp");
	test_strcmp("salut", "salut");
	test_strcmp("salut", "sal");
	test_strcmp("sal", "salut");
	test_strcmp("hey", "h\0ey");
	test_strcmp("h\0ey", "hey");
}