TARGET = :clang
ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = installresetprefs
installresetprefs_FILES = installresetprefs.mm
installresetprefs_INSTALL_PATH = /Library/PreferenceBundles
installresetprefs_FRAMEWORKS = UIKit
installresetprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/installresetprefs.plist$(ECHO_END)
