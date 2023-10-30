fx_version "bodacious"
game "gta5"
          

shared_scripts {
  "@vrp/lib/utils.lua",
  "config/*"
}

client_scripts {
  "_client/*",
}

server_scripts {
  "_server/*",
}

ui_page "web-side/index.html"

files {
	"web-side/**/"
}    