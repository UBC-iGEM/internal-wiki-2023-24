# How to use Git and GitHub

<!-- toc -->

## How to use the internal wiki with Codespaces

1. If you haven't already opened a Codespace, open a new Codespace and **do not** hit anything while the Codespace starts up.
2. Once the Codespace is done downloading all the packages required, run `mdbook serve` to start up a local version of the internal wiki.
3. Now follow the instructions for [adding changes to GitHub](#adding-changes-to-github)

## Adding changes to GitHub

1. Open up the internal wiki on Codespaces or your local development environment.
2. Before you add any changes, run `git pull`. This ensures that your local version of the internal wiki is updated with other people's changes. If you don't do this step you make end up with merge conflicts. If running `git pull` results in merge conflicts (it shouldn't if you're always running `git pull`), let Lucy or a wiki liaison know.
3. Make a new branch `git branch [name-subteam-description]`. Then switch to that branch, `git checkout [name-subteam-description]`. Someone would run:

```git
git branch lucy-drylab-software
git checkout lucy-drylab-software
```

4. Now you can write your updates in!
5. When you are ready to publish your updates, you will need to save your files. In git, this is called making a commit. Git provides finer grain control, meaning you can choose which files to save in a project; most of the time you want to save all the files you have modified. Run `git add .`. This adds all modified and created files to the staging area.
6. Once you are satisfied with the files in the staging area, run `git commit -m "[message]"`. Replace `[message]` with a meaningful message related to your changes.
7. Finally, you can run `git push`. Make sure you are pushing to the UBC iGEM repo, if asked where to push, push to the repo with the link [https://github.com/UBC-iGEM/internal-wiki-2023-24]; you can push to your own fork, but please enable this [setting](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/allowing-changes-to-a-pull-request-branch-created-from-a-fork).
8. Following the prompts on Codespaces or the GitHub website, make a PR. That's it! Leads and wiki liaisons will check your content and approve and merge your PR.
 
## How to use the internal wiki with Replit

### How to run the internal wiki on Replit

<iframe src="https://scribehow.com/embed/Accessing_and_Editing_UBC-iGEM_Wiki_Page__28CL9QzYTb6sJZu4gRdm9w" width="100%" height="640" allowfullscreen frameborder="0"></iframe>

### How to push changes to internal wiki on Replit

<iframe src="https://scribehow.com/embed/Push_changes_to_Internal_Wiki_on_Replit_Step-by-Step_Guide__jItfj2-jSwCz9w1tIQNLTA" width="100%" height="640" allowfullscreen frameborder="0"></iframe>

## How to use mdBook locally

mdBook is an open source project developed by the Rust Foundation for documenting Rust packages. If you're running Windows, I recommend you get WSL. You can get started [here](https://rust-lang.github.io/mdBook/guide/installation.html). After you install Rust and mdbook, you need to install some other packages. Based on your operating system, follow the instructions for installing pandoc and graphviz. graphviz installation may not work, if so then skip adding this package. Then install these packages through cargo:

```
cargo install mdbook-linkcheck
cargo install mdbook-toc
cargo install mdbook-graphviz # if you couldn't install graphviz then don't run this line
cargo install mdbook-bibfile-referencing
```

