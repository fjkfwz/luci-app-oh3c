# luci-app-oh3c
为OH3C添加Luci界面及Makefile文件
代码已编译，源码在：https://github.com/nanpuyue/OH3C

##使用方法:
**Add "src-git extra git://github.com/fjkfwz/luci-app-oh3c.git" to feeds.conf.default.**
```
./scripts/feeds update -a
./scripts/feeds install -a
```
the list of packages:
luci-app-oh3c

##make menuconfig

**Network -> <*> luci-app-oh3c**

##copyright
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
