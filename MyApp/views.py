import datetime
from django.shortcuts import render, redirect, get_object_or_404
from django.template.loader import get_template
from django.views import View
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from num2words import num2words

from .models import *

# Create your views here.

@login_required
def index(request):
    return render(request, 'index.html',{
        'commande_count' : CommandeClient.objects.count(),
        'user_count' : UserPlus.objects.filter(status='active').count(),
        'approvisionnement_count' : Approvisionnement.objects.count(),
        'proforma_count' : Facture.objects.count(),
        'commande_non_count' : CommandeClient.objects.filter(statut='En attente').count(),
        'approvisionnement_non_count' : Approvisionnement.objects.filter(statut='En attente').count(),
        'needs_non_count' : Besoin.objects.filter(statut='En attente').count(),
        'article_count' : Article.objects.count(),
    })

facture="Error"
all_line ="Error"
toLetter="Error"
########################################################################################################
#Article Part
########################################################################################################

@login_required
def article_list(request):
    return render(request, 'Produit.html',{
        'articles' : Article.objects.all(),
    })
    
def article_delete(request, pk):
    article = get_object_or_404(Article, pk=pk)

    if request.method == 'POST':
        # Supprimez l'article de la base de données.
        article.delete()
        messages.success(request, "Article bien supprimé")
        return redirect('article_list')
    
def article_edit(request, pk):
    article = get_object_or_404(Article, pk=pk)

    if request.method == 'POST':
        # Récupérez les données du formulaire soumises par l'utilisateur.
        article.nom = request.POST['nom']
        article.description = request.POST['description']
        article.quantite_en_stock = request.POST['quantite_en_stock']
        article.prix_unitaire = request.POST['prix_unitaire']
        article.categorie = request.POST['categorie']

        # Enregistrez les modifications dans la base de données.
        article.save()
        messages.success(request, "Article bien modifié")
        return redirect('article_list')
    else:
        return render(request, 'formArticle.html', {
            'article' : article
        })
    
def article_create(request):
    if request.method == 'POST':
        # Récupérez les données du formulaire soumises par l'utilisateur.
        nom = request.POST['nom']
        description = request.POST['description']
        quantite_en_stock = request.POST['quantite_en_stock']
        prix_unitaire = request.POST['prix_unitaire']
        categorie = request.POST['categorie']

        # Créez un nouvel objet Article avec les données du formulaire.
        article = Article(
            nom=nom,
            description=description,
            quantite_en_stock=quantite_en_stock,
            prix_unitaire=prix_unitaire,
            categorie=categorie,
        )

        # Enregistrez l'article dans la base de données.
        article.save()

        return redirect('article_list')
    else:
        return render(request, 'formArticle.html')
    
########################################################################################################
#Fournisseur Part
########################################################################################################

def fournisseur_list(request):
    fournisseurs = Fournisseur.objects.all()
    print(fournisseurs)
    return render(request, 'Fournisseurs.html', {'fournisseurs': fournisseurs})

def fournisseur_create(request):
    if request.method == 'POST':
        nom = request.POST['nom']
        adresse = request.POST['adresse']
        telephone = request.POST['telephone']
        email = request.POST['email']

        fournisseur = Fournisseur(
            nom=nom,
            adresse=adresse,
            telephone=telephone,
            email=email
        )
        fournisseur.save()

        return redirect('fournisseur_list')
    else:
        return render(request, 'formFournisseur.html')

def fournisseur_edit(request, pk):
    fournisseur = get_object_or_404(Fournisseur, pk=pk)

    if request.method == 'POST':
        fournisseur.nom = request.POST['nom']
        fournisseur.adresse = request.POST['adresse']
        fournisseur.telephone = request.POST['telephone']
        fournisseur.email = request.POST['email']
        fournisseur.save()

        return redirect('fournisseur_list')
    else:
        return render(request, 'formFournisseur.html', {'fournisseur': fournisseur})

def fournisseur_delete(request, pk):
    fournisseur = get_object_or_404(Fournisseur, pk=pk)

    if request.method == 'POST':
        fournisseur.delete()
        return redirect('fournisseur_list')
    else:
        return render(request, 'Fournisseurs.html', {'fournisseur': fournisseur})
    
#######################################################################################################
# Client Part
#######################################################################################################

def client_list(request):
    clients = Client.objects.all()
    return render(request, 'Client.html', {'clients': clients})

