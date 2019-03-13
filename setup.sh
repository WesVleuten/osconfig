#!/bin/bash

echo "osconfig by WesVleuten";
echo "Starting now...";
echo "----";

echo "Creating link for i3 config";
ln -f ./i3config ~/.config/i3/config

echo "Creating link for .vimrc";
ln -f ./vimrc ~/.vimrc;

