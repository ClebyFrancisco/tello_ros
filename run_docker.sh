# Precisa desse comando todas as vezes que for rodar o docker
xhost si:localuser:root

docker run -it \
           --privileged \
           --name tello_dji_2 \
           --net=host \
           --env="DISPLAY" \
           --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
           --volume="$HOME/Documents/projeto_tcc:/root/tello_ros_ws/src:rw" \
           -e QT_X11_NO_MITSHM=1 \
           dji_tello_2 \
           bash