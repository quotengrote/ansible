## mgrote.docker-compose-deploy

### Beschreibung
Klont Repositories und startet die darin enthaltenen `docker-compose`-Projekte.
Die `docker-compose.yml` muss im Repository-Root liegen.

### Getestet auf
- [x] Ubuntu (>=20.04)

### Variablen + Defaults
```
# Directory where all Repos get saved
docker_compose_base_dir: /home/mg/docker

# Dictionary of Repositories
docker_compose_projects:
  - name: homer                                         # Name of Project, is also the dir_name if it isn't set
    dir_name: docker-homer                              # Directory-Name where the repo is saved; optional; just dont let it empty, remove it
    repository_url: git.mgrote.net/mg/docker-homer.git  # URL to repository, WITHOUT protocol; only https supported
    repository_user: mg                                 # git user for login on private Repositories; optional; just dont let it empty, remove it
    repository_user_password: k1BvXXXXXXXrbg            # git user password for login on private Repositories; optional; just dont let it empty, remove it
    network_name: homer-network                         # docker-network to create; optional; just dont let it empty, remove it
    state: present|absent                               # should the project be present or absent?
    git_branch: master                                  # branch to checkout; optional; just dont let it empty, remove it
```


### Benötigt
- `geerlingguy.docker`
