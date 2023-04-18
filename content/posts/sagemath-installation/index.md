---
title: "Installation: SageMath in DebianOS"
date: 2023-02-06
draft: false
summary: "Here is a guide for installing SageMath if the developers had kept the Sage git repository into **private**"
resources:
  - name: "featured-image"
    src: "images/sagemath-preview.png"
tags: ["sagemath"]
---

## Step-by-Step Installation Guide

1. Install prerequisites for Sagemath.

```plaintext
sudo apt-get update
sudo apt-get upgrade
```

```plaintext
sudo apt-get install bc binutils bzip2 ca-certificates cliquer cmake curl ecl eclib-tools fflas-ffpack flintqs g++ gcc gengetopt gfan gfortran glpk-utils gmp-ecm lcalc libatomic-ops-dev libboost-dev libbraiding-dev libbrial-dev libbrial-groebner-dev libbz2-dev libcdd-dev libcdd-tools libcliquer-dev libcurl4-openssl-dev libec-dev libecm-dev libffi-dev libflint-arb-dev libflint-dev libfplll-dev libfreetype6-dev libgc-dev libgd-dev libgf2x-dev libgiac-dev libgivaro-dev libglpk-dev libgmp-dev libgsl-dev libhomfly-dev libiml-dev liblfunction-dev liblinbox-dev liblrcalc-dev liblzma-dev libm4ri-dev libm4rie-dev libmpc-dev libmpfi-dev libmpfr-dev libncurses5-dev libntl-dev libopenblas-dev libpari-dev libpcre3-dev libplanarity-dev libppl-dev libprimesieve-dev libpython3-dev libqhull-dev libreadline-dev librw-dev libsingular4-dev libsqlite3-dev libssl-dev libsuitesparse-dev libsymmetrica2-dev libz-dev libzmq3-dev libzn-poly-dev m4 make nauty ninja-build openssl palp pari-doc pari-elldata pari-galdata pari-galpol pari-gp2c pari-seadata patch perl pkg-config planarity ppl-dev python3 python3-distutils python3-venv r-base-dev r-cran-lattice singular singular-doc sqlite3 sympow tachyon tar tox xcas xz-utils
```

```plaintext
sudo apt-get install default-jdk dvipng ffmpeg imagemagick latexmk libavdevice-dev pandoc tex-gyre texlive-fonts-recommended texlive-lang-cyrillic texlive-lang-english texlive-lang-european texlive-lang-french texlive-lang-german texlive-lang-italian texlive-lang-japanese texlive-lang-polish texlive-lang-portuguese texlive-lang-spanish texlive-latex-extra texlive-xetex
```

```plaintext
sudo apt-get install 4ti2 clang coinor-cbc coinor-libcbc-dev graphviz libfile-slurp-perl libgraphviz-dev libigraph-dev libisl-dev libjson-perl libmongodb-perl libnauty-dev libperl-dev libpolymake-dev libsvg-perl libterm-readkey-perl libterm-readline-gnu-perl libxml-libxslt-perl libxml-writer-perl libxml2-dev lrslib pari-gp2c pdf2svg polymake texinfo
```

