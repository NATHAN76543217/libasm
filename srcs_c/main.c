#include "test.h"

void	print_head(char *s)
{
	dprintf(1, "\033[0;38;5;198m************************************************************************\n");
	dprintf(1, "******%*s%*s******\n", (int)(30 + strlen(s) / 2), s, (int)(30 - strlen(s)/2), "");
	dprintf(1, "************************************************************************\033[0m\n\n");
}

int main()
{
	tester_write();
	tester_read();
	tester_strlen();
	tester_strcpy();
	tester_strcmp();
	tester_strdup();
	return (0);
}