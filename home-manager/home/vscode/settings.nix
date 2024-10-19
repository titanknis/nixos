{ pkgs, ... }:

{
  home.file.".config/Code/User/settings.json".text = ''

{
    // Auto-save files after a delay
    "files.autoSave": "afterDelay",

    // Set the icon theme for the file explorer
    "workbench.iconTheme": "material-icon-theme",

    // Disable automatic linking of matching tags
    "editor.linkedEditing": false,

    // Focus on the terminal after launching Python
    "python.terminal.focusAfterLaunch": true,

    // Set the default formatter for most file types
    "editor.defaultFormatter": "esbenp.prettier-vscode",

    // Set tab width for Prettier
    "prettier.tabWidth": 4,

    // Python-specific settings
    "[python]": {
        "editor.defaultFormatter": "ms-python.black-formatter"
    },

    // Java-specific settings
    "[java]": {
        "editor.defaultFormatter": "redhat.java"
    },

    // Console log settings
    "turboConsoleLog.delimiterInsideMessage": "->",
    "turboConsoleLog.insertEmptyLineAfterLogMessage": true,
    "turboConsoleLog.insertEmptyLineBeforeLogMessage": true,
    "turboConsoleLog.logFunction": "print",
    "turboConsoleLog.includeFileNameAndLineNum": true,

    // Disable multi-line paste warning in terminal
    "terminal.integrated.enableMultiLinePasteWarning": "never",

    // Disable automatic Git repository detection
    "git.autoRepositoryDetection": false,

    // PHP settings
    "php.validate.executablePath": "/opt/lampp/bin/php",
    "php.debug.executablePath": "/opt/lampp/bin/php",
    "[php]": {
        "editor.defaultFormatter": "bmewburn.vscode-intelephense-client"
    },

    // Live Server settings
    "liveServer.settings.donotShowInfoMsg": true,
    "liveServer.settings.donotVerifyTags": true,

    // Disable Red Hat telemetry
    "redhat.telemetry.enabled": false,

    // Disable notification for open loose files in Live Preview
    "livePreview.notifyOnOpenLooseFile": false,

    // Set multi-cursor modifier key
    "editor.multiCursorModifier": "ctrlCmd",

    // Disable accessibility support
    "editor.accessibilitySupport": "off",

    // Disable minimap
    "editor.minimap.enabled": false,

    // Set Python interpreter path
    "python.pythonPath": "~/myenv/bin/python",

    // Set color theme
    "workbench.colorTheme": "Gitpod Dark",

    // Set editor font family
    "editor.fontFamily": "'MesloLGS NF', 'Fira Code', 'Droid Sans Mono', 'monospace'"



    
    // Set to false to show extension recommendations
    "extensions.ignoreRecommendations": false,

    // List of recommended extensions
    "extensions.recommendations": [
        // Python extension for VSCode
        "ms-python.python",
        
        // Prettier for code formatting
        "esbenp.prettier-vscode",
        
        // ESLint for JavaScript linting
        "dbaeumer.vscode-eslint"
    ]
}

}

'';

}


