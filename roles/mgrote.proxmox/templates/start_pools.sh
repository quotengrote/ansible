#! /bin/bash
{% raw %}
# starte/stoppe Container
sudo pvesh get /pools/$1 | sed -r 's#(,)#\n#g;s#\│##g;s#─##g;s#┴##g;s#└##g;s#┘##g;s#╞##g;s#╪##g;s#═##g;s#╡##g;s#\{##g;s#\}##g;s#\"*\"##g;s#\[##g;s#\]##g;s#id\:##g' | grep -E 'lxc/[[:digit:]]{3}' | sed -r 's#(lxc\/)([0-9]{3})#\2#g' | sudo xargs -i  --verbose pct "$2" {}

# starte/stoppe VMs
sudo pvesh get /pools/$1 | sed -r 's#(,)#\n#g;s#\│##g;s#─##g;s#┴##g;s#└##g;s#┘##g;s#╞##g;s#╪##g;s#═##g;s#╡##g;s#\{##g;s#\}##g;s#\"*\"##g;s#\[##g;s#\]##g;s#id\:##g' | grep -E 'qemu/[[:digit:]]{3}' | sed -r 's#(qemu\/)([0-9]{3})#\2#g' | sudo xargs -i  --verbose qm "$2" {}
{% endraw %}
