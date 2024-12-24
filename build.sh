#! /bin/bash


script_dir=$(dirname "$(realpath "$0")")
pkgname="imageforge"
version=$(dpkg-parsechangelog --show-field Version)

#Build package
cd "$script_dir/"
python3 setup.py build

#Install package to script_dir/src/
python3 setup.py install --root="$script_dir/build/" --optimize=1 --skip-build


rm -rf "$script_dir/src/"
mkdir -p "$script_dir/src/usr/lib/python3/dist-packages/"
find "$script_dir/build/" -name __pycache__ -type d -exec rm -rf {} \;
find "$script_dir/build/" -name "$pkgname" -type d -exec cp -r {} "$script_dir/src/usr/lib/python3/dist-packages/" \;
find "$script_dir/build/" -name "$pkgname-$version.egg-info" -type d -exec cp -r {} "$script_dir/src/usr/lib/python3/dist-packages/" \;

# cleanup
rm -rf "$script_dir/build/"
rm -rf "$script_dir/v$version.tar.gz"
rm -rf "$script_dir/$pkgname-$version"