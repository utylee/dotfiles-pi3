function turnoff
	sudo sh -c 'echo 0 > /sys/class/backlight/10-0045/brightness'
end
