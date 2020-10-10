#include "test.h"

void    test_write(int fd, char *phrase, int cnt)
{
	int		my_ret;
	int		esp_ret;

	errno = 0;
	dprintf(1, "\033[1;36mExpected:\033[0m |");
	esp_ret = write(fd, phrase, cnt);
	dprintf(1, "|%-5d \033[1;31merrno\033[0m=%d\n", esp_ret, errno);
	errno = 0;
	dprintf(1, "\033[1;32mGot     :\033[0m |");
	my_ret = ft_write(fd, phrase, cnt);
	dprintf(1, "|%-5d \033[1;31merrno\033[0m=%d\n\n", my_ret, errno);
}

void	tester_write(void)
{
	char	*phrase = "Phrase ecrite avec ft_write";
   
	print_head("ft-write");
    test_write(1, phrase, 27);
    test_write(1, "Caractere \0n\0u\0l\0l test :)", 25);
	test_write(12, phrase, 27);
	test_write(-3, "hey", 3);
	test_write(1, NULL, 1);
	test_write(1, "salut", 0);
	test_write(1, "salut", -1);
}
