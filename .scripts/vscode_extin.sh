for i in $(cat ~/dotfiles/.scripts/vscode_backup/extensions.list)
do
	code --install-extension $i
done
