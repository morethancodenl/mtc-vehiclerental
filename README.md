![Rental](https://i.imgur.com/rF4bOmQ.png)

# Vehicle Rental
Allow your players to rent vehicles for Qbox servers.

## 💾 Dependencies
- [ox_lib](https://github.com/overextended/ox_lib/releases)

## 🔌 Installation
To get started with the MTC rental resource, follow these steps:

1. Clone this repository and place the files into your designated resources folder.
2. Rename the script file to ```mtc-vehiclerental```.
3. Set up the necessary inventory items.

## 📦 Items
Add the following to ox_inventory/data/items.lua
```lua
	["rental_papers"] = {
		label = "Rental papers",
		weight = 0,
		stack = false,
		close = true,
		description = "Rental papers for a vehicle",
		client = {
			image = "rental.png",
		}
	},
```
## 👉 Join our community

[![Discord](https://discord.com/api/guilds/1075048579758035014/widget.png?style=banner2)](https://discord.gg/cFuv5BMWzK)
