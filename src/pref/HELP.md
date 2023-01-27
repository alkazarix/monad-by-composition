# Help

## Running the tests

To run the test suite, execute the following command:

```bash
stack test
```

#### If you get an error message like this...

```
No .cabal file found in directory
```

or

```
RedownloadInvalidResponse Request {
...
}
 "/home/username/.stack/build-plan/lts-xx.yy.yaml" (Response {responseStatus = Status {statusCode = 404, statusMessage = "Not Found"},
```

You are probably running an old stack version and need
to upgrade it. Try running:

```bash
stack upgrade
```

Or see other options for upgrading at [Stack documentation](https://docs.haskellstack.org/en/stable/install_and_upgrade/#upgrade).

#### Otherwise, if you get an error message like this...

```
No compiler found, expected minor version match with...
Try running "stack setup" to install the correct GHC...
```

Just do as it says and it will download and install
the correct compiler version:

```bash
stack setup
```

If you want to play with your solution in GHCi, just run the command:

```bash
stack ghci
```