def client_create(request):
    if request.method == 'POST':
        nom = request.POST['nom']
        adresse = request.POST['adresse']
        telephone = request.POST['telephone']
        email = request.POST['email']

        client = Client(
            nom=nom,
            adresse=adresse,
            telephone=telephone,
            email=email
        )
        client.save()

        return redirect('client_list')
    else:
        return render(request, 'formClient.html')

def client_edit(request, pk):
    client = get_object_or_404(Client, pk=pk)

    if request.method == 'POST':
        client.nom = request.POST['nom']
        client.adresse = request.POST['adresse']
        client.telephone = request.POST['telephone']
        client.email = request.POST['email']
        client.save()

        return redirect('client_list')
    else:
        return render(request, 'formClient.html', {'client': client})

def client_delete(request, pk):
    client = get_object_or_404(Client, pk=pk)

    if request.method == 'POST':
        client.delete()
        return redirect('client_list')
    else:
        return render(request, 'Client.html', {'client': client})

########################################################################################################
#Invoices and invoices details Part
########################################################################################################

def facture_create(request):
    try:
        derniere_facture = Facture.objects.last()
        lastnum = derniere_facture.numero_facture.split("-")
        print(lastnum)
        num = str(int(lastnum[1])+1).zfill(4) 

    except Facture.DoesNotExist:
        num = 1
    # except:
    #     num=1
    if request.method == 'POST':
        # Récupérez les données du formulaire de facture
        client = request.POST['client']
        num=str(int(num)).zfill(4) #Formatage avec 4 chiffres
        # Obtenir l'année actuelle
        current_year = datetime.datetime.now().year
        # Obtenir les deux derniers chiffres de l'année
        num = str(current_year)[-2:]+"-"+num
        today = datetime.date.today()

        # dd/mm/YY
        d1 = today.strftime('%Y-%m-%d')
        print(d1)
        # numero_facture = request.POST['numero_facture']
        montant_total = request.POST['montant_total']
        # Créez la facture
        facture = Facture.objects.create(
            date_facturation=d1,
            numero_facture = num,
            client = client,
            montant_total= montant_total
        )

        # Récupérez les données du formulaire de détails de facture
        articles = request.POST.getlist('article')
        quantites = request.POST.getlist('quantite_vendue')
        prix_unitaires = request.POST.getlist('prix_unitaire_vente')
        montant_total_articles = request.POST.getlist('montant_total_article')
        print(articles, quantites)
        for article, quantite, prix_unitaire, montant_total_article in zip(articles, quantites, prix_unitaires, montant_total_articles):
            DetailFacture.objects.create(
                facture=facture,
                article=article,
                quantite_vendue=quantite,
                prix_unitaire_vente=prix_unitaire,
                montant_total_article = montant_total_article
            )
        messages.success(request, "Enregistrement de la proforma avec succes !")
        return redirect('facture_list')
    
    return render(request, 'formFacture.html', {
        'clients' : Client.objects.all(),
        'last_num' : num,
    })

def facture_edit(request, pk):
    facture = get_object_or_404(Facture, pk=pk)

    if request.method == 'POST':
        # Mettez à jour les données de la facture depuis le formulaire POST
        facture.nom_client = request.POST['nom_client']
        facture.date = request.POST['date']
        facture.save()

        # Mettez à jour les données des détails de la facture depuis le formulaire POST
        articles = request.POST.getlist('article')
        quantites = request.POST.getlist('quantite')
        prix_unitaires = request.POST.getlist('prix_unitaire')

        # Supprimez les détails de facture existants pour cette facture
        facture.details_facture.all().delete()

        for article, quantite, prix_unitaire in zip(articles, quantites, prix_unitaires):
            DetailFacture.objects.create(
                facture=facture,
                article=article,
                quantite=quantite,
                prix_unitaire=prix_unitaire
            )

        return redirect('facture_list')
    else:
        return render(request, 'formFacture.html', {'facture': facture})
    
    
def facture_delete(request, pk):
    facture = get_object_or_404(Facture, pk=pk)
    
    if request.method == 'POST':
        # Supprimer d'abord les détails de facture associés à cette facture
        facture.details_facture.all().delete()
        # Puis supprimer la facture elle-même
        facture.delete()
        return redirect('facture_list')
    
def facture_confirm(request, pk):
    facture = get_object_or_404(Facture, pk=pk)
    
    if request.method == 'POST':
        #avoir la liste des articles en stock
        for instock in facture.details_facture:
            pass
        facture.status = "Confirmé"
        return redirect('facture_list')
    
    return render(request, 'Facture.html', {'facture': facture})

def facture_list(request):
    factures = Facture.objects.all()
    return render(request, 'Facture.html', {'factures': factures})

