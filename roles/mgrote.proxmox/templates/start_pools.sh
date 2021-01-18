#! /bin/bash
{% raw %}
# starte/stoppe Container
sudo pvesh get /pools/$1 | sed -r 's#(,)#\n#g;s#\│##g;s#─##g;s#┴##g;s#└##g;s#┘##g;s#╞##g;s#╪##g;s#═##g;s#╡##g;s#\{##g;s#\}##g;s#\"*\"##g;s#\[##g;s#\]##g;s#id\:##g' | grep -E 'lxc/[[:digit:]]{3}' | sed -r 's#(lxc\/)([0-9]{3})#\2#g' | sudo xargs -i sh -c "pct "$2" {} || true"

# starte/stoppe VMs
sudo pvesh get /pools/$1 | sed -r 's#(,)#\n#g;s#\│##g;s#─##g;s#┴##g;s#└##g;s#┘##g;s#╞##g;s#╪##g;s#═##g;s#╡##g;s#\{##g;s#\}##g;s#\"*\"##g;s#\[##g;s#\]##g;s#id\:##g' | grep -E 'qemu/[[:digit:]]{3}' | sed -r 's#(qemu\/)([0-9]{3})#\2#g' | sudo xargs -i sh -c "qm "$2" {} || true"
{% endraw %}
