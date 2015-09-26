To add this overlay from layman, do:

add to /etc/layman/layman.cfg

overlays  : https://raw.githubusercontent.com/hardentoo/hardentoo/master/overlay.xml

then

```sudo layman -a hardentoo```

or run:

```
sudo su
layman -f -o https://raw.githubusercontent.com/hardentoo/hardentoo/master/overlay.xml -a hardentoo
```
