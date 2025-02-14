# xdebug-installer
Automate x-debug install (usefull when I dont want to touch my dockerfiles)


### 1 - Put the files in the project
### 2 - Set the right name of the php/fpm container in the script (like "php")
### 3 - do use the script : ./add_xdebug.sh
### 4 - delete the files from the project
### 5 - set a conf, for ex for vscode :
  ```
  {
	"version": "0.2.0",
	"configurations": [
		{
			"name": "Xdebug",
			"type": "php",
			"request": "launch",
			"port": 9003,
			"pathMappings": {
				"/symfony": "/path/to/my/project"
			},
			"ignore": [
				"**/vendor/**/*.php"
			]
		}
	]
}
```
