
# Configuração de Rede Docker com `ipvlan` e Docker Compose


Este repositório fornece um guia passo a passo sobre como configurar uma rede Docker utilizando o driver ipvlan e como usar Docker Compose para levantar um contêiner na rede criada.

## Visão Geral

Neste repositório, você encontrará instruções detalhadas para:

1. **Criar uma Rede Docker com `ipvlan`**: Aprenda a configurar uma rede Docker usando o driver `ipvlan`, que permite que contêineres obtenham endereços IP da mesma faixa que a rede do host. Isso é útil para criar redes mais isoladas e escaláveis.

2. **Configurar Docker Compose**: Utilize um arquivo `docker-compose.yml` para definir e iniciar contêineres na rede Docker configurada. O Docker Compose simplifica o processo de configuração e gerenciamento de contêineres, permitindo que você defina serviços e suas configurações em um único arquivo.


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
- `-gateway=192.168.0.1`: Define o gateway para a rede Docker, que será `192.168.0.1`(IP do meu roteador wifi).
- `o parent=wlp2s0`: Especifica a interface de rede física pai que o Docker usará. Neste caso, `wlp2s0` é o nome da interface de rede Wi-Fi do meu laptop, você deve alterar de acordo com suas interfaces.
- `my_ipvlan_wifi_network`: Este é o nome atribuído à rede Docker criada, mude para oq desejar porem deve sempre usar esse nome.

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

Use docker-compose up para iniciar os serviços definidos.

Contribuição
Contribuições são bem-vindas! Se você encontrar algum problema ou tiver sugestões de melhorias, sinta-se à vontade para abrir uma issue ou enviar um pull request.

Licença
Este projeto está licenciado sob a Licença MIT.
