#                                                                                                         Linux Lightweight Configuration

<p align="center">
<img width="1920px" src="https://github.com/natanbs-dev/linux_lightweight/blob/main/screenshot/deb-print.png" align="center" alt="white" /></br>
 



Este repositório contém configurações recomendadas para o arquivo `sysctl.conf` em sistemas Linux. O `sysctl.conf` é usado para configurar diversos parâmetros do kernel do Linux, ajudando a otimizar o desempenho e a segurança do sistema.

## Aplicando as Configurações

Para aplicar essas configurações, siga os passos a seguir:

1. Abra um arquivo de configuração na pasta `/etc/sysctl.d/` em um editor de texto usando o comando:

   ```bash
   sudo nano /etc/sysctl.d/99-custom-settings.conf
   ```

2. Adicione as configurações recomendadas listadas abaixo ao arquivo (reajuste os valores conforme o seu hardware)

   `**Configurações essenciais:**`

```
	vm.swappiness = 10
	vm.vfs_cache_pressure = 50
```

**Configurações recomendadas:**

   ```bash
	vm.dirty_ratio = 20
	vm.dirty_background_ratio = 10
	vm.dirty_expire_centisecs = 3000
	vm.dirty_writeback_centisecs = 5000
	vm.max_map_count = 262144
	vm.page-cluster = 3
   ```

3. Após adicionar as configurações desejadas, salve o arquivo e feche o editor.

4. Para que as mudanças entrem em vigor, execute o seguinte comando:

   ```bash
   sudo sysctl --system
   ```

Para alterar temporariamente a configuração de `vm.swappiness`, você pode usar o comando:

```bash
sudo sysctl vm.swappiness=10
```

Lembrando que essas configurações são recomendadas e podem ser ajustadas de acordo com as necessidades específicas do seu sistema.

## Comandos Adicionais (internet settings)

Aqui estão algumas configurações adicionais que ainda não foram devidamente testadas. Elas podem ser exploradas para otimização adicional:

### Network / TCP tuning

```bash
net.core.rmem_max = 33554432
net.core.wmem_max = 33554432
net.core.netdev_max_backlog = 250000
net.core.somaxconn = 65535

net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_rmem = 4096 87380 33554432
net.ipv4.tcp_wmem = 4096 65536 33554432
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_timestamps = 1    
net.ipv4.tcp_sack = 1
net.ipv4.tcp_no_metrics_save = 1

net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 0

net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syn_retries = 2
net.ipv4.tcp_max_syn_backlog = 4096
```


Lembre-se de que essas configurações adicionais devem ser usadas com cautela e testadas em um ambiente de desenvolvimento antes de serem aplicadas em produção. Elas podem ajudar a melhorar o desempenho e a segurança do sistema, mas também podem afetar o comportamento do sistema de forma imprevista se não forem configuradas corretamente

