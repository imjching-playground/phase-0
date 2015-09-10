##How does tracking and adding changes make developers' lives easier?
It makes it easier to understand other people's contributions and also to pinpoint the exact addition that changed or broke the program.

##What is a commit?
A commit is a saved snapshot of the code.

##What are the best practices for commit messages?
Present tense, imperative, roughly 50 characters max. Should be concise and descriptive.

##What does the HEAD^ argument mean?
Refers to the previous commit (before the current one).

##What are the 3 stages of a git change and how do you move a file from one stage to the other?
untracked > added > committed > pushed
First, you add the file to the list of tracked files. Then you commit it. When all the desired changes have been committed, you push to the repo.

##Write a handy cheatsheet of the commands you need to commit your changes?
add [filename], commit [filename], push origin [branch-name]

##What is a pull request and how do you create and merge one?
After you push an update to the branch on GitHub, you can create a pull request on GitHub (it will prompt you or you can go to the "Pull Requests" area). After you approve the pull request, you can merge the branch with the master and delete. Then you can delete the branch.

##Why are pull requests preferred when working with teams?
It provides some oversight when contributors are making changes. Otherwise, people could just unilaterally change things which can cause bugs and conflicts with other people's contributions.