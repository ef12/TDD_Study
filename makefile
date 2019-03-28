PROD_DIR := ./prod
TDD_DIR := ./tdd

.PHONY: tdd prod tdd_clean prod_clean

tdd: prod
	make -C $(TDD_DIR)
prod:
	make -C $(PROD_DIR)

tdd_clean:
	make -C $(TDD_DIR) clean
prod_clean:
	make -C $(PROD_DIR) clean

all: prod tdd

clean: tdd_clean prod_clean
