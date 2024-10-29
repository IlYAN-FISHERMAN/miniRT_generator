CC = cc

CFLAGS = -Wall -Werror -Wextra

RM = rm -rf

LIBFT_PATH = ./libs/libft/

LIBFT_LIB = $(LIBFT_PATH:%=%libft.a)

NAME = rt_generator.a

RT_GEN = ./src/

CFILES = $(FILES:%=%.c)

OFILES = $(FILES:%=%.o)

ALLCFILES = $(ALLFILES:%=%.c)

ALLOFILES = $(ALLFILES:%=%.o)

FILES += $(RT_GEN)rt_generate_nbr \
		 $(RT_GEN)rt_generate_scene \
		 $(RT_GEN)rt_generator \
		 $(RT_GEN)rt_generator_obj

all : $(NAME)

%.o : %.c
	@printf "\t⏳Compiling :3 $<...⌛️\r"
	@$(CC) $(CFLAGS) -c $< -o $@
	@printf "\33[2K"

$(NAME) : $(OFILES) $(LIBFT_LIB)
	@printf "\tcompiling...\r"
	@ar -rc $@ $(OFILES) $(LIBFT_LIB)
	@printf "\33[2K"
	@echo "\t$(NAME) compiled ✅"

clean :
	@echo "\n [$(NAME)] - Nettoyage fichier residuels... ♻️ "
	@$(RM) $(OFILES)

fclean : clean
	@echo "\n [$(NAME)] - supressions du reste... 🗑️"
	@echo ""
	@$(RM) $(NAME)

$(LIBFT_LIB): $(LIBFT_PATH)Makefile
	@make -C $(LIBFT_PATH) all

re :
	@make fclean
	@make all

.PHONY : clean fclean all re
