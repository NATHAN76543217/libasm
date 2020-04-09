#include <string.h>

int ft_write();
unsigned long ft_strlen();

void    test_write(void)
{
	int		ret;
	char	*phrase = "Phrase ecrite avec ft_write\n";
	ft_write(1, "TEST ft_write:\n", 16);
	
	ret = ft_write(1, phrase, strlen(phrase));
	if (ret == (int)strlen(phrase))
		ft_write(1, "return value : success\n", 23);
	else
		ft_write(1, "return value : failed\n", 22);

}

void	test_strlen(void)
{
	int		ret;
	char	*phrase = "Phrase ecrite avec ft_write et ft_strlen\n";
	ft_write(1, "\nTEST ft_strlen\n", 16);
	
	ret = ft_write(1, phrase, ft_strlen(phrase));
	
	if (ft_strlen(phrase) == strlen(phrase))
		ft_write(1, "return value : success\n", 23);
	else
		ft_write(1, "return value : failed\n", 22);
	ft_write(1, "test chaine NULL: ", 18);
	if (ft_strlen(NULL) == 0)
		ft_write(1, "success\n", 8);
	else
		ft_write(1, "failed\n", 7);
	ft_write(1, "test chaine vide: ", 18);
	if (ft_strlen("") == 0)
		ft_write(1, "success\n", 8);
	else
		ft_write(1, "failed\n", 7);
}

int main()
{
	test_write();
	test_strlen();
	return (0);
}