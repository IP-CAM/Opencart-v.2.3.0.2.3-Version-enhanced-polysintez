<?php
// Settings
$_['setting_replace_eol'] = '0';

// Heading
$_['heading_title'] = 'Producteurs';
$_['heading_title_normal'] = 'CSV Price Pro import/export 4';

// Text global
$_['text_module'] = 'Modules';
$_['text_extension'] = 'Extensions';
$_['text_default'] = '<b>(par d&eacute;faut)</b>';
$_['text_yes'] = 'Oui';
$_['text_no'] = 'Non';
$_['text_enabled'] = 'Activ&eacute;';
$_['text_disabled'] = 'D&eacute;sactiv&eacute;';
$_['text_select_all'] = 'Tout s&eacute;lectionner';
$_['text_unselect_all'] = 'Tout d&eacute;s&eacute;lectionner';
$_['text_select'] = 'S&eacute;lection';
$_['text_show_all'] = 'Montrer tous';
$_['text_hide_all'] = 'Cacher pas marqué';
$_['text_all'] = 'Tous';
$_['text_no_results'] = 'Aucun r&eacute;sultat!';
$_['text_none'] = ' --- Aucun --- ';
$_['text_confirm_delete'] = 'La suppression ne peut pas être annulée! Êtes-vous sûr de vouloir faire cela?';

// Text
$_['text_import_mode_both'] = 'Mettre à jour et Ajouter';
$_['text_import_mode_insert'] = 'Seulement ajouter';
$_['text_import_mode_update'] = 'Seulement mettre à jour';
$_['text_success_import'] = 'L\'importation de données est terminée!<br />Total traité <b>%s</b> lignes!<br /><br /> Mise à jour: <b>%s</b><br />Ajouté: <b>%s</b></b><br />Ignoré: <b>%s</b>';

// Tabs
$_['tab_export'] = 'Exportation';
$_['tab_import'] = 'Importation';
$_['tab_macros'] = 'Macros';

// button
$_['button_export'] = 'Exportation';
$_['button_import'] = 'Importation';

// Entry
$_['entry_manufacturer'] = 'Producteurs:';
$_['entry_file_encoding'] = 'Codage de fichier:';
$_['entry_languages'] = 'Localisation:';
$_['entry_csv_delimiter'] = 'Séparateur de champs CSV:';
$_['entry_store'] = 'Magasins:';
$_['entry_import_mode'] = 'Mode d\'importation:';
$_['entry_key_field'] = 'Champ clé pour la mise à jour:';
$_['entry_sort_order'] = 'Ordre de tri';
$_['entry_status'] = 'Statut:';
$_['entry_import_file'] = 'Importation de données à partir de fichier:';
$_['entry_import_img_download'] = 'Activer le téléchargement d\'images par URL:';
$_['entry_import_id'] = 'Importer id du producteur à partir de fichier:';
$_['entry_image_url'] = 'Images de URL:';

// Helper
$_['help_export_file_encoding'] = 'Codage de fichier. Votre magasin travaille dans le codage UTF-8';
$_['help_export_csv_delimiter'] = 'Séparateur de champs de format CSV';
$_['help_import_mode'] = 'Dans les modes  Seulement mettre à jour et Mettre à jour et Ajouter, la recherche dans la base se réalise par le champ clé, si une correspondance est trouvée alors la mode avec la mise à jour est sélectionné';
$_['help_import_key_field'] = 'Le champ clé par laquelle on cherche la coïncidence de la position dans la base, et en cas de découverte la mise à jour se réalise';
$_['help_import_img_download'] = 'Le champ avec l\'image _IMAGE_ doit contenir le URL-lien pour téléchargement';
$_['help_export_all_manufacturer'] = 'Si les producteurs ne sont pas sélectionnés - exporte tous les producteurs';
$_['help_import_id'] = 'Au l\'ajout d\'un nouveau producteur de la position le shamp _ID_ sera importé comme manufacturer_id. manufacturer_id peut être importé que si le même id n\'est pas dans la base.';

