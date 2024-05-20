run_command() {
	case $1 in
		1) gnome-terminal -- bash -c "export TURTLEBOT3_MODEL=waffle_pi; ros2 run turtlebot3_teleop teleop_keyboard";;
		2) gnome-terminal -- bash -c "export TURTLEBOT3_MODEL=waffle_pi; ros2 launch turtlebot3_cartographer cartographer.launch.py";;
		3) ros2 run nav2_map_server map_saver_cli -f ~/map;;
		4) gnome-terminal -- bash -c "export TURTLEBOT3_MODEL=waffle_pi; ros2 launch turtlebot3_navigation2 navigation2.launch.py map:=$HOME/map.yaml";;
	esac
}
while true
do
	bash -c "clear"
	echo "Seleziona numero (exit with Ctrl+c)"
	echo "1) Teleop"
	echo "2) Cartographer"
	echo "3) Salvataggio mappa"
	echo "4) Navigation con la mappa (Cartographer deve essere attivo)"
	read -p "Numero: " choice
	run_command $choice
done
