for i in $(cat ~/dotfiles/.scripts/lists/extensions.list)
do
	code --install-extension $i
done