def separate_milliers(nombre):
    nombre_str = str(nombre)
    result = ''.join([' ' + ch if i > 0 and (len(nombre_str) - i) % 3 == 0 else ch for i, ch in enumerate(nombre_str)])
    return result



def facture_view(request, pk):
    facture = Facture.objects.get(pk=pk)
    if facture.montant_total:
            toLetter = num2words(facture.montant_total, lang='fr')
            facture.montant_total = separate_milliers(int(facture.montant_total))
            facture.date_facturation = facture.date_facturation.strftime("%d-%m-%Y")
            
    all_line = DetailFacture.objects.filter(facture=facture)

    # Parcourir chaque élément de la liste et convertir les champs numériques en entiers
    for line in all_line:
        # Assurez-vous que les champs numériques ne sont pas vides avant de les convertir
        if line.prix_unitaire_vente:
            line.prix_unitaire_vente = separate_milliers(int(line.prix_unitaire_vente))
        
        if line.quantite_vendue:
            line.quantite_vendue = separate_milliers(int(line.quantite_vendue))
        
        if line.montant_total_article:
            line.montant_total_article = separate_milliers(int(line.montant_total_article))

    # Vous pouvez ensuite utiliser la liste mise à jour

    
    return render(request, 'InvoiceModel.html', {
        'facture': facture,
        'all_line' : all_line,
        'toLetter' : toLetter,
        })
    

def factureM_view(request, pk):
    facture = Facture.objects.get(pk=pk)
    if facture.montant_total:
            toLetter = num2words(facture.montant_total, lang='fr')
            facture.montant_total = separate_milliers(int(facture.montant_total))
            facture.date_facturation = facture.date_facturation.strftime("%d-%m-%Y")
            
    all_line = DetailFacture.objects.filter(facture=facture)

    # Parcourir chaque élément de la liste et convertir les champs numériques en entiers
    for line in all_line:
        # Assurez-vous que les champs numériques ne sont pas vides avant de les convertir
        if line.prix_unitaire_vente:
            line.prix_unitaire_vente = separate_milliers(int(line.prix_unitaire_vente))
        
        if line.quantite_vendue:
            line.quantite_vendue = separate_milliers(int(line.quantite_vendue))
        
        if line.montant_total_article:
            line.montant_total_article = separate_milliers(int(line.montant_total_article))

    # Vous pouvez ensuite utiliser la liste mise à jour

    
    return render(request, 'FactureModel.html', {
        'facture': facture,
        'all_line' : all_line,
        'toLetter' : toLetter,
        })
    

########################################################################################################
#Approvisionnement Part
########################################################################################################

def approvisionnement_list(request):
    approvisionnements = Approvisionnement.objects.all()
    return render(request, 'Approvisionnement.html', {
        'approvisionnements': approvisionnements,
    })

def approvisionnement_create(request):
    if request.method == 'POST':
        # Traitez les données du formulaire ici
        date = datetime.date.today()
        fournisseur = request.POST['fournisseur']
        montant_total = request.POST['montant_total']

        # Créez l'approvisionnement
        approvisionnement = Approvisionnement.objects.create(date_approvisionnement=date, fournisseur=fournisseur, montant_total= montant_total)

        # Traitez les détails d'approvisionnement ici
        articles = request.POST.getlist('article')
        quantites = request.POST.getlist('quantite')
        prix_unitaires = request.POST.getlist('prix_unitaire')
        montant_total_article = request.POST.getlist('montant_total_article')

        for article, quantite, prix_unitaire, montant_total_article in zip(articles, quantites, prix_unitaires, montant_total_article):
            DetailApprovisionnement.objects.create(
                approvisionnement=approvisionnement,
                article_id=article,
                quantite=quantite,
                prix_unitaire=prix_unitaire,
                montant_total_article=montant_total_article,
            )
        messages.success(request, "Enregistrement de la requête: succes !")
        return redirect('approvisionnement_list')
    else:
        # Affichez le formulaire de création d'approvisionnement
        return render(request, 'formApprovisionnement.html', {
            'articles' : Article.objects.all(),
        })
        
