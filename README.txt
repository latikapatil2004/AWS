Shell Scripting + Git Branch Automation Workshop

Files:
- first-script.sh       Basic Bash commands
- welcome.sh            Demonstrates first argument ($1)
- student.sh            Demonstrates $0, $1, $2 and $#
- create-gitignore.sh   Creates .gitignore only when missing
- create-branches.sh   Validates input/repository, creates backup and working branch
- git-save-push.sh     Stages, reviews, commits, and optionally pushes changes

Run scripts from Git Bash or Linux terminal. Example:
  bash first-script.sh
  bash welcome.sh Rahul
  bash student.sh Rahul DevOps
  bash create-gitignore.sh
  bash create-branches.sh CPD-1234 feature
  bash git-save-push.sh "CPD-1234: fix validation" --gitignore

Important:
- Test branch and commit scripts in a disposable repository first.
- create-branches.sh requires a clean working tree and creates local branches only.
- git-save-push.sh stages all changes in the repository with git add --all. Review the staged diff carefully before confirming the commit.
- The optional --gitignore argument creates a sample .gitignore only if one does not already exist. Review the rules for your project.
- Push requires an origin remote and appropriate permissions.
