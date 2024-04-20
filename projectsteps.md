# DETAILED PROJECT STEPS

### I first provisioned two vms
<img width="563" alt=" For a complete reference, please see the online documentation at" src="https://github.com/busybrainx99/laravel_task/assets/105159710/7ef4f057-c90d-43a1-b2f9-80e325ccc262">

### sshed into the master
<img width="540" alt="Screenshot 2024-04-20 at 20 22 54" src="https://github.com/busybrainx99/laravel_task/assets/105159710/bb42b8b6-9389-4327-80b8-62ae95f57cb4">

### sshed into the slave
<img width="539" alt="Screenshot 2024-04-20 at 20 23 35" src="https://github.com/busybrainx99/laravel_task/assets/105159710/a516f386-79af-4d74-ad7b-302059f2b4c9">

### Created the readable and reusable script on the master and ran it to make sure it the script works 
<img width="519" alt="Get 2 httpports ubuntu comubuntu-ports mantic-updates InRelease 109 k" src="https://github.com/busybrainx99/laravel_task/assets/105159710/c8a14a5a-408a-4707-92fc-491de5484f35">

<img width="1060" alt="Screenshot 2024-04-20 at 19 29 56" src="https://github.com/busybrainx99/laravel_task/assets/105159710/08108667-6e0a-4709-a329-878cd66ec19e">

### Result of the script on the master (Notice the ip of the working site is the same as my master ip)
<img width="1431" alt="Screenshot 2024-04-20 at 20 28 24" src="https://github.com/busybrainx99/laravel_task/assets/105159710/db59092a-73dd-42bc-968a-b3ad13b271f9">

## ANSIBLE CONFIGURATION
### Made my ansible directory.
### Created my playbook, config file and hosts file. Then I moved the working script to my ansible directory.
### Wrote my playbook and configuration file and hosts file.
<img width="828" alt="Screenshot 2024-04-19 at 15 05 30" src="https://github.com/busybrainx99/laravel_task/assets/105159710/a3c50d6f-adc3-4c80-aa71-065189cd3424">

### Ran my ssh-keygen to create a key pair and then copied the public key to my slave machine.
<img width="833" alt="Screenshot 2024-04-19 at 15 17 05" src="https://github.com/busybrainx99/laravel_task/assets/105159710/1cfb9beb-6a6a-443e-be06-bddd985dc5c1">

### I  placed the ip in my /etc/hosts file and gave it a variable name ansible_node1. 
### I tried running the ansible command to ping the slave but previously I didn’t install ansible so it didn’t’ work.
<img width="802" alt="Screenshot 2024-04-19 at 15 28 24" src="https://github.com/busybrainx99/laravel_task/assets/105159710/442b5d12-1e33-4146-a3fd-9fb6f0c8b8f4">

### With ansible now installed, I pinged the slave server and it responded 
<img width="832" alt="No services need to be restarted" src="https://github.com/busybrainx99/laravel_task/assets/105159710/9dc380c6-abde-4d7d-b82c-31671da97e5e">

## Ran the play the first time, the laravel site was working but the cron job didn’t run. I fixed it and now everything ran.
### First try with successful laravel
<img width="854" alt="Screenshot 2024-04-19 at 16 04 14" src="https://github.com/busybrainx99/laravel_task/assets/105159710/a0204851-6082-41d7-aa7e-e0556b5f2c98">

### Second try with successful cronjob
<img width="821" alt="Screenshot 2024-04-19 at 16 04 47" src="https://github.com/busybrainx99/laravel_task/assets/105159710/b8f3e044-436c-409a-afe7-4a4943709b45">

### Result on my slave machine  (Notice the ip of the working site is the same as my slave ip)
<img width="1438" alt="Screenshot 2024-04-19 at 16 11 40" src="https://github.com/busybrainx99/laravel_task/assets/105159710/d2d05ac1-ff1d-4c50-bd53-5c09f1ad22d1">

### Cron job on my slave
<img width="543" alt="Screenshot 2024-04-19 at 16 13 06" src="https://github.com/busybrainx99/laravel_task/assets/105159710/9efb4cbb-3407-4555-9010-fce211d03606">

### Lastly,I pushed the laravel.sh and laravel.yml file to my github
![IMG_1013](https://github.com/busybrainx99/laravel_task/assets/105159710/3da84608-595a-445c-aa7e-4ef70404d532)


