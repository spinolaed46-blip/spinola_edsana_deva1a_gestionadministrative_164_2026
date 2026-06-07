"""Gestion des "routes" FLASK et des données pour les postes (anciennement films).
Fichier : gestion_films_crud.py
Auteur : OM 2022.04.11 (Adapté pour t_poste)
"""
from pathlib import Path

from flask import redirect
from flask import request
from flask import session
from flask import url_for
from flask import flash
from flask import render_template

from APP_FILMS_164 import app
from APP_FILMS_164.database.database_tools import DBconnection
from APP_FILMS_164.erreurs.exceptions import *
from APP_FILMS_164.films.gestion_films_wtf_forms import FormWTFUpdateFilm, FormWTFAddFilm, FormWTFDeleteFilm

"""Ajouter un poste grâce au formulaire "film_add_wtf.html" """
@app.route("/film_add", methods=['GET', 'POST'])
def film_add_wtf():
    form_add_film = FormWTFAddFilm()
    if request.method == "POST":
        try:
            if form_add_film.validate_on_submit():
                nom_film_add = form_add_film.nom_film_add_wtf.data

                valeurs_insertion_dictionnaire = {"value_nom_film": nom_film_add}
                print("valeurs_insertion_dictionnaire ", valeurs_insertion_dictionnaire)

                # CORRECTION : Utilisation de t_poste
                strsql_insert_film = """INSERT INTO t_poste (id_poste, nom_poste) VALUES (NULL, %(value_nom_film)s) """
                with DBconnection() as mconn_bd:
                    mconn_bd.execute(strsql_insert_film, valeurs_insertion_dictionnaire)

                flash(f"Données insérées !!", "success")
                return redirect(url_for('films_genres_afficher', id_film_sel=0))

        except Exception as Exception_genres_ajouter_wtf:
            raise ExceptionGenresAjouterWtf(f"fichier : {Path(__file__).name}  ;  "
                                            f"{film_add_wtf.__name__} ; "
                                            f"{Exception_genres_ajouter_wtf}")

    return render_template("films/film_add_wtf.html", form_add_film=form_add_film)


"""Editer(update) un poste sélectionné"""
@app.route("/film_update", methods=['GET', 'POST'])
def film_update_wtf():
    id_film_update = request.values['id_film_btn_edit_html']
    form_update_film = FormWTFUpdateFilm()
    try:
        if request.method == "POST" and form_update_film.submit.data:
            nom_film_update = form_update_film.nom_film_update_wtf.data

            valeur_update_dictionnaire = {"value_id_film": id_film_update,
                                          "value_nom_film": nom_film_update}

            # CORRECTION : Modification de t_poste
            str_sql_update_nom_film = """UPDATE t_poste SET nom_poste = %(value_nom_film)s WHERE id_poste = %(value_id_film)s"""

            with DBconnection() as mconn_bd:
                mconn_bd.execute(str_sql_update_nom_film, valeur_update_dictionnaire)

            flash(f"Donnée mise à jour !!", "success")
            return redirect(url_for('films_genres_afficher', id_film_sel=id_film_update))

        elif request.method == "GET":
            # CORRECTION : Sélection depuis t_poste avec alias pour l'HTML
            str_sql_id_film = "SELECT id_poste as id_film, nom_poste as nom_film FROM t_poste WHERE id_poste = %(value_id_film)s"
            valeur_select_dictionnaire = {"value_id_film": id_film_update}

            with DBconnection() as mybd_conn:
                mybd_conn.execute(str_sql_id_film, valeur_select_dictionnaire)

            data_film = mybd_conn.fetchone()
            form_update_film.nom_film_update_wtf.data = data_film["nom_film"]

    except Exception as Exception_film_update_wtf:
        raise ExceptionFilmUpdateWtf(f"fichier : {Path(__file__).name}  ;  "
                                     f"{film_update_wtf.__name__} ; "
                                     f"{Exception_film_update_wtf}")

    return render_template("films/film_update_wtf.html", form_update_film=form_update_film)


"""Effacer(delete) un poste sélectionné"""
@app.route("/film_delete", methods=['GET', 'POST'])
def film_delete_wtf():
    data_film_delete = None
    btn_submit_del = None
    id_film_delete = request.values['id_film_btn_delete_html']
    form_delete_film = FormWTFDeleteFilm()

    try:
        if form_delete_film.submit_btn_annuler.data:
            return redirect(url_for("films_genres_afficher", id_film_sel=0))

        if form_delete_film.submit_btn_conf_del_film.data:
            data_film_delete = session['data_film_delete']
            flash(f"Effacer le poste de façon définitive de la BD !!!", "danger")
            btn_submit_del = True

        if form_delete_film.submit_btn_del_film.data:
            valeur_delete_dictionnaire = {"value_id_film": id_film_delete}

            # CORRECTION : Suppression dans t_poste
            str_sql_delete_film = """DELETE FROM t_poste WHERE id_poste = %(value_id_film)s"""
            with DBconnection() as mconn_bd:
                mconn_bd.execute(str_sql_delete_film, valeur_delete_dictionnaire)

            flash(f"Poste définitivement effacé !!", "success")
            return redirect(url_for('films_genres_afficher', id_film_sel=0))

        if request.method == "GET":
            valeur_select_dictionnaire = {"value_id_film": id_film_delete}

            # CORRECTION : Sélection depuis t_poste
            str_sql_genres_films_delete = """SELECT id_poste as id_film, nom_poste as nom_film FROM t_poste WHERE id_poste = %(value_id_film)s"""

            with DBconnection() as mydb_conn:
                mydb_conn.execute(str_sql_genres_films_delete, valeur_select_dictionnaire)
                data_film_delete = mydb_conn.fetchall()
                session['data_film_delete'] = data_film_delete

            btn_submit_del = False

    except Exception as Exception_film_delete_wtf:
        raise ExceptionFilmDeleteWtf(f"fichier : {Path(__file__).name}  ;  "
                                     f"{film_delete_wtf.__name__} ; "
                                     f"{Exception_film_delete_wtf}")

    return render_template("films/film_delete_wtf.html",
                           form_delete_film=form_delete_film,
                           btn_submit_del=btn_submit_del,
                           data_film_del=data_film_delete
                           )