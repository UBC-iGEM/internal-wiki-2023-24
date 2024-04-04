# How to use Git and GitHub

<!-- toc -->

## How to add changes to the internal wiki with Codespaces

1. If you haven't already opened a Codespace, open a new Codespace, otherwise, you can reuse the Codespace you already have open.
1. Open up the internal wiki on Codespaces.
2. Before you add any changes, run `git pull`. This ensures that your local version of the internal wiki is updated with other people's changes. If you don't do this step you make end up with merge conflicts. If running `git pull` results in merge conflicts (it shouldn't if you're always running `git pull`), let Lucy or a wiki liaison know.
3. Make a new branch `git branch [name-subteam-description]`. Then switch to that branch, `git checkout [name-subteam-description]`. Someone would run:

```git
git branch lucy-drylab-software
git checkout lucy-drylab-software
```

4. Make your changes in markdown; make sure to preview to ensure your edits are properly formatted.
5. When you are ready to publish your updates, you will need to save your files. In git, this is called making a commit. Git provides finer grain control, meaning you can choose which files to save in a project; most of the time you want to save all the files you have modified. Run `git add .`. This adds all modified and created files to the staging area.
6. Once you are satisfied with the files in the staging area, run `git commit -m "[message]"`. Replace `[message]` with a meaningful message related to your changes.
7. Finally, you can run `git push`. Make sure you are pushing to the UBC iGEM repo, if asked where to push, push to the repo with the link [https://github.com/UBC-iGEM/internal-wiki-2023-24]; you can push to your own fork, but please enable this [setting](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/allowing-changes-to-a-pull-request-branch-created-from-a-fork).
8. Following the prompts on Codespaces or the GitHub website, make a PR. That's it! Leads and wiki liaisons will check your content and approve and merge your PR.
 
## How add changes to the internal wiki with Replit

### How to run the internal wiki on Replit

<iframe src="https://scribehow.com/embed/Accessing_and_Editing_UBC-iGEM_Wiki_Page__28CL9QzYTb6sJZu4gRdm9w" width="100%" height="640" allowfullscreen frameborder="0"></iframe>
### How to push changes to internal wiki on Replit

<iframe src="https://scribehow.com/embed/Push_changes_to_Internal_Wiki_on_Replit_Step-by-Step_Guide__jItfj2-jSwCz9w1tIQNLTA" width="100%" height="640" allowfullscreen frameborder="0"></iframe>

## How to use mdBook locally
If you want to have the full functionality of mdbook, please ask Lucy for instructions on local installation.
