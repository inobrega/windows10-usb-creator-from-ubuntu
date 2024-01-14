# Criação de Pen Drive Bootável do Windows 10

Este script automatiza o processo de criação de um pen drive bootável com a imagem ISO do Windows 10. Ele foi projetado para ser executado em sistemas operacionais baseados em Ubuntu/Linux.

## Pré-requisitos

Antes de começar, certifique-se de ter o seguinte:
- Um pen drive com pelo menos 8GB de espaço livre.
- A imagem ISO do Windows 10, que pode ser baixada do [site oficial da Microsoft](https://www.microsoft.com/software-download/windows10).
- Um sistema operacional baseado em Ubuntu/Linux para executar o script.

## Instruções de Uso

Siga os passos abaixo para usar o script:

### Passo 1: Preparar o Script

1. Salve o script em um arquivo chamado `create_windows10_usb.sh`.
2. Abra o terminal e navegue até o diretório onde o script está salvo.
3. Dê permissão de execução ao script com o comando:


````bash
chmod +x create_windows10_usb.sh
````

### Passo 2: Executar o Script

1. Execute o script com privilégios de superusuário:

````bash
sudo ./create_windows10_usb.sh
````
2. Siga as instruções na tela. O script irá:
- Listar os dispositivos de armazenamento disponíveis.
- Pedir para você escolher o pen drive (cuidado para escolher o correto!).
- Solicitar o caminho completo para a imagem ISO do Windows 10.

### Passo 3: Conclusão do Processo

- Após fornecer as informações necessárias, o script irá preparar o pen drive e copiar os arquivos da ISO para ele.
- Uma vez concluído, o script notificará que o pen drive bootável do Windows 10 está pronto.

## Avisos Importantes

- **Cuidado ao escolher o dispositivo de pen drive**: Escolher o dispositivo errado pode resultar na perda de dados importantes de outros dispositivos.
- **Faça backup de dados importantes**: Todos os dados no pen drive serão apagados durante o processo.
- **Verifique o caminho da ISO**: Certifique-se de que o caminho fornecido para a imagem ISO do Windows 10 está correto.

## Suporte

Para suporte, sugestões ou contribuições, por favor abra uma issue neste repositório.

---

Desenvolvido com ❤️ por [Ilson Nóbrega](https://github.com/inobrega) para a Comunidade.
