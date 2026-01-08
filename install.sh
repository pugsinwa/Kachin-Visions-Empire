#!/bin/bash

# Kachin Visions Empire Installation Script

echo "📱 Installing Kachin Visions Empire as PWA..."

# Function to detect OS
detect_os() {
    case "$(uname -s)" in
        Darwin*)    OS="macOS";;
        Linux*)     OS="Linux";;
        CYGWIN*)    OS="Windows";;
        MINGW*)     OS="Windows";;
        *)          OS="Unknown"
    esac
    echo "Detected OS: $OS"
}

# Function to create desktop shortcut
create_shortcut() {
    echo "🔗 Creating desktop shortcut..."
    
    case $OS in
        "Linux")
            cat > ~/Desktop/Kachin\ Visions\ Empire.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Kachin Visions Empire
Comment=Video Streaming Platform
Exec=google-chrome --app=https://[your-username].github.io/[repository-name]/
Icon=$PWD/icon.png
Terminal=false
Categories=Video;Entertainment;
EOF
            chmod +x ~/Desktop/Kachin\ Visions\ Empire.desktop
            ;;
        "macOS")
            osascript << EOF
tell application "Safari"
    activate
    tell window 1
        set current tab to (make new tab with properties {URL:"https://[your-username].github.io/[repository-name]/"})
    end tell
end tell
EOF
            ;;
        "Windows")
            # Create Windows shortcut
            powershell.exe -Command "
                \$WshShell = New-Object -comObject WScript.Shell
                \$Shortcut = \$WshShell.CreateShortcut(\"$HOME\\Desktop\\Kachin Visions Empire.lnk\")
                \$Shortcut.TargetPath = \"chrome.exe\"
                \$Shortcut.Arguments = \"--app=https://[your-username].github.io/[repository-name]/\"
                \$Shortcut.Save()
            "
            ;;
    esac
}

# Function to add to mobile home screen instructions
mobile_instructions() {
    echo ""
    echo "📱 MOBILE INSTALLATION:"
    echo "========================"
    echo ""
    echo "For ANDROID:"
    echo "1. Open Chrome browser"
    echo "2. Go to: https://[your-username].github.io/[repository-name]"
    echo "3. Tap menu (3 dots) → 'Add to Home screen'"
    echo "4. Name it 'Kachin Visions Empire'"
    echo "5. Tap ADD"
    echo ""
    echo "For iOS (iPhone/iPad):"
    echo "1. Open Safari browser"
    echo "2. Go to: https://[your-username].github.io/[repository-name]"
    echo "3. Tap Share button (📤)"
    echo "4. Scroll down and tap 'Add to Home Screen'"
    echo "5. Name it 'Kachin Visions Empire'"
    echo "6. Tap ADD"
    echo ""
    echo "✨ The app will now appear on your home screen like a native app!"
}

# Main installation process
main() {
    echo "🎬 Kachin Visions Empire Installation"
    echo "======================================"
    
    detect_os
    
    # Check if running on mobile
    if [[ "$(uname -m)" == *arm* ]] || [[ "$OS" == "Unknown" ]]; then
        echo "📱 Mobile device detected"
        mobile_instructions
    else
        echo "💻 Desktop device detected"
        create_shortcut
        mobile_instructions
        
        # Open in browser
        echo ""
        echo "🌐 Opening in browser..."
        case $OS in
            "Linux") xdg-open "https://[your-username].github.io/[repository-name]/" ;;
            "macOS") open "https://[your-username].github.io/[repository-name]/" ;;
            "Windows") start "https://[your-username].github.io/[repository-name]/" ;;
        esac
    fi
    
    echo ""
    echo "✅ Installation complete!"
    echo ""
    echo "🔧 ADMIN LOGIN:"
    echo "   Username: Sun Day"
    echo "   Password: sunday@video!01234"
    echo ""
    echo "📞 Support: Contact developer for assistance"
}

# Run main function
main