def approvisionnement_confirm_details(request, pk):
    approvisionnement = get_object_or_404(DetailApprovisionnement, pk=pk)
    approvisionnement.statut="Effectuer"
    approvisionnement.save()
    
    #retirer du stock
    
    article = get_object_or_404(Article, pk=approvisionnement.article.pk)
    article.quantite_en_stock = article.quantite_en_stock + approvisionnement.quantite
    
    article.save()

    #all tasks done
    drap = True
    allApprovisionnement = DetailApprovisionnement.objects.filter(approvisionnement_id = approvisionnement.approvisionnement_id )
    for approvisionnement in allApprovisionnement:
        if approvisionnement.statut == "en_attente":
            print(approvisionnement+" "+ approvisionnement.statut)
            drap = False
    if drap:
        thisApprovisionnement = get_object_or_404(Approvisionnement, pk = approvisionnement.approvisionnement_id )
        print(thisApprovisionnement)
        thisApprovisionnement.statut = "Executer"
        print(thisApprovisionnement)
        thisApprovisionnement.save()
        print("finished")
    messages.success(request, "Enregistrement de la requête avec succes !")
    return redirect('approvisionnement_view', approvisionnement.approvisionnement_id)

def approvisionnement_view(request, pk):
    lignes = DetailApprovisionnement.objects.filter(approvisionnement_id=pk)
    return render(request, 'ApprovisionnementView.html', {
        'lignes': lignes,
        'id': pk,
    })



########################################################################################################
#Commande Part
########################################################################################################

def commande_client_create(request):
    if request.method == 'POST':
        # Traitez les données du formulaire ici
        client = request.POST['client']
        montant_total = request.POST['montant_total']

        # Créez la commande client
        date_commande = datetime.datetime.now()
        commande = CommandeClient.objects.create(
            client=client,
            date_commande=date_commande,
            montant_total=montant_total,
        )

        # Traitez les lignes de commande ici
        articles = request.POST.getlist('article')
        quantites = request.POST.getlist('quantite')
        prix_unitaires = request.POST.getlist('prix_unitaire')
        montants_total_article = request.POST.getlist('montant_total_article')
        description = request.POST.getlist('description')

        for article, quantite, prix_unitaire, montant_total_article, description in zip(articles, quantites, prix_unitaires, montants_total_article, description):
            LigneCommandeClient.objects.create(
                commande=commande,
                article_id=article,
                quantite=quantite,
                prix_unitaire=prix_unitaire,
                montant_total_article=montant_total_article,
                description=description
            )

        messages.success(request, "Enregistrement de la requête avec succes !")
        return redirect('commande_client_list')
    else:
        # Affichez le formulaire de création de commande client
        return render(request, 'formCommande.html', {
            'articles': Article.objects.all(),  # Vous devez remplacer Article par votre modèle d'articles
        })
    
def commande_client_list(request):
    commandes = CommandeClient.objects.all()
    return render(request, 'Commande.html', {'commandes': commandes})

def commande_client_confirm_details(request, pk):
    commande = get_object_or_404(LigneCommandeClient, pk=pk)
    commande.statut="Effectuer"
    commande.save()
    
    #retirer du stock
    
    article = get_object_or_404(Article, pk=commande.article.pk)
    article.quantite_en_stock = article.quantite_en_stock - commande.quantite
    
    article.save()

    #all tasks done
    drap = True
    allCommande = LigneCommandeClient.objects.filter(commande_id = commande.commande_id )
    for commande in allCommande:
        if commande.statut == "en_attente":
            print(commande+" "+ commande.statut)
            drap = False
    if drap:
        thisCommande = get_object_or_404(CommandeClient, pk = commande.commande_id )
        print(thisCommande)
        thisCommande.statut = "Executer"
        print(thisCommande)
        thisCommande.save()
        print("finished")
    messages.success(request, "Enregistrement de la requête avec succes !")
    return redirect('commande_client_view', commande.commande_id)

def commande_client_view(request, pk):
    lignes = LigneCommandeClient.objects.filter(commande_id=pk)
    return render(request, 'CommandeView.html', {
        'lignes': lignes,
        'id': pk,
    })


########################################################################################################
#Needs Part
########################################################################################################

def needs_list(request):
    besoins = Besoin.objects.all()
    return render(request, 'Needs.html', {'besoins': besoins})

def needs_create(request):
    if request.method == 'POST':
        libelle = request.POST['libelle']
        description = request.POST['description']
        date_creation = today = datetime.date.today()

        # dd/mm/YY
        date_creation = today.strftime('%Y-%m-%d')

        need = Besoin.objects.create(
            libelle=libelle,
            description=description,
            date_creation=date_creation,
            statut = "en attente"
        )
        need.save()
        messages.success(request, "Enregistrement de la requête avec succes !")
        return redirect('needs_list')
    else:
        return render(request, 'formNeeds.html')

def needs_confirm(request, pk):
    need = get_object_or_404(Besoin, pk=pk)
    need.statut="Executer"
    need.save()
    return redirect(needs_list)

