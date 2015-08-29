include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-oh3c
PKG_RELEASE:=0.2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-oh3c
  SECTION:=net
  CATEGORY:=Network
  TITLE:=H3C INODE CLIENT FOR OPENWRT WRITTEN
  URL:=https://github.com/fjkfwz/luci-app-oh3c
  DEPENDS:=python-mini
  MAINTAINER:= RiceLyn <fjkfwz@gmail.com>
endef

define Package/helloworld/description
    H3C INODE CLIENT FOR OPENWRT WRITTEN BY PYTHON.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ccnu/install
    $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,luci-app-oh3c))