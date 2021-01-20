# About

Base structure for my taste,
by using deepnights tutorials and gameBase.

# Setup
## Tools/Frameworks
- [**GameBase**](https://github.com/deepnight/gameBase)
- [**Heaps**](https://heaps.io)
- [**HashLink**](https://hashlink.haxe.org/#download)
- [**Haxe**](https://haxe.org)
- [**VSCode extension**](https://marketplace.visualstudio.com/items?itemName=vshaxe.haxe-extension-pack)
- [**VSCode**](https://code.visualstudio.com/)
## Dependencies
Package | Command
--- | ---
deepnightLibs | `haxelib git deepnightLibs https://github.com/deepnight/deepnightLibs.git`
Castle | `haxelib git castle https://github.com/ncannasse/castle.git`
ldtk-haxe-api | `haxelib install ldtk-haxe-api`
redistHelper | `haxelib install redistHelper`

# Usage
If you use the vscode extension, you have a bar to the lower left saying Haxe, the property to the right of that can be changed, I use hl.debug.hxml, I use windows for development right now so I only know that it works on that (and its configured to use directx version so that is a reason).

when you have the right config, press `F5` (sometimes try twice... for some reason)

## preLaunchTasks

since I use [Aseprite](https://www.aseprite.org/) to handle my graphics, I made tasks:
1. combine all `.aseprite` files in `art` directory to `res/atlas`, this in turn creates two files, atlas.png, atlas.json
2. convert `atlas.json` to `atlas.atlas` since GameBase cant handle a `.json` atlas.

this is run everytime you start the project.

## start coding

when you're going to start coding your own game I usually overwrite existing function or classes to hide all code that I feel is unnessesary to have in my part of the code, simplify since Im not the smartest, less code to read means less to get overwhelmed with.

thats why I tried to move all code that deepnight wrote into its own folder.

# redistribute
## windows
`haxelib run redistHelper hl.dx.hxml -zip`

## web
`haxelib run redistHelper js.hxml -zip`