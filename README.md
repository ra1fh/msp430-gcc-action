# MSP430 GCC Action

This action uses a Docker container with TI's MSP430 GCC compiler
installed in /root/ti/msp430-gcc and runs cmake and make in the
working directory with environment MSP430_TI pointing to the compiler
installation directory.

## Example usage

uses: ra1fh/msp430-gcc-action@v1
