# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nlecaill <nlecaill@student.le-101.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/07 15:11:52 by nlecaill          #+#    #+#              #
#    Updated: 2020/03/02 18:51:42 by nlecaill         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# ld -arch x86_64 -macosx_version_min 10.12.0 main.o ft_write.o -lSystem
# ./nasm -f macho64 -o ft_write.o srcs/ft_write.s 
# ./nasm -f macho64 -o main.o srcs/main.s && ./nasm -f macho64 -o ft_write.o srcs/ft_write.s && ld -o exec main.o ft_write.o && ./exec

.PHONY:	all clean fclean re

NAME		=	libasm.a

PATH_INC	=	includes

#C sources
PATH_SRC_C	=	srcs_c
SRC_LIST_C	=	main.c
PATH_OBJ_C	=	objs_c

#asm sources
SRC_LIST_S	= 	ft_write.s ft_strlen.s
PATH_SRC_S	=	srcs_s
PATH_OBJ_S	=	objs_s


INCS_LIST	= $(shell ls $(PATH_INC))
# libft.h libftenum.h libftgnl.h libftlst.h libftmaths.h libftmem.h libftnumbers.h libftprintf.h libftput.h libftstring.h libftcomplex.h libftendian.h

OBJS_C		=	$(addprefix $(PATH_OBJ_C)/, $(SRC_LIST_C:.c=.o))
OBJS_S		=	$(addprefix $(PATH_OBJ_S)/, $(SRC_LIST_S:.s=.o))
INCS		=	$(addprefix $(PATH_INC)/, $(INCS_LIST))

CC			=	gcc
INCLUDES	=	-I$(PATH_INC)
CFLAGS		=	-Wall -Wextra -Werror
C-O			=	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

SC			=	./nasm
INCLUDES	=	-I$(PATH_INC)
SFLAGS		=	-f macho64
S-O			=	$(SC) $(SFLAGS) $< -o $@

DIRS_LIST	=	$(shell ls -R srcs 2> /dev/null | grep / | cut -d / -f2-3 | cut -d : -f 1)
#mem put lists string utils gnl maths numbers ftprintf ftprintf/display ftprintf/lists complex endian

all: $(NAME)
	@ printf "\r                                                                                          \r"

$(NAME): $(OBJS_C) $(OBJS_S) $(INCS)
	@ ar -rcs $(NAME) $(OBJS_C) $(OBJS_S)

$(PATH_OBJ_C)/%.o: $(PATH_SRC_C)/%.c $(INCS)
	@ $(shell mkdir -p $(PATH_OBJ_C) $(addprefix $(PATH_OBJ_C)/, $(DIRS_LIST)))
	@ printf "\033[0;38;5;198mCompilation de \033[1m$< ..."
	@ $(C-O)
	@ printf "\r                                                                                          \r"

$(PATH_OBJ_S)/%.o: $(PATH_SRC_S)/%.s 
	@ $(shell mkdir -p $(PATH_OBJ_S) $(addprefix $(PATH_OBJ_S)/, $(DIRS_LIST)))
	@ printf "\033[0;38;5;198mCompilation de \033[1m$< ..."
	@ $(S-O)
	@ printf "\r                                                                                          \r"

clean:
	@ /bin/rm -rf $(PATH_OBJ_S) $(PATH_OBJ_C)
	
fclean: clean
	@ /bin/rm -f $(NAME) ./a.out
	@ printf "\033[0;38;5;160mSuppression de \033[1m$(NAME)/$(PATH_OBJ_C) ..."
	@ sleep 0.2
	@ printf "\r                                                                                          \r"
	@ printf "\033[0;38;5;160mSuppression de \033[1m$(NAME)/$(PATH_OBJ_S) ..."
	@ sleep 0.2
	@ printf "\r                                                                                          \r"
	@ printf "\033[0;38;5;160mSuppression de \033[1m$(NAME)/$(NAME) ..."
	@ sleep 0.2
	@ printf "\r                                                                                          \r"
	@ printf "\033[0;38;5;82mSuppression des fichiers de compilation reussis pour la \033[1m$(NAME).\n"

re: fclean all