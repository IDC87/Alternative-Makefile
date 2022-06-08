# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivda-cru <ivda-cru@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/07 17:15:26 by ivda-cru          #+#    #+#              #
#    Updated: 2022/06/07 17:18:35 by ivda-cru         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -*- Makefile -*-

CC =	gcc

FLAG =	-Wall -Wextra -Werror

L =		ar rc

RLIB =	ranlib

LFLAG =	-L libft/ -lft

NAME =	libftprintf.a

SRCS =	ft_printf.c\
		utils.c\
		hexs.c\
		getLen.c\
		libft_functions.c\
	

OBJS =	$(SRCS:.c=.o)

all: 	$(NAME)

frame:
		@mkdir $(FDIR)
		@echo "$(FDIR): has been created"

$(NAME): $(OBJS) $(LIB)
		@$(L) $(NAME) $(OBJS) $(LFTOB)
		@$(RLIB) $(NAME)
		@echo "$(NAME): has been created"

frame/%.o: %.c | frame
		@$(CC) $(FLAG) -c $< -o $@

$(LIB):
		@make re -C $(LFT)
		@echo "$(LFT): has been created"

clean:
		@rm -f $(OBJS)
		@rm -rf $(FDIR)
		@echo "$(FDIR) & $(OBJS): have been cleaned"

fclean:	clean
		@rm -f $(NAME)
		@echo "$(NAME) & $(LFT): have been cleaned"

re: fclean all

.PHONY: all clean fclean re