2. Go to [Sagemath official page](https://www.sagemath.org/download-source.html), look for **"Download source code distribution (stable)"**, and select the nearest mirror from your permanent location. In my case, I select **"KoDDoS Mirror, Hong Kong"**.

3. Look for **Filename**, select the latest Sage package. In my case, ***sage-9.7.tar.gz*** is the latest which is released in 19 September 2022. Copy the link address of the Sage package and use `wget` to retrieve the file from Kali Linux. 

```plaintext
wget https://mirror-hk.koddos.net/sagemath/src/sage-9.7.tar.gz
```

4. Extract the file. Go to the Sage directory.

```plaintext
tar xvf sage-9.7.tar.gz
cd sage-9.7/
```

5. Inside the directory, configure Sage using `configure`. 

```plaintext
./configure
```

6. After the configuration process is completed, it will prompt you some recommended packages need to be install. For example:

```plaintext
checking for the package system in use... debian
configure:
    hint: installing the following system packages, if not
    already present, is recommended and may avoid having to
    build them (though some may have to be built anyway):
      $ sudo apt-get update 
      $ sudo apt-get install  libec-dev eclib-tools fflas-ffpack libfplll-dev libgiac-dev xcas libgivaro-dev liblinbox-dev liblrcalc-dev libqhull-dev
configure:
    hint: installing the following system packages, if not
    already present, may provide additional optional features:
      $ sudo apt-get update 
      $ sudo apt-get install  4ti2 gpgconf openssh-client texinfo default-jdk libavdevice-dev
configure:
    hint: After installation, re-run configure using:
      $ ./config.status --recheck && ./config.status
```

Download the recommended packages and recheck the configurations.

7. Build Sage using `make`. If you have 4 core processors in your devices, use `make -j4` instead of `make` to speed up the process of building the solution.

```plaintext
make
```

> NOTE: The `make` process might take up to hours even a day.

8. If Sage is successfully built, the last few lines of the output will look like the example below:

```plaintext
Sage build/upgrade complete!
make[1]: Leaving directory '/home/kali/sage-9.7'
```
If not, you can refer to the [Failed to build Sage](https://pikaroot.github.io/blogs/2023-02-06-Sagemath_Installation_without_git_clone_repo#-failed-to-build-sage) section.

9. Run Sage.

```plaintext
./sage
```

## Failed to build Sage

>NOTE: This section only solves the errors I had encountered. If you had encountered other errors, you can search [Sage Support](https://groups.google.com/g/sage-support) or [Sage Devel](https://groups.google.com/g/Sage-Devel) for more information.
### Error 1

```ini
***************************************************************
Error building Sage.
The following package(s) may have failed to build (not necessarily
during this run of 'make all-start'):
* package:         giac-1.9.0.15p0
  last build time: Feb 6 13:36
  log file:        /home/kali/ctf/sage-9.7/logs/pkgs/giac-1.9.0.15p0.log
  build directory: /home/kali/ctf/sage-9.7/local/var/tmp/sage/build/giac-1.9.0.15p0
It is safe to delete any log files and build directories, but they
contain information that is helpful for debugging build problems.
WARNING: If you now run 'make' again, the build directory of the
same version of the package will, by default, be deleted. Set the
environment variable SAGE_KEEP_BUILT_SPKGS=yes to prevent this.
make[1]: *** [Makefile:40: all-start] Error 1
make[1]: Leaving directory '/home/kali/sage-9.7'
make: *** [Makefile:13: all] Error 2
```

Solution:

```plaintext
./configure --with-system-pari=no
make -j4
```

### Error 2

```ini
[sagelib-9.7]     error: command '/usr/bin/gcc' failed with exit code 1
[sagelib-9.7]     error: subprocess-exited-with-error
[sagelib-9.7]     
[sagelib-9.7]     × python setup.py develop did not run successfully.
[sagelib-9.7]     │ exit code: 1
[sagelib-9.7]     ╰─> See above for output.
[sagelib-9.7]     
[sagelib-9.7]     note: This error originates from a subprocess, and is likely not a problem with pip.
[sagelib-9.7]     full command: /home/kali/ctf/sage-9.7/local/var/lib/sage/venv-python3.10/bin/python3 -c '
[sagelib-9.7]     exec(compile('"'"''"'"''"'"'
[sagelib-9.7]     # This is <pip-setuptools-caller> -- a caller that pip uses to run setup.py
[sagelib-9.7]     #
[sagelib-9.7]     # - It imports setuptools before invoking setup.py, to enable projects that directly
[sagelib-9.7]     #   import from `distutils.core` to work with newer packaging standards.
[sagelib-9.7]     # - It provides a clear error message when setuptools is not installed.
[sagelib-9.7]     # - It sets `sys.argv[0]` to the underlying `setup.py`, when invoking `setup.py` so
[sagelib-9.7]     #   setuptools doesn'"'"'t think the script is `-c`. This avoids the following warning:
[sagelib-9.7]     #     manifest_maker: standard file '"'"'-c'"'"' not found".
[sagelib-9.7]     # - It generates a shim setup.py, for handling setup.cfg-only projects.
[sagelib-9.7]     import os, sys, tokenize
[sagelib-9.7]     
[sagelib-9.7]     try:
[sagelib-9.7]         import setuptools
[sagelib-9.7]     except ImportError as error:
[sagelib-9.7]         print(
[sagelib-9.7]             "ERROR: Can not execute `setup.py` since setuptools is not available in "
[sagelib-9.7]             "the build environment.",
[sagelib-9.7]             file=sys.stderr,
[sagelib-9.7]         )
[sagelib-9.7]         sys.exit(1)
[sagelib-9.7]     
[sagelib-9.7]     __file__ = %r
[sagelib-9.7]     sys.argv[0] = __file__
[sagelib-9.7]     
[sagelib-9.7]     if os.path.exists(__file__):
[sagelib-9.7]         filename = __file__
[sagelib-9.7]         with tokenize.open(__file__) as f:
[sagelib-9.7]             setup_py_code = f.read()
[sagelib-9.7]     else:
[sagelib-9.7]         filename = "<auto-generated setuptools caller>"
[sagelib-9.7]         setup_py_code = "from setuptools import setup; setup()"
[sagelib-9.7]     
[sagelib-9.7]     exec(compile(setup_py_code, filename, "exec"))
[sagelib-9.7]     '"'"''"'"''"'"' % ('"'"'/home/kali/ctf/sage-9.7/src/setup.py'"'"',), "<pip-setuptools-caller>", "exec"))' --no-user-cfg develop --no-deps
[sagelib-9.7]     cwd: /home/kali/ctf/sage-9.7/src/
[sagelib-9.7] error: subprocess-exited-with-error
[sagelib-9.7] 
[sagelib-9.7] × python setup.py develop did not run successfully.
[sagelib-9.7] │ exit code: 1
[sagelib-9.7] ╰─> See above for output.
[sagelib-9.7] 
[sagelib-9.7] note: This error originates from a subprocess, and is likely not a problem with pip.
[sagelib-9.7] 
[sagelib-9.7] real      48m39.032s
[sagelib-9.7] user      50m23.241s
[sagelib-9.7] sys       1m51.474s
make[4]: *** [Makefile:3115: sagelib-SAGE_VENV-no-deps] Error 1
make[3]: *** [Makefile:3115: /home/kali/sage-9.7/local/var/lib/sage/venv-python3.10/var/lib/sage/installed/sagelib-9.7] Error 2
make[2]: *** [Makefile:2647: all-start] Error 2
make[2]: Leaving directory '/home/kali/sage-9.7/build/make'
real    91m23.529s
user    92m43.689s
sys     4m23.914s
***************************************************************
Error building Sage.
The following package(s) may have failed to build (not necessarily
during this run of 'make all-start'):
It is safe to delete any log files and build directories, but they
contain information that is helpful for debugging build problems.
WARNING: If you now run 'make' again, the build directory of the
same version of the package will, by default, be deleted. Set the
environment variable SAGE_KEEP_BUILT_SPKGS=yes to prevent this.
make[1]: *** [Makefile:40: all-start] Error 1
make[1]: Leaving directory '/home/kali/ctf/sage-9.7'
make: *** [Makefile:13: all] Error 2
```

Solution:

```plaintext
./configure --enable-download-from-upstream-url
./configure --with-system-python3=no --with-system-gap=no --with-system-singular=no
make -j4
```

## References

1. [Sagemath Installation Guide](http://sage.grad.hr:1234/doc/static/installation/source.html)
2. [Install Prerequisites and Git](https://doc.sagemath.org/html/en/installation/source.html)
3. [Quick Installation Guide](https://wiki.sagemath.org/DownloadAndInstallationGuide)
4. [Sage Support](https://groups.google.com/g/sage-support)
5. [Sage Devel](https://groups.google.com/g/Sage-Devel)
6. [[sage-9.7] error - SOLVED](https://groups.google.com/g/sage-support/c/8JxNzxyVPxY)
7. [[giac-1.9.015p0.log] error - SOLVED](https://groups.google.com/g/Sage-Devel/c/fXxCm4upgQI)
