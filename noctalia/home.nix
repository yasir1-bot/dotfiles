{ inputs, pkgs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
    enable = true;

    settings = {

      # ── App Launcher ──────────────────────────────────────────────────────
      appLauncher = {
        autoPasteClipboard           = false;
        clipboardWatchImageCommand   = "wl-paste --type image --watch cliphist store";
        clipboardWatchTextCommand    = "wl-paste --type text --watch cliphist store";
        clipboardWrapText            = true;
        customLaunchPrefix           = "";
        customLaunchPrefixEnabled    = false;
        density                      = "default";
        enableClipPreview            = true;
        enableClipboardChips         = true;
        enableClipboardHistory       = false;
        enableClipboardSmartIcons    = true;
        enableSessionSearch          = true;
        enableSettingsSearch         = true;
        enableWindowsSearch          = true;
        iconMode                     = "tabler";
        ignoreMouseInput             = false;
        overviewLayer                = false;
        pinnedApps                   = [];
        position                     = "center";
        screenshotAnnotationTool     = "";
        showCategories               = true;
        showIconBackground           = false;
        sortByMostUsed               = true;
        terminalCommand              = "kitty -e";   # changed: you use kitty not alacritty
        viewMode                     = "list";
      };

      # ── Audio ─────────────────────────────────────────────────────────────
      audio = {
        mprisBlacklist           = [];
        preferredPlayer          = "";
        spectrumFrameRate        = 30;
        spectrumMirrored         = true;
        visualizerType           = "linear";
        volumeFeedback           = false;
        volumeFeedbackSoundFile  = "";
        volumeOverdrive          = false;
        volumeStep               = 5;
      };

      # ── Bar ───────────────────────────────────────────────────────────────
      bar = {
        autoHideDelay              = 500;
        autoShowDelay              = 150;
        backgroundOpacity          = 0.93;
        barType                    = "floating";
        capsuleColorKey            = "none";
        capsuleOpacity             = 1;
        contentPadding             = 2;
        density                    = "comfortable";
        displayMode                = "always_visible";
        enableExclusionZoneInset   = true;
        fontScale                  = 0.87;
        frameRadius                = 12;
        frameThickness             = 8;
        hideOnOverview             = false;
        marginHorizontal           = 90;
        marginVertical             = 4;
        middleClickAction          = "none";
        middleClickCommand         = "";
        middleClickFollowMouse     = false;
        monitors                   = [];
        mouseWheelAction           = "none";
        mouseWheelWrap             = true;
        outerCorners               = true;
        position                   = "top";
        reverseScroll              = false;
        rightClickAction           = "controlCenter";
        rightClickCommand          = "";
        rightClickFollowMouse      = true;
        screenOverrides            = [];
        showCapsule                = true;
        showOnWorkspaceSwitch      = true;
        showOutline                = false;
        useSeparateOpacity         = false;
        widgetSpacing              = 6;

        widgets = {
          left = [
            {
              id                    = "Launcher";
              colorizeSystemIcon    = "none";
              colorizeSystemText    = "none";
              customIconPath        = "";
              enableColorization    = false;
              icon                  = "rocket";
              iconColor             = "none";
              useDistroLogo         = false;
            }
            {
              id          = "Network";
              displayMode = "alwaysShow";
              iconColor   = "none";
              textColor   = "none";
            }
            {
              id            = "ActiveWindow";
              colorizeIcons = false;
              displayMode   = "alwaysShow";  # json says "hidden" for hideMode; displayMode maps to alwaysShow
              hideMode      = "hidden";
              maxWidth      = 145;
              scrollingMode = "hover";
              showIcon      = true;
              showText      = true;
              textColor     = "none";
              useFixedWidth = false;
            }
          ];

          center = [
            {
              id                = "Clock";
              clockColor        = "primary";
              customFont        = "";
              formatHorizontal  = "HH:mm ddd, MMM dd";
              formatVertical    = "HH mm - dd MM";
              tooltipFormat     = "HH:mm ddd, MMM dd";
              useCustomFont     = false;
            }
            {
              id                          = "Workspace";
              characterCount              = 2;
              colorizeIcons               = false;
              emptyColor                  = "secondary";
              enableScrollWheel           = true;
              focusedColor                = "primary";
              followFocusedScreen         = false;
              fontWeight                  = "bold";
              groupedBorderOpacity        = 1;
              hideUnoccupied              = false;
              iconScale                   = 0.8;
              labelMode                   = "none";
              occupiedColor               = "secondary";
              pillSize                    = 0.6;
              showApplications            = false;
              showApplicationsHover       = false;
              showBadge                   = true;
              showLabelsOnlyWhenOccupied  = true;
              unfocusedIconsOpacity       = 1;
            }
            {
              id                  = "MediaMini";
              compactMode         = true;
              hideMode            = "visible";
              hideWhenIdle        = false;
              maxWidth            = 200;
              panelShowAlbumArt   = true;
              scrollingMode       = "hover";
              showAlbumArt        = true;
              showArtistFirst     = false;
              showProgressRing    = true;
              showVisualizer      = true;
              textColor           = "primary";
              useFixedWidth       = false;
              visualizerType      = "wave";
            }
          ];

          right = [
            {
              id                  = "Volume";
              displayMode         = "alwaysShow";
              iconColor           = "none";
              middleClickCommand  = "pwvucontrol || pavucontrol";
              textColor           = "none";
            }
            {
              id          = "Bluetooth";
              displayMode = "alwaysShow";
              iconColor   = "none";
              textColor   = "none";
            }
            {
              id        = "SessionMenu";
              iconColor = "error";
            }
          ];
        };
      };

      # ── Brightness ────────────────────────────────────────────────────────
      brightness = {
        backlightDeviceMappings = [];
        brightnessStep          = 5;
        enableDdcSupport        = false;
        enforceMinimum          = true;
      };

      # ── Calendar ──────────────────────────────────────────────────────────
      calendar = {
        cards = [
          { id = "calendar-header-card"; enabled = true; }
          { id = "calendar-month-card";  enabled = true; }
          { id = "weather-card";         enabled = true; }
        ];
      };

      # ── Color Schemes ─────────────────────────────────────────────────────
      colorSchemes = {
        darkMode            = true;
        generationMethod    = "vibrant";
        manualSunrise       = "06:30";
        manualSunset        = "18:30";
        monitorForColors    = "";
        predefinedScheme    = "Rose Pine";
        schedulingMode      = "off";
        syncGsettings       = true;
        useWallpaperColors  = true;
      };

      # ── Control Center ────────────────────────────────────────────────────
      controlCenter = {
        cards = [
          { id = "profile-card";      enabled = true;  }
          { id = "shortcuts-card";    enabled = true;  }
          { id = "audio-card";        enabled = true;  }
          { id = "brightness-card";   enabled = false; }
          { id = "weather-card";      enabled = true;  }
          { id = "media-sysmon-card"; enabled = true;  }
        ];
        diskPath = "/";
        position = "close_to_bar_button";
        shortcuts = {
          left = [
            { id = "Network";             }
            { id = "Bluetooth";           }
            { id = "WallpaperSelector";   }
            { id = "NoctaliaPerformance"; }
          ];
          right = [
            { id = "Notifications";   }
            { id = "PowerProfile";    }
            { id = "KeepAwake";       }
            { id = "NightLight";      }
          ];
        };
      };

      # ── Desktop Widgets ───────────────────────────────────────────────────
      desktopWidgets = {
        enabled         = false;
        gridSnap        = false;
        gridSnapScale   = false;
        monitorWidgets  = [];
        overviewEnabled = true;
      };

      # ── Dock ──────────────────────────────────────────────────────────────
      dock = {
        animationSpeed          = 1;
        backgroundOpacity       = 1;
        colorizeIcons           = false;
        deadOpacity             = 0.6;
        displayMode             = "auto_hide";
        dockType                = "floating";
        enabled                 = true;
        floatingRatio           = 1;
        groupApps               = false;
        groupClickAction        = "cycle";
        groupContextMenuMode    = "extended";
        groupIndicatorStyle     = "dots";
        inactiveIndicators      = false;
        indicatorColor          = "primary";
        indicatorOpacity        = 0.6;
        indicatorThickness      = 3;
        launcherIcon            = "";
        launcherIconColor       = "none";
        launcherPosition        = "end";
        launcherUseDistroLogo   = false;
        monitors                = [];
        onlySameOutput          = true;
        pinnedApps              = [];
        pinnedStatic            = false;
        position                = "bottom";
        showDockIndicator       = false;
        showLauncherIcon        = false;
        sitOnFrame              = false;
        size                    = 1;
      };

      # ── General ───────────────────────────────────────────────────────────
      general = {
        allowPanelsOnScreenWithoutBar     = true;
        allowPasswordWithFprintd          = false;
        animationDisabled                 = false;
        animationSpeed                    = 1;
        autoStartAuth                     = false;
        avatarImage                       = "/home/yasir/.face";
        boxRadiusRatio                    = 1;
        clockFormat                       = "hh\\nmm";
        clockStyle                        = "digital";
        compactLockScreen                 = false;
        dimmerOpacity                     = 0.2;
        enableBlurBehind                  = true;
        enableLockScreenCountdown         = true;
        enableLockScreenMediaControls     = false;
        enableShadows                     = true;
        forceBlackScreenCorners           = false;
        iRadiusRatio                      = 1;
        keybinds = {
          keyDown   = [ "Down" ];
          keyEnter  = [ "Return" "Enter" ];
          keyEscape = [ "Esc" ];
          keyLeft   = [ "Left" ];
          keyRemove = [ "Del" ];
          keyRight  = [ "Right" ];
          keyUp     = [ "Up" ];
        };
        language                          = "";
        lockOnSuspend                     = true;
        lockScreenAnimations              = false;
        lockScreenBlur                    = 0.4;
        lockScreenCountdownDuration       = 3000;
        lockScreenMonitors                = [];
        lockScreenTint                    = 0.2;
        passwordChars                     = true;
        radiusRatio                       = 1;
        reverseScroll                     = false;
        scaleRatio                        = 1;
        screenRadiusRatio                 = 1;
        shadowDirection                   = "bottom_right";
        shadowOffsetX                     = 2;
        shadowOffsetY                     = 3;
        showChangelogOnStartup            = true;
        showHibernateOnLockScreen         = false;
        showScreenCorners                 = false;
        showSessionButtonsOnLockScreen    = true;
        smoothScrollEnabled               = true;
        telemetryEnabled                  = true;
      };

      # ── Hooks ─────────────────────────────────────────────────────────────
      hooks = {
        colorGeneration         = "";
        darkModeChange          = "";
        enabled                 = false;
        performanceModeDisabled = "";
        performanceModeEnabled  = "";
        screenLock              = "";
        screenUnlock            = "";
        session                 = "";
        startup                 = "";
        wallpaperChange         = "";
      };

      # ── Idle ──────────────────────────────────────────────────────────────
      idle = {
        customCommands        = "[]";
        enabled               = false;
        fadeDuration          = 5;
        lockCommand           = "";
        lockTimeout           = 660;
        resumeLockCommand     = "";
        resumeScreenOffCommand = "";
        resumeSuspendCommand  = "";
        screenOffCommand      = "";
        screenOffTimeout      = 600;
        suspendCommand        = "";
        suspendTimeout        = 1800;
      };

      # ── Location ──────────────────────────────────────────────────────────
      location = {
        analogClockInCalendar   = false;
        autoLocate              = false;
        firstDayOfWeek          = -1;
        hideWeatherCityName     = false;
        hideWeatherTimezone     = false;
        monthBeforeDay          = false;
        name                    = "";   # left blank as in your json; fill in to enable weather
        showCalendarEvents      = true;
        showCalendarWeather     = true;
        showWeekNumberInCalendar = false;
        use12hourFormat         = false;
        useFahrenheit           = false;
        weatherEnabled          = true;
        weatherShowEffects      = true;
        weatherTaliaMascotAlways = false;
      };

      # ── Network ───────────────────────────────────────────────────────────
      network = {
        bluetoothAutoConnect          = true;
        bluetoothDetailsViewMode      = "grid";
        bluetoothHideUnnamedDevices   = false;
        bluetoothRssiPollIntervalMs   = 60000;
        bluetoothRssiPollingEnabled   = false;
        disableDiscoverability        = false;
        networkPanelView              = "wifi";
        wifiDetailsViewMode           = "grid";
      };

      # ── Night Light ───────────────────────────────────────────────────────
      nightLight = {
        autoSchedule  = true;
        dayTemp       = "6500";
        enabled       = false;
        forced        = false;
        manualSunrise = "06:30";
        manualSunset  = "18:30";
        nightTemp     = "4000";
      };

      # ── Noctalia Performance ──────────────────────────────────────────────
      noctaliaPerformance = {
        disableDesktopWidgets = true;
        disableWallpaper      = true;
      };

      # ── Notifications ─────────────────────────────────────────────────────
      notifications = {
        backgroundOpacity           = 1;
        clearDismissed              = true;
        criticalUrgencyDuration     = 15;
        density                     = "default";
        enableBatteryToast          = true;
        enableKeyboardLayoutToast   = true;
        enableMarkdown              = false;
        enableMediaToast            = false;
        enabled                     = true;
        location                    = "top_right";
        lowUrgencyDuration          = 3;
        monitors                    = [];
        normalUrgencyDuration       = 8;
        overlayLayer                = true;
        respectExpireTimeout        = false;
        saveToHistory = {
          critical = true;
          low      = true;
          normal   = true;
        };
        sounds = {
          criticalSoundFile = "";
          enabled           = false;
          excludedApps      = "discord,firefox,chrome,chromium,edge";
          lowSoundFile      = "";
          normalSoundFile   = "";
          separateSounds    = false;
          volume            = 0.5;
        };
      };

      # ── OSD ───────────────────────────────────────────────────────────────
      osd = {
        autoHideMs        = 2000;
        backgroundOpacity = 1;
        enabled           = true;
        enabledTypes      = [ 0 1 2 ];
        location          = "top_right";
        monitors          = [];
        overlayLayer      = true;
      };

      # ── Plugins ───────────────────────────────────────────────────────────
      plugins = {
        autoUpdate    = false;
        notifyUpdates = true;
      };

      # ── Session Menu ──────────────────────────────────────────────────────
      sessionMenu = {
        countdownDuration   = 3000;
        enableCountdown     = false;
        largeButtonsLayout  = "grid";
        largeButtonsStyle   = false;
        position            = "center";
        powerOptions = [
          { action = "lock";            command = ""; countdownEnabled = true;  enabled = true;  keybind = "1"; }
          { action = "suspend";         command = ""; countdownEnabled = true;  enabled = true;  keybind = "2"; }
          { action = "hibernate";       command = ""; countdownEnabled = true;  enabled = true;  keybind = "3"; }
          { action = "reboot";          command = ""; countdownEnabled = true;  enabled = true;  keybind = "4"; }
          { action = "logout";          command = ""; countdownEnabled = true;  enabled = true;  keybind = "5"; }
          { action = "shutdown";        command = ""; countdownEnabled = true;  enabled = true;  keybind = "6"; }
          { action = "rebootToUefi";    command = ""; countdownEnabled = true;  enabled = true;  keybind = "7"; }
          { action = "userspaceReboot"; command = ""; countdownEnabled = true;  enabled = false; keybind = "";  }
        ];
        showHeader   = true;
        showKeybinds = true;
      };

      # ── System Monitor ────────────────────────────────────────────────────
      systemMonitor = {
        batteryCriticalThreshold  = 5;
        batteryWarningThreshold   = 20;
        cpuCriticalThreshold      = 90;
        cpuWarningThreshold       = 80;
        criticalColor             = "";
        diskAvailCriticalThreshold = 10;
        diskAvailWarningThreshold  = 20;
        diskCriticalThreshold     = 90;
        diskWarningThreshold      = 80;
        enableDgpuMonitoring      = false;
        externalMonitor           = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
        gpuCriticalThreshold      = 90;
        gpuWarningThreshold       = 80;
        memCriticalThreshold      = 90;
        memWarningThreshold       = 80;
        swapCriticalThreshold     = 90;
        swapWarningThreshold      = 80;
        tempCriticalThreshold     = 90;
        tempWarningThreshold      = 80;
        useCustomColors           = false;
        warningColor              = "";
      };

      # ── Templates ─────────────────────────────────────────────────────────
      templates = {
        activeTemplates = [
          { id = "alacritty"; enabled = true; }
          { id = "pywalfox";  enabled = true; }
          { id = "btop";      enabled = true; }
          { id = "kitty";     enabled = true; }
          { id = "code";      enabled = true; }
          { id = "gtk";       enabled = true; }
          { id = "cava";      enabled = true; }
        ];
        enableUserTheming = true;
      };

      # ── UI ────────────────────────────────────────────────────────────────
      ui = {
        boxBorderEnabled              = false;
        fontDefault                   = "JetBrainsMono Nerd Font";
        fontDefaultScale              = 1.01;
        fontFixed                     = "monospace";
        fontFixedScale                = 1;
        panelBackgroundOpacity        = 0.93;
        panelsAttachedToBar           = true;
        scrollbarAlwaysVisible        = true;
        settingsPanelMode             = "attached";
        settingsPanelSideBarCardStyle = false;
        tooltipsEnabled               = true;
        translucentWidgets            = false;
      };

      # ── Wallpaper ─────────────────────────────────────────────────────────
      wallpaper = {
        automationEnabled             = false;
        directory                     = "/home/yasir/Pictures/Wallpapers";
        enableMultiMonitorDirectories = false;
        enabled                       = true;
        favorites = [
          {
            appearance          = "dark";
            colorScheme         = "Dracula";
            darkMode            = true;
            generationMethod    = "vibrant";
            paletteColors       = [ "#e46767" "#d65c5c" "#cc6666" "#fd4663" ];
            path                = "/home/yasir/Pictures/Wallpapers/mountain-grey.jpg";
            useWallpaperColors  = true;
          }
          {
            appearance          = "dark";
            colorScheme         = "Rose Pine";
            darkMode            = true;
            generationMethod    = "vibrant";
            paletteColors       = [ "#52adfa" "#3941f9" "#9139f9" "#fd4663" ];
            path                = "/home/yasir/Pictures/Wallpapers/wallhaven_1qr8r3.jpg";
            useWallpaperColors  = true;
          }
          {
            appearance          = "dark";
            colorScheme         = "Rose Pine";
            darkMode            = true;
            generationMethod    = "vibrant";
            paletteColors       = [ "#c8e467" "#7dd65c" "#66b2cc" "#fd4663" ];
            path                = "/home/yasir/Pictures/Wallpapers/den.jpg";
            useWallpaperColors  = true;
          }
          {
            appearance          = "dark";
            colorScheme         = "Kanagawa";
            darkMode            = true;
            generationMethod    = "vibrant";
            paletteColors       = [ "#e48c67" "#ddc155" "#b5dd55" "#bc5226" ];
            path                = "/home/yasir/Pictures/Wallpapers/pixelbridge.png";
            useWallpaperColors  = true;
          }
        ];
        fillColor                     = "#000000";
        fillMode                      = "crop";
        hideWallpaperFilenames        = false;
        linkLightAndDarkWallpapers    = false;
        monitorDirectories            = [];
        overviewBlur                  = 0.4;
        overviewEnabled               = false;
        overviewTint                  = 0.6;
        panelPosition                 = "center";
        randomIntervalSec             = 300;
        setWallpaperOnAllMonitors     = true;
        showHiddenFiles               = false;
        skipStartupTransition         = false;
        solidColor                    = "#1a1a2e";
        sortOrder                     = "random";
        transitionDuration            = 1500;
        transitionEdgeSmoothness      = 0.05;
        transitionType                = [ "fade" "disc" "stripes" "wipe" "pixelate" "honeycomb" ];
        useOriginalImages             = false;
        useSolidColor                 = false;
        useWallhaven                  = false;
        viewMode                      = "single";
        wallhavenApiKey               = "";
        wallhavenCategories           = "111";
        wallhavenOrder                = "desc";
        wallhavenPurity               = "100";
        wallhavenQuery                = "kanagawa";
        wallhavenRatios               = "";
        wallhavenResolutionHeight     = "";
        wallhavenResolutionMode       = "atleast";
        wallhavenResolutionWidth      = "";
        wallhavenSorting              = "relevance";
        wallpaperChangeMode           = "random";
      };

    }; # end settings
  }; # end programs.noctalia-shell
}
