This markdown was taken from https://forum.xfce.org/viewtopic.php?pid=43171#p43171

If you want to develop a shell script to set up your Xfce panels, then you will obviously have to understand how you can access the Xfce configuration from the command line. In this post, I will explain what I learned in order to write such a script.
The “Xfconf” Configuration Storage System

The configuration of the Xfce desktop—including the panels—is maintained by the Xfconf storage system. As the Xfce documentation describes it:

    Xfconf is a hierarchical (tree-like) configuration system where the immediate child nodes of the root are called “channels”. All settings beneath the channel nodes are called “properties”.

Querying the “Xfconf” Configuration Storage System

To access the Xfconf configuration data from the command line, you can run the “xfconf-query” utility. In its simplest form, the xfconf-query command will list the Xfconf channels—e.g.:

$ xfconf-query --list

The output from this command will look something like this:

Channels:
  thunar-volman
  xsettings
  displays
  ristretto
  thunar
  xfce4-desktop
  xfce4-power-manager
  xfce4-mixer
  xfce4-session
  xfce4-panel
  xfce4-appfinder
  xfce4-keyboard-shortcuts
  xfce4-settings-editor
  xfwm4
  keyboards

If you want to access the panel settings, then you can list the contents of the “xfce4-panel” channel:

$ xfconf-query --channel 'xfce4-panel' --list

This command will list all properties that the Xfconf system maintains about the panels and the plugins that you added to them.

To view the value of one specific property, you can specify it on the “xfconf-query” command line—e.g.:

$ xfconf-query --channel 'xfce4-panel' --property '/panels'

Assuming that you are using a dual-panel setup, the output will, then, look like the following:

Value is an array with 2 items:

1
2

Note: The actual panel ids may be different. Under Xubuntu, for instance, panel ids apparently start counting from 0, instead of 1, by default.

You can also list all subproperties of a specific property, like so:

$ xfconf-query --channel 'xfce4-panel' --property '/panels' --list

If you want to obtain not only the names, but also the values of the listed properties, then you can request verbose output:

$ xfconf-query --channel 'xfce4-panel' --property '/panels' --list --verbose

Some values may be displayed as “<<UNSUPPORTED>>”; these are array values, which will get displayed only if you query their specific properties—e.g.:

$ xfconf-query --channel 'xfce4-panel' --property '/panels/panel-1/plugin-ids'

Setting Properties in the “Xfconf” Configuration Storage System

Perhaps contrary to what its name implies, the xfconf-query command can also update values in the Xfconf system. Furthermore, it can optionally create a property if it does not yet exist.

To set a single-valued (i.e., non-array) property, you will have to specify both its type and its value. The following types are supported:

    “bool”—A boolean value, either “true” or “false”;

    “int”—A 32-bit signed integer value, in the range from -2·147·483·648 through 2·147·483·647;

    “uint”—A 32-bit unsigned integer value, in the range from 0 through 4·294·967·295;

    “int64”—A 64-bit signed integer value, in the range from -9·223·372·036·854·775·808 through 9·223·372·036·854·775·807;

    “uint64”—A 64-bit unsigned integer value, in the range from 0 through 18·446·744·073·709·551·615;

    “double”—Presumably a double-precision floating-point value, even though it will be stored as a fixed-point value instead, with six decimal places following the decimal point;

    “string”—A character string.

Of course, the value to which you want to set a property will have to match its type.

(P.S.: Many thanks to ToZ and jharms for pointing out the existence of the additional integer types and of the “double” type.)

Note: Positive integer values can be expressed not only in decimal notation, but also as hexadecimal or octal numbers. For instance, the biggest 32-bit signed integer value is 2147483647, which can also be written as 0x7FFFFFFF (i.e., with a leading "0x" to denote hexadecimal), or as 017777777777 (i.e., with a leading "0" to denote octal). The absolute value of a negative number can also be expressed in any of the three supported notations, e.g., -2147483647 is the same value as -0x7FFFFFFF or as -017777777777. There is one caveat to this feature, however, in that the most negative value—i.e., -2147483648, in the case of 32-bit signed integers—can only be expressed in decimal, since its absolute value (i.e., 2147483648, or 0x80000000, or 020000000000) is out of range for the type.

As an example, you may decide that you want to modify the size of your first panel (i.e., for a horizontal panel, its height, or, for a vertical panel, its width). First, you may want to find out what its current size is:

$ xfconf-query --channel 'xfce4-panel' --property '/panels/panel-1/size'

The following command will, then, modify the panel size to 32:

$ xfconf-query --channel 'xfce4-panel' --property '/panels/panel-1/size' --type int --set 32

The above command will happily update an existing property, but it will refuse to create one that does not yet exist. If you want to make sure that the property will be set, even if it is a new one, then you will have to specify the “--create” option:

$ xfconf-query --channel 'xfce4-panel' --property '/panels/panel-1/size' --create --type int --set 32

To set an array property, you will have to repeat the “--type” and “--set” options for each successive array element. There is no option to remove an element from an array, or to add an element to it; you will have to set the entire array from scratch whenever you want to modify it in any way.

For instance, if you want to add a panel, then you will first have to query the currently active panel ids:

$ xfconf-query --channel 'xfce4-panel' --property '/panels'

Value is an array with 2 items:

1
2

The following command will, then, add a third panel to your setup:

$ xfconf-query --channel 'xfce4-panel' --property '/panels' --type int --set 1 --type int --set 2 --type int --set 3

Even though the new panel will not show up on your desktop, it will have been added to the “/panels” array. To actually display the new panel, you can restart the running panel instance:

$ xfce4-panel --restart

Note that, in order to set up an array, you will have to specify at least two values; if you enter only one value, then the xfconf-query command will create a single-valued property instead. If you ever need to create an array with just a single value, then you will have to use the “--force-array” option—e.g., to request just a single panel:

$ xfconf-query --channel 'xfce4-panel' --property '/panels' --force-array --type int --set 1

Note: The --force-array option is supported, but entirely optional, if you specify multiple values on an array assignment.
Deleting Properties from the “Xfconf” Configuration Storage System

If you created a third panel, as discussed above, and subsequently updated the “/panels” array to remove the new panel again, then any of its properties will remain present in the Xfconf system—as the following command will demonstrate:

$ xfconf-query --channel 'xfce4-panel' --property '/panels/panel-3' --list

Unless you made any modifications to its setup, only the “/panels/panel-3/position” property will be listed.

To delete the value of a property, you can run the xfconf-query command with the “--reset” option—e.g.:

$ xfconf-query --channel 'xfce4-panel' --property '/panels/panel-3/position' --reset

Additionally, if you want to delete a property, and all properties beneath it, then you can add the “--recursive” option to the command:

$ xfconf-query --channel 'xfce4-panel' --property '/panels/panel-3' --reset --recursive

Closing Notes

Once you understand how you can access the “Xfconf” system from the command line, you are ready to study the types of plugins that can be added to the Xfce panels, and the methods to configure them. Some plugins, such as the Clock or the Separator, will keep their configuration entirely within the “Xfconf” storage hierarchy, while other plugins, such as the Network Monitor or the Weather Update, store their settings in external resource files. In addition, the Launcher plugin is a special case, in that it uses “.desktop” files to determine which items it will provide.