# openwrt-tumgrd

tumgrd - Traffic manager daemon for OpenWrt with ubus/uci integration.

## 使用方法

下载`openwrt-sdk`或者`openwrt`仓库，解压后进入子目录

```sh
cd package
git clone https://github.com/hrimfaxi/openwrt-tumgrd.git tumgrd
cd ..
./scripts/feeds update -a
./scripts/feeds install libubox libubus libuci libsqlite3
make menuconfig # 进入menuconfig选中tumgrd (Network -> tumgrd)
make package/tumgrd/compile V=s

# 查找 tumgrd 的安装包，然后上传到路由器
find . -type f \( -name "*tumgrd*.ipk" -o -name "*tumgrd*.apk" \)
```

## 依赖

- libubox
- libubus
- libuci
- libsqlite3

## 安装包内容

- `/usr/bin/tumgrd` - 流量管理守护进程
- `/usr/bin/tumgr` - 客户端工具
- `/etc/config/tumgrd` - UCI配置文件
- `/etc/init.d/tumgrd` - init启动脚本

## 许可证

GPL
