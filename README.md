# Pack Mari0 via Makefile

Theoratically, packing portable love game distribution works only on windows.
Simply cat `love.exe` and `*.love` will work.

This [Makefile](Makefile) can automate this process: `*.lua` -> `*.love` -> `*.exe`.

## Prerequirements

### Windows

-   install **[Git for Windows](https://git-scm.com/download/win)**
    (contains a Bash shell & some common utils, we need `make` here),
    my archive: <http://whudoc.qiniudn.com/Git-2.7.2-64-bit.exe>

    if you have problems with how to install, check out my blog post: [Git、
    GitHub 和 Windows](http://tangzx.qiniudn.com/post-0044-git-github-notes.html#%E4%B8%8B%E8%BD%BD-git-for-windows).

-   go to source dir, right click

    ![](http://whudoc.qiniudn.com/github-guide/img/gitbash-gitgui.png)

-   run these commands in shell

    ```bash
    make
    make pack
    ```

-   run `make run`. (or manually go to `bin/love-0.10.1-win64`, double click `mari0.exe`.)

    ![](http://whudoc.qiniudn.com/2016/github-mari0-pack.png)

-   TODO: pack standalone winexe. (via ILMerge, or something else)

### Linux

~~TODO.~~ impossible.

We can create win portable on linux, but not possible to create linux portable.

Check out [Learning Lua](http://tangzx.qiniudn.com/post-0101-learning-lua.html)
for how to build lua from source on linux.

make `mari0.love` and run:

```
# cd source dir
make
make run
```

![](http://whudoc.qiniudn.com/2016/github-mari0-linux.png)

---

see more Makefile examples at my other repo: [district10/makesync: Sync via
make/Makefile, because rsync is BAD, in some
sense.](https://github.com/district10/makesync).

see javascript port of love game engine and the mari0 port: [Mari0](http://tannerrogalsky.com/mari0/).

refs and see also

  - [ILMerge - Microsoft Research](http://research.microsoft.com/en-us/people/mbarnett/ilmerge.aspx)
  - [Download ILMerge from Official Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=17630)
  - [Merge an .exe and a .dll into one .exe - .NET sample code - developer Fusion](http://www.developerfusion.com/code/4504/merge-an-exe-and-a-dll-into-one-exe/)
