#!/bin/bash

DATE=`date +%Y-%m-%d-%s`

backup_archive=$HOME/backups/$DATE.7z

tmp_directory=/tmp/backup_$DATE
git_directory=$tmp_directory/git

#
# Backup git repositories
#

while IFS= read -r repository
do
	repository_id=${repository/\//_}

	mkdir -p "$git_directory/$repository_id"
	git clone --mirror "https://github.com/$repository.git" "$git_directory/$repository_id"
	cd "$git_directory/$repository_id"
	git bundle create "../$repository_id.bundle" --all
	cd -
	rm -Rf "$git_directory/$repository_id"

done < "$HOME/Unison/Documents/comp/github_repos"

#
# 7zip the result
#

7z a -t7z -mx=9 -myx=9 $backup_archive ~/Unison $git_directory

#
# Remove temporary files
#

rm -Rfv $tmp_directory