$_['prop_descr'] = ' 
prop_descr[0]="<p><b>Codage de CSV-fichier</b></p><p>fichier</b></p><p>Votre magasin travaille dans le codage UTF-8, pour éviter les problèmes avec l\'importation et l\'exportation utilisez le codage UTF-8.</p>";
prop_descr[1]="<p><b>Séparateur de champs CSV</b></p><p>Symbole qui sera utilisé comme séparateur pour les colonnes individuels (valeurs) dans le CSV-fichier.</p>";
prop_descr[2]="<p><b>Localisation</b></p><p>Quelle langue des données seront importées, par exemple le nom du producteur ou la description du producteur</p>";
prop_descr[3]="<p><b>Magasins</b></p><p>Si les magasins ne sont pas sélectionnés - exporte les producteurs de toutes les magasins (par défaut).</p>";
prop_descr[4]="<p><b>Producteurs</b></p><p>Si les producteurs ne sont pas sélectionnés - exporte toutes les producteurs (par défaut).</p>";
prop_descr[5]="<p><b>Mode d\'importation</p></b><p><i>Seulement mettre à jour</i> - dans ce mode la recherche du producteur se réalise par le champ clé, et si une correspondance est trouvée alors le producteur sera mise à jour à partir de CSV-fichier.</p><p><i>Seulement ajouter</i> - dans ce mode toutes les catégories seront ajoutés comme nouveaux à partir de CSV-fichier indépendamment du fait ces catégories se présentent dans la base du magasin ou non.</p><p><i>Mettre à jour et Ajouter</i> - dans ce mode la recherche du marchandise se réalise par le champ clé, si une correspondance est trouvée alors la catégorie sera mise à jour à partir de CSV-fichier, si aucune correspondance n\'est pas trouvée alors la catégorie sera ajouté comme nouvelle.</p>";
prop_descr[6]="<p><b>Champ clé</b></p><p>Le champ clé par laquelle on cherche la coïncidence du producteur dans la base du magasin, est utilisé dans les modes <i>Seulement mettre à jour</i>, <i>Mettre à jour et Ajouter</i>.</p>";
prop_descr[7]="<p><b>Importer id du producteur à partir de fichier</b></p><p>Au l\'ajout d\'un nouveau producteur le shamp _ID_ sera importé comme manufacturer_id, l\'importation se fait à condition que ce manufacturer_id n\'est pas dans la base du magasin et le nombre ne dépasse pas la valeur maximum admissible pour manufacturer_id.</p>";
prop_descr[8]="<p><b>Activer le téléchargement d\'images par URL</b></p><p>Télécharge les images sur les liens dans les champs _IMAGE_ et _IMAGES_.</p><p>Les liens doivent être de type:<br /><br /> http://www.example.com/dir/image_name.jpg</p>";
prop_descr[32]="<p><b>Image de URL</b></p><p>Exports value _IMAGE_ and _IMAGES_ as URL.<br />E.g.: http://www.example.com/dir/image_name.jpg</p>";
';

// Error
$_['error_permission'] = 'Vous n\'avez pas les droits pour la gestion de ce module!';
$_['error_directory_not_available'] = 'Le répertoire <b>system/csvprice_pro</b> n\'est pas disponible pour la prise ou n\'existe pas';
$_['error_move_uploaded_file'] = 'L\'erreur de copie de fichier!';
$_['error_uploaded_file'] = 'Le fichier n\'est pas téléchargé!';
$_['error_copy_uploaded_file'] = 'Impossible de copier le fichier!';
$_['error_export_empty_rows'] = 'Pas de données pour l\'exportation!';

// Fields
$_['_ID_'] = 'id de catégorie';
$_['_NAME_'] = 'Nom';
$_['_SEO_KEYWORD_'] = 'SEO Keyword';
$_['_META_H1_'] = 'HTML-balise H1';
$_['_META_TITLE_'] = 'Meta-balise Title';
$_['_META_KEYWORDS_'] = 'Meta-balise Keywords';
$_['_META_DESCRIPTION_'] = 'Meta-balise Description';
$_['_DESCRIPTION_'] = 'Texte de description';
$_['_IMAGE_'] = 'Image';
$_['_SORT_ORDER_'] = 'Ordre de tri';
$_['_STATUS_'] = 'Statut';
$_['_STORE_ID_'] = 'id de magasins';
$_['_URL_'] = 'URL de producteur';