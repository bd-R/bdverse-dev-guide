# Continuous Integration (CI) {#ci}

## What is CI?
Work in progress.

If you know that you want Travis CI to skip a build (e.g., you’ve just edited the ReadMe file), include [ci skip] or [skip ci] anywhere in the commit message.

You can skip to `build` in Travis CI by putting keywords `[skip ci]` or `[ci skip]` in your commit messages. This can be used when doing minor changes such as fixing a typo in documentation,etc.

### tic

#### Installation with R Studio.

`remotes::install_github("ropensci/tic")`


then  A `GITHUB_PAT` needs to be set to create the
  SSH key pair required for deployment on
  GitHub Actions. Please call
  `usethis::browse_github_pat()`, follow the
  instructions and then call `use_tic()`
  again.
  
run `usethis::browse_github_pat()` This will open your github tokens page,may ask for your password. 
Generate the token with default settings provided and copy the token.
Now run `usethis::edit_r_environ()`. This will open `.Renviron` file of your project and 
now write `GITHUB_PAT=you_token_key_here`. Make sure you add an empty new line below that line. Save the file. Restart R for changes to take place.


#### for new user of tic 

Run `tic::use_tic()`

If you already use tic and want to configure a new CI provider do the following

#### For GitHub Actions 

```r
tic::use_ghactions_deploy() # (optional for deployment)
```

```
## i Querying GitHub deploy keys from repo.
```

```
## √ Setting active project to 'C:/Users/tomer/Google Drive/repo-repo/bdverse-dev-guide@tom-gu'
```

```
## > Deploy keys for GitHub Actions already present. No action required.
```

```r
tic::use_ghactions_yml() # optional: Change `type` arg to your liking
```

```
## i Please comment in/out the platforms you want to use in
##   .github/workflows/tic.yml.
```

```
## Call `usethis::edit_file('.github/workflows/tic.yml')` to
## open the YAML file.
```

```
## i Writing .github/workflows/tic.yml.
```

```
## v Below is the file structure of the new/changed files:
## bdverse-dev-guide@tom-gu
## \-.github
##   \-workflows
##     \-tic.yml
```

```r
cat(tic::use_tic_r("package", deploy_on = "ghactions"))
```

```
## 
```

```
## -- tic.R --
```

```
## 
```

```
## √ Leaving 'tic.R' unchanged
```

```
## FALSE
```


```r
# (all of the above in one call)
tic::use_tic(wizard = FALSE, linux = "ghactions", mac = "ghactions",
windows = "ghactions", matrix = "ghactions", deploy = "ghactions")
```

```
## > Welcome to tic!
```

```
## 
```

```
## -- Introduction: -------------------------------------------
```

```
## tic currently comes with support for four CI providers:
```

```
## * Appveyor
```

```
## * Circle CI
```

```
## * Travis CI
```

```
## * GitHub Actions
```

```
## There is no need to use all of them. You can choose which
## one(s) you want to use, whether you want to deploy (i.e.
## push from builds) and if you want to test on multiple R
## versions.
```

```
## 
```

```
## We recommend the following setup:
```

```
## * Travis CI: Linux
```

```
## * Travis CI: macOS
```

```
## * Appveyor: Windows
```

```
## 
```

```
## -- Setting up the CI providers -----------------------------
```

```
## Next we are getting the selected CI providers ready for
## deployment. This requires some interaction with their API
## and you may need to create an API token.
```

```
## 
```

```
## i Querying GitHub deploy keys from repo.
```

```
## > Deploy keys for GitHub Actions already present. No action required.
```

```
## 
```

```
## -- Creating YAML files... ----------------------------------
```

```
## 
```

```
## -- Travis CI --
```

```
## 
```

```
## <U+221A> OK
```

```
## 
```

```
## -- Circle CI --
```

```
## 
```

```
## <U+221A> OK
```

```
## 
```

```
## -- Appveyor CI --
```

```
## 
```

```
## <U+221A> OK
```

```
## 
```

```
## -- GitHub Actions --
```

```
## 
```

```
## i Please comment in/out the platforms you want to use in
##   .github/workflows/tic.yml.
```

```
## Call `usethis::edit_file('.github/workflows/tic.yml')` to
## open the YAML file.
```

```
## i Writing .github/workflows/tic.yml.
```

```
## v Below is the file structure of the new/changed files:
## bdverse-dev-guide@tom-gu
## \-.github
##   \-workflows
##     \-tic.yml
```

```
## 
```

```
## <U+221A> OK
```

```
## 
```

```
## -- tic.R --
```

```
## 
```

```
## √ Leaving 'tic.R' unchanged
```

```
## * Done! Thanks for using tic.
```

```
## i Consider also to take a look at `tic::use_update_tic()` to update
##   your GHA YAML file via GHA. This way, your template always gets
##   updated automatically with new template changes.
```

```r
tic::use_tic_badge("ghactions")
```

```
## Warning: Multiple github remotes found. Using origin.
```

```r
tic::use_update_tic()
```

```
## > Added new file:
```

```
## bdverse-dev-guide@tom-gu
## \-.github
##   \-workflows
##     \-update-tic.yml
```

```
## i Note that you need to add a secret with 'workflow' scopes named
##   `TIC_UPDATE` to your repo to make this automation work. You can use
##   `tic::gha_add_secret(<secret>, 'TIC_UPDATE')` for this.
```

You can use `usethis::edit_file('.github/workflows/tic.yml')` to edit the tic file and comment out platforms.
## Why we need it?

## `bdverse` CI strategy

# GitHub Actions {#github-actions}
🚧 **Under Construction** 🚧

## File Sync System {#file-sync}
https://github.com/marketplace/actions/file-sync
