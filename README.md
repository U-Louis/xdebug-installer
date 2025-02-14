# xdebug-installer
Automate x-debug install (usefull when I dont want to touch my dockerfiles + because la flem')

### 1 - Set the right name of the php/fpm container in the script (like "php")
### 2 - do use the script : ./add_xdebug.sh
### 3 - set a conf, for ex for vscode :
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

xdebug version fixed to 3.2.2 (for up to 3.4 it struggles : https://bugs.xdebug.org/view.php?id=2246)
