# bachelor-diploma
Выпускная квалификационная работа (ВКР) бакалавра в LaTeX, оформленная в соответствии с нормоконтролем Московского Авиационного Интитута (МАИ) в 2021 г.

## Сборка

### debian / ubuntu
- установка зависимостей
```bash
sudo apt update
sudo apt install \
    texlive-full
    latexmk \
    install ttf-mscorefonts-installer
```
- сборка
```
make
```
### fedora
- установка зависимостей
```
sudo dnf install texlive-scheme-full
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
```
- сборка
```
make
```
### Docker
```
docker build -t docker-latex .
make docker
```