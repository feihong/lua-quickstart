# Feihong's Lua Quickstart

Note that you don't need to install Lua itself if you're only using it in LÖVE or PICO-8.

## Install

Lua

    asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git
    asdf install lua latest
    asdf global lua latest

LÖVE

- Download from https://love2d.org/
- Add `alias love="/Applications/love.app/Contents/MacOS/love"` to your `.zprofile`

PICO-8

After downloading and installing, you should add this alias to your `~/.zprofile`:

    alias pico="/Applications/PICO-8.app/Contents/MacOS/pico8"

## Commands

Run game

    love .

Load the poovaders cart in PICO-8

    pico-8 poovaders.p8

Copy .p8 cart files from their default location to the current directory:

    cp ~/Library/Application\ Support/pico-8/carts/*.p8 .

## Links

- [asdf-lua](https://github.com/Stratus3D/asdf-lua)
- [LÖVE Getting Started](https://love2d.org/wiki/Getting_Started)
- [How to LÖVE](https://sheepolution.com/learn/book/contents)
- [PICO-8 Education Edition](https://www.pico-8-edu.com/)
- [PICO-8 Manual and Tutorials](https://www.lexaloffle.com/pico-8.php?page=resources)
- [Links to tutorials and other resources from PICO-ATE](https://www.pico-ate.com/)
