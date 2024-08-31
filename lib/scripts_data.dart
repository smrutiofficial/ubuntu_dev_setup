final List<Map<String, dynamic>> scripts = [
  {
    "name": "App Installation",
    "heading": "Ubuntu Development Environment Setup",
    "context":
        "This script automates the installation of essential packages, DEB files, and Flatpak applications on an Ubuntu system. It's designed to set up a comprehensive development environment efficiently.",
    "description": [
      "Update and upgrade the system.",
      "Install essential packages (VLC, Zsh, Git).",
      "Handle DEB file installation (VS Code, MongoDB).",
      "Set up Node.js runtime.",
      "Install applications via Flatpak (Spotify, Firefox)."
    ],
    "executed_file": "scripts/app_install.sh"
  },
  {
    "name": "Flutter Setup",
    "heading": "Flutter Development Environment Setup",
    "context":
        "This script automates the setup of the Flutter SDK along with essential packages on an Ubuntu system. It simplifies the installation process, ensuring that the Flutter development environment is properly configured.",
    "description": [
      "Update and upgrade the system.",
      "Install necessary development packages (curl, Git, libraries).",
      "Download and extract the Flutter SDK.",
      "Configure system PATH for Flutter binaries.",
      "Run 'flutter doctor' and guide through Android licenses."
    ],
    "executed_file": "scripts/flutter.sh"
  },
  {
    "name": "Remove Snap",
    "heading": "Remove Snap Environment Setup",
    "context":
        "This script helps in setting up an environment by removing the Snap package manager from Ubuntu and replacing it with alternative package management solutions.",
    "description": [
      "Purge Snap packages and disable Snap daemon.",
      "Install and configure alternative package management tools (Flatpak).",
      "Reinstall popular applications using alternative methods."
    ],
    "executed_file": "script/remove_snap.sh"
  },
  {
    "name": "Setup nvim & tmux",
    "heading": "Tmux and Neovim Configuration Setup",
    "context":
        "This script automates the process of setting up Tmux and Neovim configurations on an Ubuntu system by cloning a configuration repository and copying the necessary files to the appropriate directories.",
    "description": [
      "Clone configuration repository from GitHub.",
      "Install Tmux and FZF.",
      "Copy configuration files to ~/.config/ directory."
    ],
    "executed_file": "script/setup_nvim_tmux.sh"
  },
  {
    "name": "Terminal Setup",
    "heading": "Zsh and Powerlevel10k Setup",
    "context":
        "This script automates the installation and configuration of Zsh, Oh My Zsh, and the Powerlevel10k theme on an Ubuntu system. It also sets up the MesloLGS NF fonts, required for the Powerlevel10k theme, and configures the terminal to use them.",
    "description": [
      "Install Zsh shell.",
      "Download and install MesloLGS NF fonts.",
      "Configure terminal to use MesloLGS NF fonts.",
      "Install Oh My Zsh and set Powerlevel10k as the default theme.",
      "Change default shell to Zsh."
    ],
    "executed_file": "script/terminal_zsh.sh"
  },
  {
    "name": "Themes Setup",
    "heading": "GTK Theme and Icon Setup",
    "context":
        "This script automates the installation of a custom GTK theme and icon set on an Ubuntu system. It also configures Flatpak applications to use the installed theme for a consistent look and feel.",
    "description": [
      "Check and create ~/.themes directory if necessary.",
      "Download and install Everforest GTK theme.",
      "Install WhiteSur icon theme.",
      "Configure Flatpak applications to use the installed theme."
    ],
    "executed_file": "script/themes.sh"
  }
];