########################################################################################################
#User Part
########################################################################################################

def users_list(request):
    users = UserPlus.objects.filter(status = 'active')
    return render(request, 'Users.html', {
        'users': users,
        
    })

def users_create(request):
    if request.method == 'POST':
        nom = request.POST['nom']
        prenom = request.POST['prenom']
        email = request.POST['email']
        telephone = request.POST['telephone']
        group = request.POST['group']
        
        user = User.objects.create_user(
            last_name=nom,
            first_name = prenom,
            email=email,
            username = nom[:2]+telephone[:3]+prenom[:2],
            password = nom[:2]+telephone[:3]+prenom[:2],
        )
        user.save()
        
        userplus = UserPlus.objects.create(
            user = user,
            telephone = telephone
        )
        userplus.save()
        userGroup = Group.objects.get(name=group)
        user.groups.add(userGroup)
        messages.success(request, "Enregistrement de la requête avec succes !")
        return redirect('users_list')
    else:
        return render(request, 'formUser.html',{
            'groups' : Group.objects.all()
        })
    
def user_demission(request, pk):
    user = get_object_or_404(UserPlus, user_id=pk)
    user.statut="Executer"
    user.save()
    messages.success(request, "Enregistrement de la requête avec succes !")
    return redirect(users_list)

########################################################################################################
#Other Part
########################################################################################################

def auth(request):
    if request.method=='POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        login(request,user)
        # group_name= ""
        # if (is_electeur(user)):
        #     login(request,user)
        #     return redirect("actuality")		
        # elif (is_admin(user)):
        #     login(request,user)
        #     return redirect("analytic", 1)		
        # elif (is_candidat(user)):
        #     login(request,user)
        #     return redirect("thematique")		
        # else:
        return redirect("index")
    return render(request, 'authentification.html')


@login_required
def deconnexion(request):
	logout(request)
	return redirect("index")

# import os
# from django.conf import settings
# from django.contrib.staticfiles import finders

# def link_callback(uri, rel):
#     """
#     Convert HTML URIs to absolute system paths so xhtml2pdf can access those
#     resources
#     """
    
#     # Assurez-vous que l'URI pointe vers le bon chemin du fichier CSS
    
#     if uri == 'static/assetsInvoice/css/style.css':
#         path = os.path.join(settings.BASE_DIR, 'MyApp/static', uri)
#         print(path)
#         return path

#     result = finders.find(uri)
#     # Le reste du code reste inchangé
#     if result:
#         if not isinstance(result, (list, tuple)):
#             result = [result]
#         result = list(os.path.realpath(path) for path in result)
#         path = result[0]
#     else:
#         sUrl = settings.STATIC_URL
#         sRoot = settings.STATIC_ROOT
#         mUrl = settings.MEDIA_URL
#         mRoot = settings.MEDIA_ROOT

#         if uri.startswith(mUrl):
#             path = os.path.join(mRoot, uri.replace(mUrl, ""))
#         elif uri.startswith(sUrl):
#             path = os.path.join(sRoot, uri.replace(sUrl, ""))
#         else:
#             return uri

#     if not os.path.isfile(path):
#         raise Exception('media URI must start with %s or %s' % (sUrl, mUrl))

#     return path


# # url(r'^my-pdf/$', PDFView.as_view(template_name='my-pdf.html'), name='my-pdf'),

# def topdf(request):

    
#     pdfkit.from_file('test.html', 'out.pdf')
#     pdfkit.from_string('Hello!', 'out.pdf')      
    
#     pdf = pdfkit.from_url('' , 'out.pdf')
        
# def render_pdf_view(request, pk):
#     facture = Facture.objects.get(pk=pk)
#     all_line = DetailFacture.objects.filter(facture=facture)
#     toLetter = num2words(facture.montant_total, lang='fr')
#     template_path = 'InvoiceModel.html'
#     context = {
#         'facture': facture,
#         'all_line' : all_line,
#         'toLetter' : toLetter,
#     }
#     # Create a Django response object, and specify content_type as pdf
#     response = HttpResponse(content_type='application/pdf')
#     response['Content-Disposition'] = 'attachment; filename="report.pdf"'
#     # find the template and render it.
#     template = get_template(template_path)
#     html = template.render(context)

#     # create a pdf
#     pisa_status = pisa.CreatePDF(
#        html, dest=response, link_callback=link_callback)
#     # if error then show some funny view
#     if pisa_status.err:
#        return HttpResponse('We had some errors <pre>' + html + '</pre>')
#     return response

