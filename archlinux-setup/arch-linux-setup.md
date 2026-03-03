c## arch linux = install


## disk
cfdisk /dev/nvme0n1

> **formatação**
> 	1. crie primeiramente 1G para o /boot
> 	2. entre na opção de type e escolha a tipagem como EFI para essa partição de 1G mencionada antes
> 	3. criado a partição de boot, utilize o resto do espaço para a partição raiz
> 	4. entre na opçaõ [WRITE] e confirme as alterações

### resumo do cfdisk

> particione o disk mencionado antes da instalação com o archinstall, separando, 1G para o boot, sendo colocado o tipo como EFI system

> com o espaço disponível, use como a partição raiz

### formatando as partições e montando

> tendo feito o passo anterior, confirme com o comando lsblk para verificar se foram criadas as partições corretamente:
> 	lsblk 

> confirmadas, formate as duas partições seguindo esse padrão, lembrando, primeiramente a partição de boot e em segundo a raiz, que serão colocadas com os números 5 e 6 para exemplo
> 	**formatando partições: FAT32 e EXT4:**
> 	mkfs.fat -F32 /dev/nvme0n1p5
> 	mkfs.ext4 /dev/nvme0n1p6
> 	**montagem:**
> 	mount /dev/nvme0n1p6 /mnt
> 	mkdir /mnt/boot
> 	mount /dev/nvme0n1p5 /mnt/boot/
> 	**consulte:**
> 	lsblk