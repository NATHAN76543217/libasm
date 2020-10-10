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
#
# test main.c
# make re && ld -arch x86_64 -dynamic-linker /lib64/ld-linux-x86-64.so.2 -e main objs_c/main.o objs_s/ft_write.o objs_s/ft_strlen.o -lc && ./a.out

.PHONY:	all clean fclean re

NAME		=	libasm.a

#includes
PATH_INC	=	includes
INCS_LIST	=	$(shell ls $(PATH_INC))
INCS		=	$(addprefix $(PATH_INC)/, $(INCS_LIST))

T_PATH_INC  =	includes_test
T_INCS_LIST =	$(shell ls $(T_PATH_INC))
T_INCS		=	$(addprefix $(T_PATH_INC)/, $(T_INCS_LIST))

#C sources
PATH_SRC_C	=	srcs_c
SRC_LIST_C	=	$(shell ls $(PATH_SRC_C))
PATH_OBJ_C	=	objs_c
OBJS_C		=	$(addprefix $(PATH_OBJ_C)/, $(SRC_LIST_C:.c=.o))

#S sources
PATH_SRC_S	=	srcs_s
SRC_LIST_S	= 	$(shell ls $(PATH_SRC_S))
PATH_OBJ_S	=	objs_s
OBJS_S		=	$(addprefix $(PATH_OBJ_S)/, $(SRC_LIST_S:.s=.o))

#gcc compilation
CC			=	gcc
INCLUDES	=	-I$(T_PATH_INC) -I$(PATH_INC)
CFLAGS		=	-Wall -Wextra -Werror
C-O			=	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

#nasm compilation
SC			=	nasm
SFLAGS		=	-f elf64#-f macho64
S-O			=	$(SC) $(SFLAGS) $< -o $@

DIRS_LIST	=	$(shell ls -R srcs 2> /dev/null | grep / | cut -d / -f2-3 | cut -d : -f 1)

all: $(NAME) $(OBJS_C)
	@ printf "\r                                                                                          \r"
	@cc -o tester $(OBJS_C) $(NAME)

$(NAME): $(OBJS_S) $(INCS)
	@ ar -rcs $(NAME) $(OBJS_S)

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
	@ /bin/rm -f $(NAME) ./tester
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