<?php
// Settings
$_['setting_replace_eol'] = '0';

// Heading
$_['heading_title'] = 'Kategorien';
$_['heading_title_normal'] = 'CSV Price Pro import/export 4';

// Text global
$_['text_module'] = 'Modules';
$_['text_extension'] = 'Erweiterung';
$_['text_default'] = ' <b>(Vorgabe)</b>';
$_['text_yes'] = 'Ja';
$_['text_no'] = 'Nein';
$_['text_enabled'] = 'Aktiv';
$_['text_disabled'] = 'Inaktiv';
$_['text_select_all'] = 'Alle auswählen';
$_['text_unselect_all'] = 'Alle abwählen';
$_['text_select'] = 'Bitte wählen';
$_['text_show_all'] = 'Alles anzeigen';
$_['text_hide_all'] = 'Nicht markierte ausblenden';
$_['text_all'] = 'Alles';
$_['text_no_results'] = 'Keine Daten!';
$_['text_none'] = ' --- Keine --- ';
$_['text_as'] = 'Wie %s';
$_['text_confirm_delete'] = 'Löschen/Deinstallieren kann nicht rückgängig gemacht werden. Sicher?';

// Text
$_['text_success_macros'] = 'Erfolgreich: Die Makroeinstellungen sind aktualisiert!';
$_['text_import_mode_both'] = 'Aktualisieren und Hinzufügen';
$_['text_import_mode_delete'] = '* Für immer löschen *';
$_['text_import_mode_insert'] = 'Nur hinzufügen';
$_['text_import_mode_update'] = 'Nur aktualisieren';
$_['text_success_import'] = 'Der Datenimport ist abgeschlossen!<br />Es sind insgesamt die <b>%s</b> Zeilen verarbeitet!<br /><br /> Aktualisiert: <b>%s</b><br />Hinzugefügt: <b>%s</b></b><br />Ausgelasst: <b>%s</b>';

// Tabs
$_['tab_export'] = 'Export';
$_['tab_import'] = 'Import';
$_['tab_macros'] = 'Makros';
$_['tab_setting'] = 'Einstellungen';

// Button
$_['button_default'] = 'Standardeinstellung';
$_['button_export'] = 'Export';
$_['button_import'] = 'Import';
$_['button_insert'] = 'Hinzufügen';
$_['button_remove'] = 'Löschen';
$_['button_save'] = 'Speichern';
$_['button_exec'] = 'Ausführen';
$_['button_load'] = 'Laden';

// Entry
$_['entry_file_encoding'] = 'Dateiursprung:';
$_['entry_languages'] = 'Lokalisation:';
$_['entry_category'] = 'Kategorien:';
$_['entry_category_delimiter'] = 'Kategorientrennzeichen:';
$_['entry_csv_delimiter'] = 'CSV-Feldtrennzeichen:';
$_['entry_csv_text_delimiter'] = 'Texttrennzeichen:';
$_['entry_store'] = 'Shops:';
$_['entry_category_parent'] = 'Mit den Stammkategorien exportieren:';
$_['entry_table'] = 'Tabelle';
$_['entry_field_name'] = 'Feldname';
$_['entry_csv_name'] = 'CSV-Header';
$_['entry_caption'] = 'Bezeichnung';
$_['entry_import_mode'] = 'Importmodus:';
$_['entry_key_field'] = 'Schlüsselfeld für die Aktualisierung:';
$_['entry_sort_order'] = 'Reihenfolge';
$_['entry_status'] = 'Status:';
$_['entry_import_category_disable'] = 'Alle Kategorien vor dem Import deaktivieren:';
$_['entry_import_file'] = 'Datenimport aus einer Datei:';
$_['entry_import_img_download'] = 'Hochladen der URL-Bilder aktivieren:';
$_['entry_image_url'] = 'Bilder als URL:';

// Error
$_['error_permission'] = 'Sie haben keine Berechtigung, um dieses Modul zu verwalten!';
$_['error_directory_not_available'] = 'Das Verzeichnis <b>system/csvprice_pro</b> ist für den Datensatz unzugänglich oder existiert nicht';
$_['error_move_uploaded_file'] = 'Fehler beim Kopieren der Datei!';
$_['error_uploaded_file'] = 'Die Datei ist nicht geladen!';
$_['error_copy_uploaded_file'] = 'Die Datei konnte nicht kopiert werden!';
$_['error_export_empty_rows'] = 'Keine Exportdaten!';

// Fields
$_['_ID_'] = 'ID';
$_['_NAME_'] = 'Bezeichnung';
$_['_FILTERS_'] = 'Filter';
$_['_SEO_KEYWORD_'] = 'SEO Keyword';
$_['_META_H1_'] = 'HTML-Tag H1';
$_['_META_TITLE_'] = 'Meta Tag Title';
$_['_META_KEYWORDS_'] = 'Meta Tag Schlüsselwörter';
$_['_META_DESCRIPTION_'] = 'Meta Tag Beschreibung';
$_['_DESCRIPTION_'] = 'Beschreibung';
$_['_IMAGE_'] = 'Bild';
$_['_SORT_ORDER_'] = 'Reihenfolge';
$_['_STATUS_'] = 'Status';
$_['_COLUMN_'] = 'Anzahl Spalten';
$_['_TOP_'] = 'Hauptmenü';
$_['_PARENT_ID_'] = 'ID-Stammkategorien';
$_['_STORE_ID_'] = 'ID-Shops';
$_['_URL_'] = 'URL';

