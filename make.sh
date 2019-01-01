MAIN="Splash"
rm *.h slide.png generate "$MAIN.o" "lib$MAIN.so"
echo "creating generate"
gcc generate.c -I/core/include/gtk-3.0/ \
               -I /core/include/glib-2.0/ \
               -I /core/lib/glib-2.0/include/ \
               -I /core/include/pango-1.0/ \
               -I /core/include/cairo/ \
               -I /core/include/gdk-pixbuf-2.0/ \
               -I /core/include/atk-1.0/ \
               -lgdk-3 -lgdk_pixbuf-2.0 -lgtk-3 \
               -o generate
if [[ $? == 0 ]] ; then
    if [[ -x generate ]] ; then
            if [[ -f logo.png ]]; then
                ./generate logo.png 12
                gdk-pixbuf-csource --static --stream --name=slide slide.png > slide.h
            else
                echo "no slide.png found"
                exit
            fi
    else
        echo "no generate found"
        exit
    fi
else
    echo "failed to make generate"
    exit
fi

if [[ -f preview.png ]] ; then
    gdk-pixbuf-csource --static --stream --name=preview preview.png > preview.h
else
    echo "no preview.png found"
fi

gcc "$MAIN.c" -I /core/include/gtk-3.0 \
           -I /core/include/glib-2.0/ \
           -I /core/lib/glib-2.0/include/ \
           -I /core/include/pango-1.0/ \
           -I /core/include/cairo/ \
           -I /core/include/gdk-pixbuf-2.0/ \
           -I /core/include/xfce4/xfce4-session-4.6/ \
           -I /core/include/atk-1.0/ \
           -I /core/include/xfce4/xfconf-0/ \
           -I /core/include/xfce4/ \
           -lgdk-3 -lgdk_pixbuf-2.0 -lgtk-3 -lgobject-2.0 -lglib-2.0 -lcairo -lX11 \
           -fPIC -c
gcc -shared -o "lib$MAIN.so" "$MAIN.o"

echo "Do you want to install theme"
read a
if [[ $a == "y" ]] ; then
    sudo cp "lib$MAIN.so" /core/lib/xfce4/session/splash-engines/
fi