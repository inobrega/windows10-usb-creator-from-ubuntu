#!/bin/bash

# Script para criar um pen drive bootável do Windows 10

# Lista dispositivos e permite ao usuário escolher
echo "Listando todos os dispositivos de armazenamento disponíveis..."
DISPOSITIVOS=$(lsblk -d -n -p -o NAME,SIZE,MODEL | awk '{print NR-1 " - " $0}')
echo "$DISPOSITIVOS"

# Pede ao usuário para escolher um dispositivo
echo "Por favor, escolha o número correspondente ao seu pen drive:"
read -p "Digite o número: " NUMERO_ESCOLHIDO
PEN_DRIVE=$(echo "$DISPOSITIVOS" | awk -v numero=$NUMERO_ESCOLHIDO 'NR == numero+1 {print $3}')

# Confirmação do dispositivo escolhido
echo "Você selecionou $PEN_DRIVE. Tenha certeza de que é o correto, pois todos os dados nele serão perdidos!"
read -p "Você tem certeza de que deseja continuar? (s/n): " CONFIRM
if [ "$CONFIRM" != "s" ]; then
  echo "Script abortado pelo usuário."
  exit 1
fi

# Pedindo ao usuário o caminho da imagem ISO do Windows 10
read -p "Insira o caminho completo para a imagem ISO do Windows 10: " ISO_PATH

# Desmonta todas as partições do pen drive
echo "Desmontando todas as partições do pen drive..."
sudo umount ${PEN_DRIVE}*

# Cria uma nova tabela de partição GPT no pen drive
echo "Criando nova tabela de partição GPT..."
sudo gdisk ${PEN_DRIVE} <<EOF
o
y
n
1

+550M
ef00
w
y
EOF

# Formata a partição como FAT32
echo "Formatando a partição como FAT32..."
sudo mkfs.fat -F32 ${PEN_DRIVE}1

# Montando a imagem ISO
MOUNT_POINT="/mnt/windows10iso"
echo "Montando a imagem ISO..."
mkdir -p ${MOUNT_POINT}
sudo mount -o loop ${ISO_PATH} ${MOUNT_POINT}

# Montando o pen drive
USB_MOUNT_POINT="/mnt/windows10usb"
echo "Montando o pen drive..."
mkdir -p ${USB_MOUNT_POINT}
sudo mount ${PEN_DRIVE}1 ${USB_MOUNT_POINT}

# Copiando arquivos da ISO para o pen drive
echo "Copiando arquivos para o pen drive. Isso pode levar alguns minutos..."
sudo cp -r ${MOUNT_POINT}/* ${USB_MOUNT_POINT}/

# Desmontando ISO e pen drive
echo "Desmontando a imagem ISO e o pen drive..."
sudo umount ${MOUNT_POINT}
sudo umount ${USB_MOUNT_POINT}

echo "O pen drive bootável do Windows 10 está pronto!"