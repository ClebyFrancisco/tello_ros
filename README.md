# dji tello Docker

- Para buildar a imagem usar o comando:
```shell
sh build_docker.sh
```
- Para subir o container usar o comando:
```shell
sh run_docker.sh
```

### Observações
- O container já inicia com o source do ros dado devido ao entrypoint.sh
- Todas as vezes que reiniciar o PC, você deve dar um comando `docker start tello_dji_2` para subir o container e deve dar o comando `xhost si:localuser:root` para habilitar o uso das interfaces gráficas
- Após startar o container use o comando para entrar no container:
```shell
docker exec -it tello_dji_2 bash
```
- A primeira vez que você subir o container, já terá acesso ao terminal, depois que fechar essa execução, é necessário startar o container novamente pelo comando docker start e entrar pelo comando docker exec.