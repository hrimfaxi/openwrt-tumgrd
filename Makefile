include $(TOPDIR)/rules.mk

PKG_NAME:=tumgrd
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hrimfaxi/tumgrd.git
PKG_SOURCE_VERSION:=HEAD

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=LICENSE

# C 项目用 cmake，引入 cmake.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/tumgrd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=tumgrd traffic manager daemon
  URL:=https://github.com/hrimfaxi/tumgrd
  DEPENDS:=+libubox +libubus +libuci +libsqlite3 +tutuicmptunnel
endef

define Package/tumgrd/description
  tumgrd - Traffic manager daemon for OpenWrt with ubus/uci integration.
endef

# 你的 CMakeLists.txt 没有 install() 规则，二进制留在 build 目录
define Package/tumgrd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tumgrd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tumgr $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/contrib/etc/config/tumgrd $(1)/etc/config/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/contrib/etc/init.d/tumgrd $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,tumgrd))
