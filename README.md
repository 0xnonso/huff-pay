This project serves as my foray into learning the [Huff prgramming language](https://huff.sh)


## Getting Started

### Requirements

The following will need to be installed in order to run this project. Please follow the links and instructions.

-   [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)  
    -   You'll know you've done it right if you can run `git --version`
-   [Foundry / Foundryup](https://github.com/gakonst/foundry)
    -   This will install `forge`, `cast`, and `anvil`
    -   You can test you've installed them right by running `forge --version` and get an output like: `forge 0.2.0 (92f8951 2022-08-06T00:09:32.96582Z)`
    -   To get the latest of each, just run `foundryup`
-   [Huff Compiler](https://docs.huff.sh/get-started/installing/)
    -   You'll know you've done it right if you can run `huffc --version` and get an output like: `huffc 0.3.0`

### Quickstart

1. Clone this repo or use template

```
git clone https://github.com/0xnonso/huff-pay
cd huff-pay
```

2. Install dependencies

Once you've cloned and entered into your repository, you need to install the necessary dependencies. In order to do so, simply run:

```shell
forge install
```

3. Build & Test

To build and test your contracts, you can run:

```shell
forge build
forge test
```



## License

[The Unlicense](https://github.com/huff-language/huff-project-template/blob/master/LICENSE)


## Acknowledgements

- [forge-template](https://github.com/foundry-rs/forge-template)
- [femplate](https://github.com/abigger87/femplate)


## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk._