#!/bin/sh



#{ 1.00000000,  0.18172716,  0.00000000, }, /* 1000K */
#    { 1.00000000,  0.42322816,  0.00000000, },
#    { 1.00000000,  0.54360078,  0.08679949, },
#    { 1.00000000,  0.64373109,  0.28819679, },
#    { 1.00000000,  0.71976951,  0.42860152, },
#    { 1.00000000,  0.77987699,  0.54642268, },
#    { 1.00000000,  0.82854786,  0.64816570, },
#    { 1.00000000,  0.86860704,  0.73688797, },
#    { 1.00000000,  0.90198230,  0.81465502, },
#    { 1.00000000,  0.93853986,  0.88130458, },
#    { 1.00000000,  0.97107439,  0.94305985, },
#    { 1.00000000,  1.00000000,  1.00000000, }, /* 6500K */
#    { 0.95160805,  0.96983355,  1.00000000, },
#    { 0.91194747,  0.94470005,  1.00000000, },
#    { 0.87906581,  0.92357340,  1.00000000, },
#    { 0.85139976,  0.90559011,  1.00000000, },
#    { 0.82782969,  0.89011714,  1.00000000, },
#    { 0.80753191,  0.87667891,  1.00000000, },
#    { 0.78988728,  0.86491137,  1.00000000, }, /* 10000K */
#    { 0.77442176,  0.85453121,  1.00000000, },

# hp home laptop setup
set_lap(){
xrandr --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VGA-1 --off --output HDMI-1 --off --output DP-1 --off
}


#hp homelaptop + Monitor
set_multmon(){
xrandr --output LVDS-1 --primary --mode 1366x768 --pos 277x1080 --rotate normal --output VGA-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off
}

MonitorSetup(){
PS3="Selet the monitor setup?"  
options=("Laptop" "MultiMon" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Laptop")
	echo "your choice is $REPLY."
            echo "activating $opt setup"
	    set_lap 
	    break
	    ;;
        "MultiMon")
            echo "your choice is $REPLY"
            echo "activating $opt setup"
            set_multmon
	    break
	    ;;
#        "Option 3")
#            echo "you chose choice $REPLY which is $opt"
#            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

NightLight(){

PS3="Select the Brightness and Color setup"
options=("Day Light" "NightMode" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Day Light")
	echo "your choice is $REPLY."
            echo "activating $opt setup"
		xrandr --output LVDS-1 --gamma 1:1:1 --brightness 1.0  #default brightness
		xrandr --output VGA-1  --gamma 1:1:1 --brightness 1.0  #default brightness
	    break
	    ;;
        "NightMode")
            echo "your choice is $REPLY"
            echo "activating $opt setup"
		xrandr --output LVDS-1 --gamma 1.1:0.8:0.7 --brightness 0.8 	#Nightmode nightlight
		xrandr --output VGA-1  --gamma 1.1:0.8:0.7 --brightness 0.8  #Nightmode brightness
	    break
	    ;;
#        "Option 3")
#            echo "you chose choice $REPLY which is $opt"
#            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}


echo "You can set up the monitor config &night color in this setup"
PS3="What do you want to do?"
options=("Set Monitor" "Set Color" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Set Monitor")
		echo "your choice is $REPLY."
            echo "activating $opt setup"
	    MonitorSetup
	    break

	    ;;
        "Set Color")
            echo "your choice is $REPLY"
            echo "activating $opt setup"
		NightLight
	    break
	    ;;
#        "Option 3")
#            echo "you chose choice $REPLY which is $opt"
#            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
