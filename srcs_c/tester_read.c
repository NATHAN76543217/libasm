#include "test.h"

void    test_read(int fd1, int fd2, char *phrase, int cnt)
{
	int		my_ret;
	int		esp_ret;

	errno = 0;
	dprintf(1, "\033[1;36mExpected:\033[0m |");
	esp_ret = read(fd1, phrase, cnt);
	dprintf(1, "%s|%-5d \033[1;31merrno\033[0m=%d\n", phrase, esp_ret, errno);
	errno = 0;
	dprintf(1, "\033[1;32mGot     :\033[0m |");
	my_ret = ft_read(fd2, phrase, cnt);
	dprintf(1, "%s|%-5d \033[1;31merrno\033[0m=%d\n\n", phrase, my_ret, errno);
}

void	tester_read(void)
{
	char	*phrase;
	int     fd1;
	int		fd2;

	print_head("ft-read");
	if ((fd1 = open("tester_orig.txt", O_RDONLY)) != -1)
	{
		if ((fd2 = open("tester.txt", O_RDONLY)) != -1)
		{
			if ((phrase = malloc(30 * sizeof(char))) != NULL)
			{
				test_read(fd1, fd2, phrase, 27);
				bzero(phrase, 30);
				test_read(fd1, fd2, "Caractere \0n\0u\0l\0l test :)", 25);
				test_read(12, 12, phrase, 27);
				test_read(-3, -3, "hey", 3);
				test_read(fd1, fd2, NULL, 1);
				test_read(fd1, fd2, "salut", 0);
				test_read(fd1, fd2, phrase, 1);
				test_read(fd1, fd2, "salut", -1);
				return;
			}
		}
	}
	dprintf(1, "TESTER ERROR!!!!\n\n");
	return ;
}
