#!/bin/bash
# Enable flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak_applications=$(cat ./flatpak-applications.txt)
total=$(wc -l < flatpak-applications.txt)
run=0


date >> ./fail.log
for app in $flatpak_applications
do
    # Install apps and display errors on log file
    flatpak install flathub $app -y > /dev/null 2>> ./fail.log
    run=$((run+1))
    echo "Instalando flatpaks $run/$total.."
done

echo "Operação finalizada, cheque o aquivo ./fail.log para mais informações"
