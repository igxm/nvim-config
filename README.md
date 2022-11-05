# 涵曦的 neovim 配置

- 插件使用 [packer.nvim](https://github.com/wbthomason/packer.nvim) 管理
- 主要的插件
	- [Yggdroot/LeaderF](https://github.com/Yggdroot/LeaderF) 模糊搜索
	- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) lsp 配置 c/c++, go, python, lua, bash
	- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) 使用 tabbar 管理 buffer
	- [catppuccin/nvim](https://github.com/catppuccin/nvim) 主题, 使用明色主题 latte
	- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) 状态栏
	- [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) 目录树
	- [ojroques/vim-oscyank](https://github.com/ojroques/vim-oscyank) osc52 粘贴板, wezterm 终端支持

安装脚本见： <https://github.com/hanxi/dotfiles>

## 截图

![image](https://user-images.githubusercontent.com/1185757/200134517-2ace1e9d-c82e-445d-a616-ee4439783ee0.png)

## 快捷键

- `<C-]>` lsp definition
- `<C-K>` lsp signature help
- `K` lsp hover
- `<C-P>` Leaderf 插件，文件模糊搜索
- `<C-Q>` 关闭 tab 页签
- `<C-C><C-C>` 连续两次 Ctrl + C 关闭所有插件窗口
- `<C-H>` `<C-L>` 切换tab页签
- `,<space>` 删除行尾空白字符
- `,b` Leader 插件，Buffer 列表
- `,g` Leader 插件，搜索当前位置的单词
- `,fr` Leader 插件，打开 Mru ，历史打开过的文件，按时间倒序
- `,t` nvim-tree 目录树
- `,u` Mundo 插件，查看 undo 记录
- `,v` Vista 插件，C/C++ 时有效，右边开启函数列表窗口
- `<select>gs` 选择字符串，按gs打开 Leaderf 插件搜索选择字符串
- 自动补全使用 `<Tab>` 和 `<S-Tab>` 选择候选项， `Enter` 选中
