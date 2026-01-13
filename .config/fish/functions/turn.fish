function turn
	sudo fish -c "echo $argv[1] > /sys/class/backlight/10-0045/brightness"
end
