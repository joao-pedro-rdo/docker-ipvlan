
# Usando containers docker com IP próprio na rede

⚠️ Certifique-se de alterar os IP para sua rede local de maneira correta

```bash
docker network create -d ipvlan \
  --subnet=192.168.0.0/24 \
  --gateway=192.168.0.1 \
  -o parent=wlp2s0 \
  my_ipvlan_wifi_network
```

Este comando cria uma rede Docker utilizando o driver `ipvlan`. Aqui está uma explicação detalhada dos parâmetros utilizados:

- `docker network create`: Este comando é usado para criar uma nova rede no Docker.
- `d ipvlan`: Especifica que o driver de rede a ser usado é `ipvlan`. O `ipvlan` permite que os contêineres recebam endereços IP diretamente da rede física, tornando-os diretamente acessíveis na rede local.
- `-subnet=192.168.0.0/24`: Define a sub-rede para a rede Docker, neste caso, `192.168.0.0/24`. Isso significa que os endereços IP variam de `192.168.0.1` a `192.168.0.254`.
- `-gateway=192.168.0.1`: Define o gateway para a rede Docker, que será `192.168.0.1`.
- `o parent=wlp2s0`: Especifica a interface de rede física pai que o Docker usará. Neste caso, `wlp2s0` é o nome da interface de rede Wi-Fi.
- `my_ipvlan_wifi_network`: Este é o nome atribuído à rede Docker criada.

Este comando cria uma rede Docker chamada `my_ipvlan_wifi_network` que utiliza a interface Wi-Fi `wlp2s0` e permite que os contêineres conectados a esta rede usem endereços IP da sub-rede `192.168.0.0/24`.

### Verifique se a rede foi criada corretamente

```bash
docker network ls
```

### Inspecione a rede

```bash
docker network inspect my_ipvlan_wifi_network
```

---

### Usando um docker compose para levantar um container na rede criada

Você pode conferir o arquivo completo em [docker-compose.yaml](https://github.com/joao-pedro-rdo/docker-ipvlan/blob/main/docker-compose.yml)
  
