all: README.md

README.md:
	touch README.md
	echo "# Bash, Make, Git, and GitHub" > README.md
	echo `date` >> README.md
	echo `wc -l guessinggame.sh | egrep -o ^[0-9]+` >> README.md

clean:
	rm README.md
