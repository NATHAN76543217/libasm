#ifndef LIBASM_H
# define LIBASM_H

ssize_t			ft_write(int fd, const void *buf, unsigned long nbyte);
ssize_t			ft_read(int fd, void *buf, size_t count);
size_t			ft_strlen(const char *s);
char            *ft_strcpy(char *dst, const char *src);
char            *ft_strdup(const char *s);
int             ft_strcmp(const char *s1, const char *s2);
#endif  //LIBASM_H