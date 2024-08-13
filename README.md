Développements pour la certification **Rncp Rncp-36061**
TP - Administrateur système DevOps


Arborescence : 


-**proj0** : déploiement d'un serveur Mongodb sur un serveur Ec2, avec un disque Ebs de 5 Gig et un firewall basé sur les security groups


-**proj0a** : déploiement d'un serveur Mongodb à l'aide du service Ecs-Aws (gestionnaire de conteneurs)


-**proj1**: déploiement d'un de l'application Spark-Apache  avec un serveur maitre, contenant l'application Spark, et deux serveurs esclaves.  


-**proj2** : déploiement d'un de l'application Spark-Apache à partir du service Emr-Aws de Aws. 


-**proj3**: projet de test pour la mise en ouevre de github actions 



-**scripts**: scripts Python de tests de chargement de données Csv, depuis un bucket s3 vers MongoDb. 

Pour deployer tous les projets, se placer dans le répertorie du projet puis: 
```bash
terraform init
terraform validate
terraform plan
terraform apply
```



</br>
