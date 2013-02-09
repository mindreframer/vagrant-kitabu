http://blog.favrik.com/2011/02/22/preview-all-pygments-styles-for-your-code-highlighting-needs/#stylesheetNavigator

```bash
for i in  monokai manni perldoc borland colorful default murphy vs trac tango fruity autumn bw emacs pastie friendly native;
    do pygmentize -f html -S $i -a .highlight > $i.css;
done
```