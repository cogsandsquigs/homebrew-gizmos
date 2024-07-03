# Guide for maintainers

This is meant to be mostly a scratchpad for myself, as well as a guide for anyone who is maintaining this repository in the future.

## Testing a package locally.

Run

```
brew install --build-from-source --debug --verbose ./Formula/<package>.rb
```

## Updating a package

To update a package version, follow these steps:

### 1. Update the upstream URL

Firstly, update the URL the package pulls from (ideally you won't need to update the `install` or `test` section of the package itself). Get the new (updated version!) package URL.

> [!NOTE]
> If the package is in question an NPM package, the URL is (should be!) of the form `https://registry.npmjs.org/@cogsandsquigs/<package name>/-/<package name>-<version>.tgz`. Note that the package version is _without_ a `v` prefix.
> If the package is installed _directly_ from the git repository, the URL may be accompanied by a `tag` field. This is the tag of the repository to pull from. If the package is installed from a specific commit, the `tag` field should be removed and the `revision` field should be added. The `revision` field should be the first 7 characters of the commit hash.

The new URL should replace the `url` field in the formula file.

### 2. Update the upstream URL hash

The upstream URL hash used by Homebrew is a SHA256 hash of the package file. To get the hash, download the file from the new url you found in the previous step, and run:

```sh
sha256sum /path/to/downloaded/file
```

The output hash should replace the `sha256` field in the formula file.

### 3. Update the version in the formula

Edit the corresponding `.rb` file in the `Formula` directory and update the `version` field. For example, if the current `version` is `1.2.3` but the new URL/binary/package has `version` `1.2.4`, update it to `1.2.4`.

> [!NOTE]
> For some packages (like ones from NPM), the version is already in the URL, and does not need to be updated. Just by updating the URL and hash, the version is updated.

Ideally, the version in the formula should be the same as the version of the package. If the package version is `v1.2.4`, the version in the formula should be `1.2.4`.

### 4. Test the package locally

Test the package locally as described in [Testing a package locally](#testing-a-package-locally).

### 5. Commit and push the changes

Commit the changes and push them to the repository.
