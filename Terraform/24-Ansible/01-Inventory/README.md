```
 45  mkdir 01-Inventory
   46  ls
   47  cd 01-Inventory/
   48  ls
   49  vim inventory
   50  ls
   51  cd 
   52  vim /root/.ssh/my-ssh-key.pem
   53  chmod 400 /root/.ssh/my-ssh-key.pem
   54  cd - 
   55  ls
   56  ansible all -i inventory -u amitvashist -m ping --key=/root/.ssh/my-ssh-key.pem 
   57  ansible all -i inventory -u amitvashist -m command -a 'df -h'  --key=/root/.ssh/my-ssh-key.pem 
   58  ansible all -i inventory -u amitvashist -m command -a 'cat /etc/os-release'  --key=/root/.ssh/my-ssh-key.pem 
   59  ansible all -i inventory -u amitvashist -m command -a 'cat /etc/* -release'  --key=/root/.ssh/my-ssh-key.pem 
   60  ansible all -i inventory -u amitvashist -m command -a 'cat /etc/*-release'  --key=/root/.ssh/my-ssh-key.pem 
   61  ansible all -i inventory -u amitvashist -m shell  -a 'cat /etc/*-release'  --key=/root/.ssh/my-ssh-key.pem 
```
