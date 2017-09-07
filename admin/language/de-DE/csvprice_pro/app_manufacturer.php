<?php
// Settings
$_['setting_replace_eol'] = '0';

// Heading
$_['heading_title'] = 'Hersteller';
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
$_['text_as'] = 'wie %s';
$_['text_confirm_delete'] = 'Löschen/Deinstallieren kann nicht rückgängig gemacht werden. Sicher?';

// Text
$_['text_import_mode_both'] = 'Aktualisieren und Hinzufügen';
$_['text_import_mode_insert'] = 'Nur hinzufügen';
$_['text_import_mode_update'] = 'Nur aktualisieren';
$_['text_success_import'] = 'Der Datenimport ist abgeschlossen!<br />Es sind insgesamt die <b>%s</b> Zeilen verarbeitet!<br /><br /> Aktualisiert: <b>%s</b><br />Hinzugefügt: <b>%s</b></b><br />Ausgelasst: <b>%s</b>';

// Tabs
$_['tab_export'] = 'Export';
$_['tab_import'] = 'Import';
$_['tab_macros'] = 'Makros';

// button
$_['button_export'] = 'Export';
$_['button_import'] = 'Import';

// Entry
$_['entry_manufacturer'] = 'Hersteller:';
$_['entry_file_encoding'] = 'Dateiursprung:';
$_['entry_languages'] = 'Lokalisation:';
$_['entry_csv_delimiter'] = 'CSV-Feldtrennzeichen:';
$_['entry_csv_text_delimiter'] = 'Texttrennzeichen:';
$_['entry_store'] = 'Shops:';
$_['entry_import_mode'] = 'Importmodus:';
$_['entry_key_field'] = 'Schlüsselfeld für die Aktualisierung:';
$_['entry_sort_order'] = 'Reihenfolge';
$_['entry_status'] = 'Status:';
$_['entry_import_file'] = 'Datenimport aus einer Datei:';
$_['entry_import_img_download'] = 'Hochladen der URL-Bilder aktivieren:';
$_['entry_import_id'] = 'ID-Hersteller aus der Datei importieren:';
$_['entry_image_url'] = 'Bilder als URL:';

// Helper
$_['help_export_file_encoding'] = 'Dateiursprung. Ihr Laden verwendet UTF-8';
$_['help_export_csv_delimiter'] = 'РCSV-Feldtrennzeichen';
$_['help_import_mode'] = 'In den Modi Nur aktualisieren und Aktualisieren und Hinzufügen wird es durch ein Schlüsselfeld in der Datenbank gesucht, wenn eine Übereinstimmung gefunden ist, so wird der Modus mit der Aktualisierung ausgewählt';
$_['help_import_key_field'] = 'Das Schlüsselfeld, in dem die Übereinstimmung der Position in der Datenbank gesucht ist, und im Falle der Auffindung es wird aktualisiert';
$_['help_import_img_download'] = 'Das Feld mit dem Bild _IMAGE_ soll die URL-Referenz für den Download enthalten';
$_['help_export_all_manufacturer'] = 'Wenn der Hersteller nicht ausgewählt sind - alle Hersteller werden exportiert';
$_['help_import_id'] = 'Wenn der neue Hersteller der Position hinzugefügt wird, wird das Feld _ID_ wie manufacturer_id importiert. manufacturer_id kann nur importiert werden, wenn es glechen ID in der Datenbank nicht gibt.';

$_['prop_descr'] = ' 
prop_descr[0]="<p><b>CSV-Dateiursprung</b></p><p>Ihr Laden verwendet UTF-8. Um die Probleme mit Import und Export zu vermeiden, verwenden Sie die UTF-8 Kodierung.</p>";
prop_descr[1]="<p><b>CSV-Feldtrennzeichen</b></p><p>Symbol, das als Trennzeichen für die separaten Spalten (Bedeutungen) in der CSV-Datei verwendet sein wird.</p>";
prop_descr[2]="<p><b>Lokalisation</b></p><p>In welcher Sprache werden die Daten exportiert sein, zum Beispiel: Name oder Beschreibung des Herstellers</p>";
prop_descr[3]="<p><b>Shops</b></p><p>Wenn die Shops nicht ausgewählt sind - die Hersteller werden aus allen Shops exportiert (Standardeinstellung).</p>";
prop_descr[4]="<p><b>Hersteller</b></p><p>Wenn die Hersteller nicht ausgewählt sind - alle Hersteller werden exportiert (Standardeinstellung).</p>";
prop_descr[5]="<p><b>Importmodus</p></b><p><i>Nur aktualisieren</i> - in diesem Modus wird der Hersteller durch ein Schlüsselfeld gesucht und wenn eine Übereinstimmung gefunden ist, so wird der Hersteller aus der CSV-Datei aktualisiert sein.</p><p><i>Nur hinzufügen</i> - in diesem Modus werden alle Kategorien wie die neuen aus der CSV-Datei hinzugefügt sein. Es ist unabhängig diese Kategorien in der Datenbank zu existieren oder nicht.</p><p><i>Aktualisieren und Hinzufügen</i> - in diesem Modus wird das Produkt durch ein Schlüsselfeld gesucht und wenn eine Übereinstimmung gefunden ist, so wird die Kategorie aus der CSV-Datei aktualisiert sein. Wenn es keine Übereinstimmung gibt, so wird die Kategorie wie die neue hinzugefügt seinе.</p>";
prop_descr[6]="<p><b>Schlüsselfeld</b></p><p>Das Schlüsselfeld, in dem die Übereinstimmung der Hersteller in der Datenbank gesucht ist, wird in den Modi <i>Nur aktualisieren</i>, <i>Aktualisieren und Hinzufügen</i> verwendet.</p>";
prop_descr[7]="<p><b>ID-Hersteller aus der Datei importieren</b></p><p>Wenn der neue Hersteller der Position hinzugefügt wird, wird das Feld _ID_ wie manufacturer_id importiert sein, der import wird unter der Bedingung ausgeführt, dass es solch manufacturer_id in der Datenbank nicht gibt und die Zahl maximal zulässiger Wert für manufacturer_id nicht übersteigt.</p>";
prop_descr[8]="<p><b>Hochladen der URL-Bilder aktivieren</b></p><p>Die Bilder werden nach den Referenzen in den Feldern _IMAGE_ und _IMAGES_ hochgeladen.</p><p>Die Referenzen sollen sein, wie:<br /><br /> http://www.example.com/dir/image_name.jpg</p>";
prop_descr[9]="<p><b>Texttrennzeichen</b></p><p>CSV-Datei, die auch Anführungszeichen als Trennzeichen haben.<br />E.g.: \"Smith\",\"Pete\",\"Canada\", zitat alle Textzellen.</p>";
prop_descr[32]="<p><b>Bilder als URL</b></p><p>Exports value _IMAGE_ and _IMAGES_ als URL. E.g.: http://www.example.com/dir/image_name.jpg</p>";
';

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
$_['_SEO_KEYWORD_'] = 'SEO Keyword';
$_['_META_H1_'] = 'HTML-Tag H1';
$_['_META_TITLE_'] = 'Meta Tag Title';
$_['_META_KEYWORDS_'] = 'Meta Tag Schlüsselwörter';
$_['_META_DESCRIPTION_'] = 'Мета Tag Beschreibung';
$_['_DESCRIPTION_'] = 'Beschreibung';
$_['_IMAGE_'] = 'Bild';
$_['_SORT_ORDER_'] = 'Reihenfolge';
$_['_STATUS_'] = 'Status';
$_['_STORE_ID_'] = 'ID-Shops';
$_['_URL_'] = 'URL';