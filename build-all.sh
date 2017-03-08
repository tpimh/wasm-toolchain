#!/bin/sh

git clone --depth 1 http://llvm.org/git/llvm.git
cd llvm/tools
git clone --depth 1 http://llvm.org/git/clang.git
cd ../projects
git clone --depth 1 http://llvm.org/git/compiler-rt.git
mkdir ../build
cd ../build
cmake -G Ninja -DLLVM_TARGETS_TO_BUILD="" -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly ..
ninja
cd ../..

git clone https://github.com/WebAssembly/binaryen.git
mkdir binaryen/build
cd binaryen/build
cmake -G Ninja ..
ninja
cd ../..

git clone https://github.com/WebAssembly/wabt.git
mkdir wabt/build
cd wabt/build
cmake -G Ninja -DBUILD_TESTS=OFF ..
ninja
