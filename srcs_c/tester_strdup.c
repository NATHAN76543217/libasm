#include "test.h"

void    test_strdup(const char *s)
{
	char	*my_ret;
	char    *esp_ret;

	errno = 0;
	dprintf(1, "\033[1;36mExpected:\033[0m |");
	esp_ret = strdup(s);
	dprintf(1, "%s| \033[1;31merrno\033[0m=%d\n", esp_ret, errno);
	free(esp_ret);

    errno = 0;
	dprintf(1, "\033[1;32mGot     :\033[0m |");
	my_ret = ft_strdup(s);
	dprintf(1, "%s| \033[1;31merrno\033[0m=%d\n\n", my_ret, errno);
    free(my_ret);
}

void    tester_strdup()
{
	print_head("ft-strdup");
	test_strdup("salut");
	test_strdup("SaLuT");
	test_strdup("\0sal");
	test_strdup("hey");
	test_strdup("h\0ey");
	test_strdup("");
}