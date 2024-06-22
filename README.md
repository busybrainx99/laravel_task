# DETAILED PROJECT STEPS

### I first provisioned two vms
<img width="563" alt=" For a complete reference, please see the online documentation at" src="https://github.com/busybrainx99/laravel_task/assets/105159710/7ef4f057-c90d-43a1-b2f9-80e325ccc262">

### sshed into the master
<img width="549" alt="Screenshot 2024-04-20 at 22 08 44" src="https://github.com/busybrainx99/laravel_task/assets/105159710/49c30c4f-4ddb-4e34-bd64-a774c302c5b3">

### sshed into the slave
<img width="540" alt="Screenshot 2024-04-20 at 22 09 10" src="https://github.com/busybrainx99/laravel_task/assets/105159710/40734b09-9582-4183-bc84-7e043c0cda1d">

### Created the readable and reusable script on the master and ran it to make sure it the script works 
<img width="519" alt="Get 2 httpports ubuntu comubuntu-ports mantic-updates InRelease 109 k" src="https://github.com/busybrainx99/laravel_task/assets/105159710/c8a14a5a-408a-4707-92fc-491de5484f35">

<img width="1060" alt="Screenshot 2024-04-20 at 19 29 56" src="https://github.com/busybrainx99/laravel_task/assets/105159710/08108667-6e0a-4709-a329-878cd66ec19e">

### Result of the script on the master (Notice the ip of the working site is the same as my master ip)
<img width="1431" alt="Screenshot 2024-04-20 at 20 28 24" src="https://github.com/busybrainx99/laravel_task/assets/105159710/db59092a-73dd-42bc-968a-b3ad13b271f9">

## ANSIBLE CONFIGURATION
### Made my ansible directory.
### Created my playbook, config file, hosts file and host_vars directory to hold my variables. Then I moved the working script to my ansible directory.
### Wrote my playbook and configuration file and hosts file.
<img width="887" alt="Screenshot 2024-04-20 at 22 06 00" src="https://github.com/busybrainx99/laravel_task/assets/105159710/227a6a6a-1c43-49b2-a014-6389ec488c85">


### Ran my ssh-keygen to create a key pair
![IMG_1014](https://github.com/busybrainx99/laravel_task/assets/105159710/077ed0e4-4b18-4c52-a15c-d72fb069698e)

### Copied the public key to my slave machine.
<img width="852" alt="Screenshot 2024-04-20 at 21 13 37" src="https://github.com/busybrainx99/laravel_task/assets/105159710/44d86002-7fcc-4df6-acfa-fca37d6252d2">

### I  placed the ip in my /etc/hosts file and gave it a variable name ansible_node1. 
### I tried running the ansible command to ping the slave but previously I didn’t install ansible so it didn’t’ work.
<img width="802" alt="Screenshot 2024-04-19 at 15 28 24" src="https://github.com/busybrainx99/laravel_task/assets/105159710/442b5d12-1e33-4146-a3fd-9fb6f0c8b8f4">

### With ansible now installed, I pinged the slave server and it responded 
<img width="832" alt="No services need to be restarted" src="https://github.com/busybrainx99/laravel_task/assets/105159710/9dc380c6-abde-4d7d-b82c-31671da97e5e">

### Had to also sudo visudo in my slave machine to edit my user not to need sudo password
<img width="325" alt="Screenshot 2024-04-20 at 22 11 40" src="https://github.com/busybrainx99/laravel_task/assets/105159710/fd7951a7-1795-4110-9f8e-e22611fa9599">

<img width="447" alt="Screenshot 2024-04-20 at 21 23 18" src="https://github.com/busybrainx99/laravel_task/assets/105159710/27c20fa6-ad8b-43d8-8f6c-76ade95cd36a">

## Ran the play, the laravel site, the accessibility test and the cronjob all working. Play succesfully ran.
<img width="936" alt="Screenshot 2024-04-20 at 21 49 39" src="https://github.com/busybrainx99/laravel_task/assets/105159710/290d5f55-b8ad-404a-bbd3-f40be0f2fc77">

### Result on my slave machine  (Notice the ip of the working site is the same as my slave ip)
<img width="1439" alt="Screenshot 2024-04-20 at 21 52 10" src="https://github.com/busybrainx99/laravel_task/assets/105159710/9c0df832-9cd0-458f-a01a-2367552ed89d">

### Cron job on my slave
<img width="543" alt="Screenshot 2024-04-19 at 16 13 06" src="https://github.com/busybrainx99/laravel_task/assets/105159710/9efb4cbb-3407-4555-9010-fce211d03606">

### Lastly,I pushed the laravel.sh and laravel.yml file to my github
![IMG_1013](https://github.com/busybrainx99/laravel_task/assets/105159710/3da84608-595a-445c-aa7e-4ef70404d532)
