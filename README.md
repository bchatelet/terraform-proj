Développements pour la certification </br>
</br>Rncp Rncp-36061
TP - Administrateur système DevOps
Arborescence : </br>
-Le répertoire "modules" à la racine, contient les modules terraform,  des projets "proj" et "proj1"
-proj : déploiement d'un serveur Mongodb sur un serveur Ec2, avec un disque Ebs de 5 Gig et un firewall basé sur les security groups</br>
</br>
-proj1 : déploiement d'un cluster Ec2 avec un serveur maitre, contenant l'application Spark, et deux serveurs esclaves.  </br>
</br>
-proj2 : déploiement d'un de l'application Spark-Apache à partir du service Emr de Aws. Les modules utilisés sous dans le sous répertoire modules du projet. </br>
</br>

</br>
Pour deployer tous les projets, se placer dans le répertorie du projet puis: 
```bash
terraform init
terraform validate
terraform plan
terraform apply
```


##Proj: </br>
Pour deployer l'infra (plus de details dans le déploiement dans le fichier readme du dossier):</br>
</br>

## Proj 1:</br>
</br>


## Proj 2: </br>
</br>

