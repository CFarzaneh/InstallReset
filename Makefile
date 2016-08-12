TARGET = iphone:clang:9.2:9.0
ARCHS = armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = InstallReset
InstallReset_FILES = Tweak.xm
InstallReset_FRAMEWORKS = UIKit
InstallReset_PRIVATE_FRAMEWORKS = GraphicsServices
SHARED_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"

SUBPROJECTS += installresetprefs
include $(THEOS_MAKE_PATH)/aggregate.mk