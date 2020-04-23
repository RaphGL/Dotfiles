for i in $(cat ~/dotfiles/.lists/extensions.list)
do
	code --install-extension $i
done