$_['prop_descr'] = ' 
prop_descr[0]="<p><b>CSV-Dateiursprung</b></p><p>Ihr Laden verwendet UTF-8. Um die Probleme mit Import und Export zu vermeiden, verwenden Sie die UTF-8 Kodierung.</p>";
prop_descr[1]="<p><b>CSV-Feldtrennzeichen</b></p><p>Symbol, das als Trennzeichen für die separaten Spalten (Bedeutungen) in der CSV-Datei verwendet sein wird.</p>";
prop_descr[2]="<p><b>Lokalisation</b></p><p>In welcher Sprache werden die Daten exportiert sein, zum Beispiel: Produktname oder Beschreibung</p>";
prop_descr[3]="<p><b>Kategorien</b></p><p>Wenn die Kategorien nicht ausgewählt sind - alle Kategorien werden exportiert (Standardeinstellung).</p>";
prop_descr[4]="<p><b>Kategorientrennzeichen</b></p><p>Trennzeichen zwischen den Kategoriennamen (Verschachtelung der Kategorien), zum Beispiel:<br /><br /><i>Hauptkategorie</i>|<i>Unterkategorie</i></p><p>Wenn das Produkt mehrere Kategorien hat, so werden die Kategorien in Form von den Kategoriennamen wie die Liste geschrieben sein. Jede Kategorie wird mit der neuen Zeile geschrieben sein (Mehrzeilenfeld), zum Beispiel: <br /><br /><i>Hauptkategorie 1</i>|<i>Unterkategorie 2</i><br /><i>Hauptkategorie 3</i>|<i>Unterkategorie 4</i></p>";
prop_descr[5]="<p><b>Mit den Stammkategorien exportieren</b></p><p>Im Kategorienname werden alle Stammkategorien aktiviert, zum Beispiel:<br /><br /><i>Hauptkategorie</i>|<i>Unterkategorie|Kategorie</i></p>";
prop_descr[6]="<p><b>Lokalisation</b></p><p>In welcher Sprache werden die Daten importiert sein, zum Beispiel: Produktname oder Beschreibung</p>";
prop_descr[7]="<p><b>Importmodus</p></b><p><i>Nur aktualisieren</i> - in diesem Modus wird die Kategorie durch ein Schlüsselfeld gesucht und wenn eine Übereinstimmung gefunden ist, so wird die Kategorie aus der CSV-Datei aktualisiert sein.</p><p><i>Nur hinzufügen</i> - in diesem Modus werden alle Kategorien wie die neuen aus der CSV-Datei hinzugefügt sein. Es ist unabhängig diese Kategorien in der Datenbank zu existieren oder nicht.</p><p><i>Aktualisieren und Hinzufügen</i> - in diesem Modus wird die Kategorie durch ein Schlüsselfeld gesucht und wenn eine Übereinstimmung gefunden ist, so wird die Kategorie aus der CSV-Datei aktualisiert sein. Wenn es keine Übereinstimmung gibt, so wird die Kategorie wie die neue hinzugefügt sein.</p>";
prop_descr[8]="<p><b>Schlüsselfeld</b></p><p>Das Schlüsselfeld, in dem die Übereinstimmung der Kategorie in der Datenbank gesucht ist, wird in den Modi <i>Nur aktualisieren</i>, <i>Aktualisieren und Hinzufügen</i> verwendet.</p>";
prop_descr[9]="<p><b>Feldtrennzeichen _CATEGORY_</b></p><p>Trennzeichen zwischen den Kategoriennamen (Verschachtelung der Kategorien), zum Beispiel:<br /><br /><i>Hauptkategorie</i>|<i>Unterkategorie</i></p>";
prop_descr[10]="<p><b>Hochladen der URL-Bilder aktivieren</b></p><p>Die Bilder werden nach den Referenzen in den Feldern _IMAGE_ und _IMAGES_ hochgeladen.</p><p>Die Referenzen sollen sein, wie:<br /><br /> http://www.example.com/dir/image_name.jpg</p>";
prop_descr[11]="<p><b>Texttrennzeichen</b></p><p>CSV-Datei, die auch Anführungszeichen als Trennzeichen haben.<br />E.g.: \"Smith\",\"Pete\",\"Canada\", zitat alle Textzellen.</p>";
prop_descr[32]="<p><b>Bilder als URL</b></p><p>Exports value _IMAGE_ and _IMAGES_ als URL. E.g.: http://www.example.com/dir/image_name.jpg</p>";
';