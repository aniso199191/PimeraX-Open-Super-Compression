# PimeraX Open Super Compression

超压缩格式 `.prx`：zstd-22 + xz 双通道。

实测：62M 模型 248.9MB → 63.4MB（25.5%）。

## 用法

```bash
bash install.sh                    # 一键安装
python3 prx.py 转 model.pt out.prx  # 量化+压缩
python3 prx.py 压 out.prx out.prx.sc # 超压缩
```

## License

MIT
