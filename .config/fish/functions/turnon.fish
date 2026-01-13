function turnon
	sudo sh -c 'echo 255 > /sys/class/backlight/10-0045/brightness'
end
