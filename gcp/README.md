# GCP

Проект для тестирования примитивного деплоя в GCP.

### main.gcp.yml

Инвентари для ansible, для корректно работы требует добавления в конфиг `gcp_compute` в строку `enable_plugins` секции `[inventory]`:   
```
grep '\[inventory\]' ~/.ansible.cfg -A3
[inventory]
# enable inventory plugins, default: 'host_list', 'script', 'yaml', 'ini', 'auto'
enable_plugins = yaml, script, gcp_compute
```

Внесите в него необходимую информацию(так как в 2.7.1 и младше не работает подбор этих данных из переменных окружения):   
* идентификатор(ы) проекта:
```
projects:
  - genial-reporter-220618
```

* зоны:
```
zones:
  - europe-west1-b
```

* путь до файла с ключом доступа
```
service_account_file: /home/svmikhailov/.ssh/d0645f000670.json
```

Так же добавьте в свой сетевые настройки dns_search для своего домена, например:   
```
grep search /etc/resolv.conf 
# configured search domains.
search genial-reporter-220618.newrushbolt.space
```


### main.tf

Собственно файл проекта для terraform.


### post_install.sh

Файл, скачиваемый с мастера в конце создания VM и запускаемый.   
Делает подготовительную подготовку.   
