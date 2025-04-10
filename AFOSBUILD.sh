rm -rf /opt/ANDRAX/mitmproxy

python3 -m venv /opt/ANDRAX/mitmproxy

source /opt/ANDRAX/mitmproxy/bin/activate

/opt/ANDRAX/mitmproxy/bin/python3 -m pip install wheel setuptools setuptools_rust

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Pip install setup tools... PASS!"
else
  # houston we have a problem
  exit 1
fi

cargo install --locked bpf-linker

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Cargo install BPF-LINKER... PASS!"
else
  # houston we have a problem
  exit 1
fi

/opt/ANDRAX/mitmproxy/bin/pip3 install .

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Pip install local package... PASS!"
else
  # houston we have a problem
  exit 1
fi

cp -Rf andraxbin/* /opt/ANDRAX/bin
rm -rf andraxbin
