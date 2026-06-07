"""Gestion des formulaires avec WTF pour les employés
Fichier : gestion_films_wtf_forms.py
Auteur : OM 2022.04.11 (Adapté pour t_employe)
"""
from flask_wtf import FlaskForm
from wtforms import StringField
from wtforms import SubmitField
from wtforms.validators import Length

class FormWTFAddFilm(FlaskForm):
    """
        Formulaire pour AJOUTER un employé
    """
    nom_film_add_wtf = StringField("Nom de l'employé ", validators=[Length(min=2, max=50, message="Entre 2 et 50 caractères")])
    submit = SubmitField("Enregistrer l'employé")


class FormWTFUpdateFilm(FlaskForm):
    """
        Formulaire pour MODIFIER un employé
    """
    nom_film_update_wtf = StringField("Modifier le nom de l'employé", validators=[Length(min=2, max=50, message="Entre 2 et 50 caractères")])
    submit = SubmitField("Mettre à jour l'employé")


class FormWTFDeleteFilm(FlaskForm):
    """
        Formulaire pour SUPPRIMER un employé
    """
    nom_film_delete_wtf = StringField("Employé à effacer")
    submit_btn_del_film = SubmitField("Effacer définitivement")
    submit_btn_conf_del_film = SubmitField("Êtes-vous sûr d'effacer ?")
    submit_btn_annuler = SubmitField("Annuler")