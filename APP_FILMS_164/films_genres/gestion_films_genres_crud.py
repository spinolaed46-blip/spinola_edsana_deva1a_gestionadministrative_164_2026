"""
    Fichier : gestion_films_genres_crud.py
    Auteur : OM 2021.05.01 (Adapté pour t_poste)
    Gestions des "routes" FLASK et des données pour l'affichage des postes.
"""
from pathlib import Path

from flask import render_template
from flask import flash
from flask import redirect
from flask import request
from flask import session
from flask import url_for

from APP_FILMS_164.database.database_tools import DBconnection
from APP_FILMS_164.erreurs.exceptions import *

"""
    Nom : films_genres_afficher
    But : Afficher les postes à la place de la grille des films.
"""


@app.route("/films_genres_afficher/<int:id_film_sel>", methods=['GET', 'POST'])
def films_genres_afficher(id_film_sel):
    print(" films_genres_afficher id_film_sel ", id_film_sel)
    data_genres_films_afficher = []
    if request.method == "GET":
        try:
            with DBconnection() as mc_afficher:
                if id_film_sel == 0:
                    strsql_genres_films_afficher_data = """SELECT id_poste as id_film, nom_poste as nom_film, 
                                                                NULL as duree_film, description as description_film, 
                                                                NULL as cover_link_film, NULL as date_sortie_film,
                                                                'Poste' as GenresFilms 
                                                                FROM t_poste 
                                                                ORDER BY id_poste ASC"""
                    mc_afficher.execute(strsql_genres_films_afficher_data)
                else:
                    valeur_id_film_selected_dictionnaire = {"value_id_film_selected": id_film_sel}
                    strsql_genres_films_afficher_data = """SELECT id_poste as id_film, nom_poste as nom_film, 
                                                                NULL as duree_film, description as description_film, 
                                                                NULL as cover_link_film, NULL as date_sortie_film,
                                                                'Poste' as GenresFilms 
                                                                FROM t_poste 
                                                                WHERE id_poste = %(value_id_film_selected)s"""
                    mc_afficher.execute(strsql_genres_films_afficher_data, valeur_id_film_selected_dictionnaire)

                data_genres_films_afficher = mc_afficher.fetchall()

                if not data_genres_films_afficher and id_film_sel == 0:
                    flash("""La table "t_poste" est vide !""", "warning")
                else:
                    flash(f"Données des postes affichées !", "success")

        except Exception as Exception_films_genres_afficher:
            raise ExceptionFilmsGenresAfficher(f"fichier : {Path(__file__).name}  ;  {films_genres_afficher.__name__} ;"
                                               f"{Exception_films_genres_afficher}")

    return render_template("films_genres/films_genres_afficher.html", data=data_genres_films_afficher)


"""
    Les fonctions suivantes sont simplifiées pour éviter tout conflit.
"""


@app.route("/edit_genre_film_selected", methods=['GET', 'POST'])
def edit_genre_film_selected():
    # 1. On récupère l'ID du poste cliqué
    id_film_edit = request.values['id_film_genres_edit_html']
    session['session_id_film_genre_edit'] = id_film_edit

    with DBconnection() as mc_edit:
        # 2. Infos du poste
        strsql_poste = "SELECT id_poste as id_film, nom_poste as nom_film, description as description_film FROM t_poste WHERE id_poste = %(id_poste)s"
        mc_edit.execute(strsql_poste, {"id_poste": id_film_edit})
        data_film = mc_edit.fetchone()

        # 3. Genres NON attribués (ceux qu'on peut ajouter)
        strsql_genres_non = "SELECT id_justification as id_genre, type_justification as intitule_genre FROM t_justification WHERE id_justification NOT IN (SELECT fk_justification FROM t_poste_justification WHERE fk_poste = %(id_poste)s)"
        mc_edit.execute(strsql_genres_non, {"id_poste": id_film_edit})
        data_genres_non = mc_edit.fetchall()

        # 4. Genres DÉJÀ attribués (ceux qui seront en violet)
        strsql_genres_att = "SELECT id_justification as id_genre, type_justification as intitule_genre FROM t_justification INNER JOIN t_poste_justification ON id_justification = fk_justification WHERE fk_poste = %(id_poste)s"
        mc_edit.execute(strsql_genres_att, {"id_poste": id_film_edit})
        data_genres_att = mc_edit.fetchall()

    return render_template("films_genres/films_genres_modifier_tags.html",
                           data_film_selected=[data_film], # On met dans une liste car ton HTML fait un for loop
                           data_genres_non_attribues=data_genres_non,
                           data_genres_attribues=data_genres_att)


@app.route("/update_genre_film_selected", methods=['GET', 'POST'])
def update_genre_film_selected():
    if request.method == "POST":
        id_film_edit = session['session_id_film_genre_edit']
        # On récupère tous les IDs sélectionnés dans le menu tagselect
        ids_justifications_selectionnes = request.form.getlist('name_select_tags')

        with DBconnection() as mc_update:
            # 1. Supprimer toutes les anciennes associations pour ce poste
            strsql_del = "DELETE FROM t_poste_justification WHERE fk_poste = %(fk_poste)s"
            mc_update.execute(strsql_del, {"fk_poste": id_film_edit})

            # 2. Ajouter les nouvelles associations
            for id_justification in ids_justifications_selectionnes:
                strsql_insert = "INSERT INTO t_poste_justification (fk_poste, fk_justification) VALUES (%(fk_poste)s, %(fk_justification)s)"
                mc_update.execute(strsql_insert, {"fk_poste": id_film_edit, "fk_justification": id_justification})

        flash("Modifications enregistrées avec succès !", "success")

    return redirect(url_for('films_genres_afficher', id_film_sel=0))

def genres_films_afficher_data(valeur_id_film_selected_dict):
    return [], [], []