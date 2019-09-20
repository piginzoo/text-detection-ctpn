#!/usr/bin/env bash

echo "模型转换: 从ckpt转成pb"

if [ "$1" = "" ]; then
    echo "ckpt模型目录不能为空: conver_model <原始模型的名称> <目标pb模型的生成目录>"
    echo "例："
    echo "  bin/convert_model.sh /app.fast/projects/models/ctpn-2019-05-28-22-32-39-2901.ckpt ../ocr/model/ctpn"
    exit
fi

ckpt_mod_path=$1
save_mod_dir=$2

if [ "$1" = "quick" ]; then
    ckpt_mod_path=/app.fast/projects/models/ctpn-2019-05-28-22-32-39-2901.ckpt
    save_mod_dir=../ocr/model/ctpn
fi


if [ "$save_mod_dir" = "" ]; then
    echo "ckpt模型目录不能为空: conver_model <原始模型的名称> <目标pb模型的生成目录>"
    exit
fi

python -m ctpn.utils.convert_model \
    --ckpt_mod_path=$ckpt_mod_path \
    --save_mod_dir=$save_mod_dir