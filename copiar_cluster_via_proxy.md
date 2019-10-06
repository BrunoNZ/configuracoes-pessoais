# Como copiar um arquivo do cluster.c3sl diretamente para a máquina local usando um Proxy

1. Copiar as chaves SSH do servidor do C3SL para a máquina local:
    ```bash
    $ mkdir ~/.ssh/c3sl
    $ scp <USUARIO_C3SL>@ssh.c3sl.ufpr.br:~/.ssh/id_rsa* ~/.ssh/c3sl/
    ```
    * Obs.: Cuidado ao executar a cópia das chaves para não sobrescrever as chaves locais. É recomendado fazer um backup das chaves locais antes de executar o comando.

2. Configurar o SSH da máquina local para usar um Proxy para acessar o servidor cluster@c3sl, adicionando ao arquivo `~/.ssh/config` o conteúdo a seguir:
    ```
    Host ssh.c3sl.ufpr.br
      User <USUARIO_C3SL>
    
    Host cluster.c3sl.ufpr.br
      User <USUARIO_C3SL>
      ProxyCommand  ssh ssh.c3sl.ufpr.br -W %h:%p
      IdentityFile  ~/.ssh/c3sl/id_rsa
    ```
    
3. Testar usando o comando `ssh`:
    ```bash
    $ ssh cluster.c3sl.ufpr.br
    ```
    Se estiver tudo correto será realizada a conexão diretamente para o servidor cluster.c3sl
    
4. Usar o comando `scp` normalmente:
    ```bash
    $ scp cluster.c3sl.ufpr.br:~/teste . 
    ```
    
* Observações:
    * Não é necessário inserir o nome do usuário nos comandos `ssh` e `scp` pois o nome do usuário correto já está contido no arquivo `~/.ssh/config`.
    *  Caso deseje facilitar ainda mais os comandos, é possível usar a opção `HostName` para especificar o endereço completo do servidor, e modificar a opção `Host` para algo mais simples. Exemplo:
        ```
        Host ssh.c3sl.ufpr.br
          User <USUARIO_C3SL>
        
        Host cluster
          User <USUARIO_C3SL>
          HostName cluster.c3sl.ufpr.br
          ProxyCommand  ssh ssh.c3sl.ufpr.br -W %h:%p
          IdentityFile  ~/.ssh/c3sl/id_rsa
        ```
        e depois usar simplesmente:
         ```bash
         $ ssh cluster
         $ scp cluster:~/teste .
         ```
      
