from datetime import timezone
from django.db import models
from django.contrib.auth.models import User, Group

# Create your models here.

class Fournisseur(models.Model):
    nom = models.CharField(max_length=100)
    adresse = models.CharField(max_length=200)
    telephone = models.CharField(max_length=15)
    email = models.EmailField()

    def __str__(self):
        return self.nom

class Article(models.Model):
    nom = models.CharField(max_length=100)
    description = models.TextField()
    quantite_en_stock = models.PositiveIntegerField()
    prix_unitaire = models.DecimalField(max_digits=10, decimal_places=2)
    categorie = models.CharField(max_length=50)

    def __str__(self):
        return self.nom

class Client(models.Model):
    nom = models.CharField(max_length=100)
    adresse = models.CharField(max_length=200)
    telephone = models.CharField(max_length=15)
    email = models.EmailField()

    def __str__(self):
        return self.nom

class Facture(models.Model):
    numero_facture = models.CharField(max_length=255, unique=True)
    date_facturation = models.DateField()
    montant_total = models.DecimalField(max_digits=20, decimal_places=2)
    client = models.CharField(max_length=255, default="")
    status = models.CharField(max_length=255, default="Attente", null=True, blank=True)

    def __str__(self):
        return self.numero_facture

class DetailFacture(models.Model):
    facture = models.ForeignKey(Facture, on_delete=models.CASCADE)
    # article = models.ForeignKey(Article, on_delete=models.CASCADE)
    article = models.CharField(max_length=255)
    quantite_vendue = models.PositiveIntegerField()
    prix_unitaire_vente = models.DecimalField(max_digits=20, decimal_places=2)
    montant_total_article = models.DecimalField(max_digits=20, decimal_places=2)


    def __str__(self):
        return f"{self.facture.numero_facture} - {self.article.nom}"
    

class CommandeClient(models.Model):
    client = models.CharField(max_length=255, default='')
    date_commande = models.DateTimeField(auto_now_add=True)
    statut = models.CharField(max_length=255, default='En attente')
    montant_total = models.DecimalField(max_digits=20, decimal_places=2, null=True, blank=True)
    date_commande = models.DateField()
    
    def __str__(self):
        return f"{self.statut} - {self.pk}"

class LigneCommandeClient(models.Model):
    commande = models.ForeignKey(CommandeClient, on_delete=models.CASCADE)
    article = models.ForeignKey(Article, on_delete=models.CASCADE)
    quantite = models.PositiveIntegerField()
    prix_unitaire = models.DecimalField(max_digits=20, decimal_places=2)
    montant_total_article = models.DecimalField(max_digits=20, decimal_places=2, null=True, blank=True)
    description = models.TextField(default='')
    statut = models.CharField(max_length=20, default='En attente')
    
    def __str__(self):
        return f"Ligne de commande {self.id} de {self.commande}"

    def montant_total(self):
        return self.quantite * self.prix_unitaire


class Approvisionnement(models.Model):
    fournisseur = models.CharField(max_length=255, default='')
    date_approvisionnement = models.DateField()
    articles = models.ManyToManyField('Article', through='DetailApprovisionnement')
    statut = models.CharField(max_length=20, default='En attente')
    montant_total = models.DecimalField(max_digits=20, decimal_places=2, null=True, blank=True)
    
    def __str__(self):
        return f"Approvisionnement #{self.id} du {self.date_approvisionnement}"

   
class DetailApprovisionnement(models.Model):
    approvisionnement = models.ForeignKey(Approvisionnement, on_delete=models.CASCADE)
    article = models.ForeignKey(Article, on_delete=models.CASCADE)
    quantite = models.PositiveIntegerField()
    prix_unitaire = models.DecimalField(max_digits=20, decimal_places=2)
    montant_total_article = models.DecimalField(max_digits=20, decimal_places=2, null=True, blank=True)
    statut = models.CharField(max_length=20, default='En attente')
    
    def __str__(self):
        return f"Approvisionnement #{self.approvisionnement} - {self.article}"
    
    class Meta:
        permissions = [
            ('confirm_appro', 'confirmer les approvisionnements')
        ]
    
class Besoin(models.Model):
    libelle = models.CharField(max_length=255)
    description = models.TextField()
    date_creation = models.DateTimeField(auto_now_add=True)
    statut = models.CharField(max_length=25, default="En attente")

    def __str__(self):
        return self.libelle


class UserPlus(models.Model):
    user = models.OneToOneField(User, on_delete=models.SET_NULL, default="", null=True, blank=True)
    telephone = models.CharField(max_length=10)
    status = models.CharField(max_length=25, default="active")