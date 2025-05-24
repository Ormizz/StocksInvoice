from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    
    ############################################################################
    
    path('articles/', views.article_list, name='article_list'),
    # path('articles/<int:pk>/', views.article_detail, name='article_detail'),
    path('articles/create/', views.article_create, name='article_create'),
    path('articles/edit/<int:pk>/', views.article_edit, name='article_edit'),
    path('articles/delete/<int:pk>/', views.article_delete, name='article_delete'),
    
    ####################################################################################
    
    path('fournisseurs/', views.fournisseur_list, name='fournisseur_list'),
    path('fournisseurs/create/', views.fournisseur_create, name='fournisseur_create'),
    path('fournisseurs/edit/<int:pk>/', views.fournisseur_edit, name='fournisseur_edit'),
    path('fournisseurs/delete/<int:pk>/', views.fournisseur_delete, name='fournisseur_delete'),

    ####################################################################################
    
    path('clients/', views.client_list, name='client_list'),
    path('clients/create/', views.client_create, name='client_create'),
    path('clients/edit/<int:pk>/', views.client_edit, name='client_edit'),
    path('clients/delete/<int:pk>/', views.client_delete, name='client_delete'),
    
    ####################################################################################
    
    path('factures/', views.facture_list, name='facture_list'),
    path('facture/create/', views.facture_create, name='facture_create'),
    path('facture/<int:pk>/', views.facture_edit, name='facture_edit'),
    path('facture/<int:pk>/delete/', views.facture_delete, name='facture_delete'),
    path('facture/view/<int:pk>/', views.facture_view, name='facture_view'),
    path('facture/viewM/<int:pk>/', views.factureM_view, name='factureM_view'),
    # path('facture/viewM/<int:pk>/', views.facture_confirm, name='factureM_view'),
    
    ######################################################################################

    path('approvisionnements/', views.approvisionnement_list, name='approvisionnement_list'),
    path('approvisionnements/create/', views.approvisionnement_create, name='approvisionnement_create'),
    path('approvisionnements/view/<int:pk>/', views.approvisionnement_view, name='approvisionnement_view'),
    path('approvisionnements/confirm/<int:pk>/', views.approvisionnement_confirm_details, name='approvisionnement_confirm_details'),


    ######################################################################################

    path('commandes/', views.commande_client_list, name='commande_client_list'),
    path('commandes/create/', views.commande_client_create, name='commande_client_create'),
    path('commandes/view/<int:pk>/', views.commande_client_view, name='commande_client_view'),
    path('commandes/confirm/<int:pk>/', views.commande_client_confirm_details, name='commande_client_confirm_details'),
    
    
    ####################################################################################
    
    path('needs/', views.needs_list, name='needs_list'),
    path('needs/create/', views.needs_create, name='needs_create'),
    path('needs/confirm/<int:pk>/', views.needs_confirm, name='needs_confirm'),
    
    
    ####################################################################################
    
    path('users/', views.users_list, name='users_list'),
    path('users/create/', views.users_create, name='users_create'),
    path('users/demission/<int:pk>/', views.user_demission, name='user_demission'),
    
    
    ######################################################################################
    
    path('auth/', views.auth, name="auth"),
    path('logout/', views.deconnexion, name="logout"),
    # path('pdf_download/<int:pk>/', views.render_pdf_view, name="pdf_download"),
    
]
