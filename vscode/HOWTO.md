# MIGRATE VSCODE EXTENSIONS

<!-- OLD_MACHINE -->

```bash
code --list-extensions > vscode-extensions.list
```

<!-- NEW_MACHINE -->

```bash
cat vscode-extensions.list | xargs -L 1 code --install-extension
```

Settings file locations

By default VS Code shows the Settings editor, but you can still edit the underlying settings.json file by using the Open Settings (JSON) command or by changing your default settings editor with the workbench.settings.editor setting.

Depending on your platform, the user settings file is located here:

    Windows %APPDATA%\Code\User\settings.json
    macOS $HOME/Library/Application Support/Code/User/settings.json
    Linux $HOME/.config/Code/User/settings.json
