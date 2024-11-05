/**
 * @license Copyright (c) 2003-2024, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see LICENSE.md or https://ckeditor.com/legal/ckeditor-oss-license
 */

( e => {
const { [ 'de-ch' ]: { dictionary, getPluralForm } } = {"de-ch":{"dictionary":{"Words: %0":"Wörter: %0","Characters: %0":"Zeichen: %0","Widget toolbar":"Widget Werkzeugleiste","Insert paragraph before block":"Absatz vor Block einfügen","Insert paragraph after block":"Absatz nach Block einfügen","Press Enter to type after or press Shift + Enter to type before the widget":"","Keystrokes that can be used when a widget is selected (for example: image, table, etc.)":"","Insert a new paragraph directly after a widget":"","Insert a new paragraph directly before a widget":"","Move the caret to allow typing directly before a widget":"","Move the caret to allow typing directly after a widget":"","Move focus from an editable area back to the parent widget":"","Upload in progress":"Upload läuft","Undo":"Rückgängig","Redo":"Wiederherstellen","Rich Text Editor":"Rich-Text-Edito","Edit block":"","Click to edit block":"","Drag to move":"","Next":"","Previous":"","Editor toolbar":"","Dropdown toolbar":"","Dropdown menu":"","Black":"","Dim grey":"","Grey":"","Light grey":"","White":"","Red":"","Orange":"","Yellow":"","Light green":"","Green":"","Aquamarine":"","Turquoise":"","Light blue":"","Blue":"","Purple":"","Editor block content toolbar":"","Editor contextual toolbar":"","HEX":"","No results found":"","No searchable items":"","Editor dialog":"","Close":"","Help Contents. To close this dialog press ESC.":"","Below, you can find a list of keyboard shortcuts that can be used in the editor.":"","(may require <kbd>Fn</kbd>)":"","Accessibility":"","Accessibility help":"","Press %0 for help.":"","Move focus in and out of an active dialog window":"","MENU_BAR_MENU_FILE":"","MENU_BAR_MENU_EDIT":"Bearbeiten","MENU_BAR_MENU_VIEW":"","MENU_BAR_MENU_INSERT":"Einfügen","MENU_BAR_MENU_FORMAT":"","MENU_BAR_MENU_TOOLS":"","MENU_BAR_MENU_HELP":"","MENU_BAR_MENU_TEXT":"","MENU_BAR_MENU_FONT":"","Editor menu bar":"","Please enter a valid color (e.g. \"ff0000\").":"","Insert table":"Tabelle einfügen","Header column":"Kopfspalte","Insert column left":"","Insert column right":"","Delete column":"Spalte löschen","Select column":"","Column":"Spalte","Header row":"Kopfspalte","Insert row below":"Zeile unten einfügen","Insert row above":"Zeile oben einfügen","Delete row":"Zeile löschen","Select row":"","Row":"Zeile","Merge cell up":"Zelle oben verbinden","Merge cell right":"Zele rechts verbinden","Merge cell down":"Zelle unten verbinden","Merge cell left":"Zelle links verbinden","Split cell vertically":"Zelle vertikal teilen","Split cell horizontally":"Zelle horizontal teilen","Merge cells":"Zellen verbinden","Table toolbar":"","Table properties":"","Cell properties":"","Border":"","Style":"","Width":"","Height":"","Color":"","Background":"","Padding":"","Dimensions":"","Table cell text alignment":"","Alignment":"","Horizontal text alignment toolbar":"","Vertical text alignment toolbar":"","Table alignment toolbar":"","None":"","Solid":"","Dotted":"","Dashed":"","Double":"","Groove":"","Ridge":"","Inset":"","Outset":"","Align cell text to the left":"","Align cell text to the center":"","Align cell text to the right":"","Justify cell text":"","Align cell text to the top":"","Align cell text to the middle":"","Align cell text to the bottom":"","Align table to the left":"","Center table":"","Align table to the right":"","The color is invalid. Try \"#FF0000\" or \"rgb(255,0,0)\" or \"red\".":"","The value is invalid. Try \"10px\" or \"2em\" or simply \"2\".":"","Enter table caption":"","Keystrokes that can be used in a table cell":"","Move the selection to the next cell":"","Move the selection to the previous cell":"","Insert a new table row (when in the last cell of a table)":"","Navigate through the table":"","Table":"","Styles":"","Multiple styles":"","Block styles":"","Text styles":"","Special characters":"","Category":"","All":"","Arrows":"","Currency":"","Latin":"","Mathematical":"","Text":"","leftwards simple arrow":"","rightwards simple arrow":"","upwards simple arrow":"","downwards simple arrow":"","leftwards double arrow":"","rightwards double arrow":"","upwards double arrow":"","downwards double arrow":"","leftwards dashed arrow":"","rightwards dashed arrow":"","upwards dashed arrow":"","downwards dashed arrow":"","leftwards arrow to bar":"","rightwards arrow to bar":"","upwards arrow to bar":"","downwards arrow to bar":"","up down arrow with base":"","back with leftwards arrow above":"","end with leftwards arrow above":"","on with exclamation mark with left right arrow above":"","soon with rightwards arrow above":"","top with upwards arrow above":"","Dollar sign":"","Euro sign":"","Yen sign":"","Pound sign":"","Cent sign":"","Euro-currency sign":"","Colon sign":"","Cruzeiro sign":"","French franc sign":"","Lira sign":"","Currency sign":"","Bitcoin sign":"","Mill sign":"","Naira sign":"","Peseta sign":"","Rupee sign":"","Won sign":"","New sheqel sign":"","Dong sign":"","Kip sign":"","Tugrik sign":"","Drachma sign":"","German penny sign":"","Peso sign":"","Guarani sign":"","Austral sign":"","Hryvnia sign":"","Cedi sign":"","Livre tournois sign":"","Spesmilo sign":"","Tenge sign":"","Indian rupee sign":"","Turkish lira sign":"","Nordic mark sign":"","Manat sign":"","Ruble sign":"","Latin capital letter a with macron":"","Latin small letter a with macron":"","Latin capital letter a with breve":"","Latin small letter a with breve":"","Latin capital letter a with ogonek":"","Latin small letter a with ogonek":"","Latin capital letter c with acute":"","Latin small letter c with acute":"","Latin capital letter c with circumflex":"","Latin small letter c with circumflex":"","Latin capital letter c with dot above":"","Latin small letter c with dot above":"","Latin capital letter c with caron":"","Latin small letter c with caron":"","Latin capital letter d with caron":"","Latin small letter d with caron":"","Latin capital letter d with stroke":"","Latin small letter d with stroke":"","Latin capital letter e with macron":"","Latin small letter e with macron":"","Latin capital letter e with breve":"","Latin small letter e with breve":"","Latin capital letter e with dot above":"","Latin small letter e with dot above":"","Latin capital letter e with ogonek":"","Latin small letter e with ogonek":"","Latin capital letter e with caron":"","Latin small letter e with caron":"","Latin capital letter g with circumflex":"","Latin small letter g with circumflex":"","Latin capital letter g with breve":"","Latin small letter g with breve":"","Latin capital letter g with dot above":"","Latin small letter g with dot above":"","Latin capital letter g with cedilla":"","Latin small letter g with cedilla":"","Latin capital letter h with circumflex":"","Latin small letter h with circumflex":"","Latin capital letter h with stroke":"","Latin small letter h with stroke":"","Latin capital letter i with tilde":"","Latin small letter i with tilde":"","Latin capital letter i with macron":"","Latin small letter i with macron":"","Latin capital letter i with breve":"","Latin small letter i with breve":"","Latin capital letter i with ogonek":"","Latin small letter i with ogonek":"","Latin capital letter i with dot above":"","Latin small letter dotless i":"","Latin capital ligature ij":"","Latin small ligature ij":"","Latin capital letter j with circumflex":"","Latin small letter j with circumflex":"","Latin capital letter k with cedilla":"","Latin small letter k with cedilla":"","Latin small letter kra":"","Latin capital letter l with acute":"","Latin small letter l with acute":"","Latin capital letter l with cedilla":"","Latin small letter l with cedilla":"","Latin capital letter l with caron":"","Latin small letter l with caron":"","Latin capital letter l with middle dot":"","Latin small letter l with middle dot":"","Latin capital letter l with stroke":"","Latin small letter l with stroke":"","Latin capital letter n with acute":"","Latin small letter n with acute":"","Latin capital letter n with cedilla":"","Latin small letter n with cedilla":"","Latin capital letter n with caron":"","Latin small letter n with caron":"","Latin small letter n preceded by apostrophe":"","Latin capital letter eng":"","Latin small letter eng":"","Latin capital letter o with macron":"","Latin small letter o with macron":"","Latin capital letter o with breve":"","Latin small letter o with breve":"","Latin capital letter o with double acute":"","Latin small letter o with double acute":"","Latin capital ligature oe":"","Latin small ligature oe":"","Latin capital letter r with acute":"","Latin small letter r with acute":"","Latin capital letter r with cedilla":"","Latin small letter r with cedilla":"","Latin capital letter r with caron":"","Latin small letter r with caron":"","Latin capital letter s with acute":"","Latin small letter s with acute":"","Latin capital letter s with circumflex":"","Latin small letter s with circumflex":"","Latin capital letter s with cedilla":"","Latin small letter s with cedilla":"","Latin capital letter s with caron":"","Latin small letter s with caron":"","Latin capital letter t with cedilla":"","Latin small letter t with cedilla":"","Latin capital letter t with caron":"","Latin small letter t with caron":"","Latin capital letter t with stroke":"","Latin small letter t with stroke":"","Latin capital letter u with tilde":"","Latin small letter u with tilde":"","Latin capital letter u with macron":"","Latin small letter u with macron":"","Latin capital letter u with breve":"","Latin small letter u with breve":"","Latin capital letter u with ring above":"","Latin small letter u with ring above":"","Latin capital letter u with double acute":"","Latin small letter u with double acute":"","Latin capital letter u with ogonek":"","Latin small letter u with ogonek":"","Latin capital letter w with circumflex":"","Latin small letter w with circumflex":"","Latin capital letter y with circumflex":"","Latin small letter y with circumflex":"","Latin capital letter y with diaeresis":"","Latin capital letter z with acute":"","Latin small letter z with acute":"","Latin capital letter z with dot above":"","Latin small letter z with dot above":"","Latin capital letter z with caron":"","Latin small letter z with caron":"","Latin small letter long s":"","Less-than sign":"","Greater-than sign":"","Less-than or equal to":"","Greater-than or equal to":"","En dash":"","Em dash":"","Macron":"","Overline":"","Degree sign":"","Minus sign":"","Plus-minus sign":"","Division sign":"","Fraction slash":"","Multiplication sign":"","Latin small letter f with hook":"","Integral":"","N-ary summation":"","Infinity":"","Square root":"","Tilde operator":"","Approximately equal to":"","Almost equal to":"","Not equal to":"","Identical to":"","Element of":"","Not an element of":"","Contains as member":"","N-ary product":"","Logical and":"","Logical or":"","Not sign":"","Intersection":"","Union":"","Partial differential":"","For all":"","There exists":"","Empty set":"","Nabla":"","Asterisk operator":"","Proportional to":"","Angle":"","Vulgar fraction one quarter":"","Vulgar fraction one half":"","Vulgar fraction three quarters":"","Single left-pointing angle quotation mark":"","Single right-pointing angle quotation mark":"","Left-pointing double angle quotation mark":"","Right-pointing double angle quotation mark":"","Left single quotation mark":"","Right single quotation mark":"","Left double quotation mark":"","Right double quotation mark":"","Single low-9 quotation mark":"","Double low-9 quotation mark":"","Inverted exclamation mark":"","Inverted question mark":"","Two dot leader":"","Horizontal ellipsis":"","Double dagger":"","Per mille sign":"","Per ten thousand sign":"","Double exclamation mark":"","Question exclamation mark":"","Exclamation question mark":"","Double question mark":"","Copyright sign":"","Registered sign":"","Trade mark sign":"","Section sign":"","Paragraph sign":"","Reversed paragraph sign":"","Source":"","Show source":"","Show blocks":"","Select all":"Alles auswählen","Disable editing":"Bearbeitung deaktivieren","Enable editing":"Bearbeitung zulassen","Previous editable region":"Vorheriger bearbeitbarer Bereich","Next editable region":"Nächster bearbeitbarer Bereich","Navigate editable regions":"Durch bearbeitbare Bereiche navigieren","Remove Format":"Formatierung entfernen","Page break":"Seitenumbruch","media widget":"Medien-Widget","Media URL":"Medien-URL","Paste the media URL in the input.":"Medien-URL in das Eingabefeld einfügen.","Tip: Paste the URL into the content to embed faster.":"Tipp: Zum schnelleren Einbetten können Sie die Medien-URL in den Inhalt einfügen.","The URL must not be empty.":"Die URL darf nicht leer sein.","This media URL is not supported.":"Diese Medien-URL wird nicht unterstützt.","Insert media":"Medium einfügen","Media":"","Media toolbar":"Medien Werkzeugleiste","Open media in new tab":"","Numbered List":"Nummerierte Liste","Bulleted List":"Aufzählungsliste","To-do List":"Aufgabenliste","Bulleted list styles toolbar":"Darstellung der ungeordneten Liste","Numbered list styles toolbar":"Darstellung der nummerierten Liste","Toggle the disc list style":"Gefüllten Kreis einstellen","Toggle the circle list style":"Leeren Kreis einstellen","Toggle the square list style":"Quadrat einstellen","Toggle the decimal list style":"Dezimalzahlen einstellen","Toggle the decimal with leading zero list style":"Dezimalzahlen mit vorangestellten Nullen einstellen","Toggle the lower–roman list style":"Kleingeschriebene römische Zahlen einstellen","Toggle the upper–roman list style":"Grossgeschriebene römische Zahlen einstellen","Toggle the lower–latin list style":"Kleingeschriebene lateinische Buchstaben einstellen","Toggle the upper–latin list style":"Grossgeschriebene lateinische Buchstaben einstellen","Disc":"Gefüllter Kreis","Circle":"Leerer Kreis","Square":"Quadrat","Decimal":"Dezimalzahlen","Decimal with leading zero":"Dezimalzahlen mit vorangestellten Nullen","Lower–roman":"Kleingeschriebene römische Zahlen","Upper-roman":"Grossgeschriebene römische Zahlen","Lower-latin":"Kleingeschriebene lateinische Buchstaben","Upper-latin":"Grossgeschriebene lateinische Buchstaben","List properties":"","Start at":"","Invalid start index value.":"","Start index must be greater than 0.":"","Reversed order":"","Keystrokes that can be used in a list":"","Increase list item indent":"","Decrease list item indent":"","Entering a to-do list":"","Leaving a to-do list":"","Unlink":"Link entfernen","Link":"Link","Link URL":"Link Adresse","Link URL must not be empty.":"","Link image":"Bild verlinken","Edit link":"Link bearbeiten","Open link in new tab":"Link in neuem Tab öffnen","This link has no URL":"Dieser Link hat keine Adresse","Open in a new tab":"In neuem Tab öffnen","Downloadable":"Herunterladbar","Create link":"","Move out of a link":"","Language":"Sprache","Choose language":"Sprache auswählen","Remove language":"Sprache entfernen","Increase indent":"Einzug vergrössern","Decrease indent":"Einzug verkleinern","image widget":"Bild-Steuerelement","Wrap text":"","Break text":"","In line":"","Side image":"Ausgerichtetes Bild","Full size image":"Bild in voller Grösse","Left aligned image":"linksbündiges Bild","Centered image":"zentriertes Bild","Right aligned image":"rechtsbündiges Bild","Change image text alternative":"Alternativtext ändern","Text alternative":"Alternativtext","Enter image caption":"Bildunterschrift eingeben","Insert image":"Bild einfügen","Replace image":"","Upload from computer":"","Replace from computer":"","Upload image from computer":"","Image from computer":"","From computer":"","Replace image from computer":"","Upload failed":"Hochladen fehlgeschlagen","You have no image upload permissions.":"","Image toolbar":"Bild Werkzeugleiste","Resize image":"Bildgrösse ändern","Resize image to %0":"Bildgrösse ändern in %0","Resize image to the original size":"Originalgrösse wiederherstellen","Resize image (in %0)":"","Original":"Original","Custom image size":"","Custom":"","Image resize list":"Bildgrössen-Liste","Insert image via URL":"Bild von URL einfügen","Insert via URL":"","Image via URL":"","Via URL":"","Update image URL":"Bild-URL aktualisieren","Caption for the image":"","Caption for image: %0":"","The value must not be empty.":"","The value should be a plain number.":"","Uploading image":"","Image upload complete":"","Error during image upload":"","Image":"","HTML object":"","Insert HTML":"HTML einfügen","HTML snippet":"HTML-Codeschnipsel","Paste raw HTML here...":"HTML-Code hier einfügen…","Edit source":"Quelle bearbeiten","Save changes":"Änderungen speichern","No preview available":"Keine Vorschau verfügbar","Empty snippet content":"Codeschnipsel ohne Inhalt","Horizontal line":"Horizontale Linie","Yellow marker":"Gelber Marker","Green marker":"Grüner Marker","Pink marker":"Pinker Marker","Blue marker":"Blauer Marker","Red pen":"Rote Schriftfarbe","Green pen":"Grüne Schriftfarbe","Remove highlight":"Texthervorhebung entfernen","Highlight":"Texthervorhebung","Text highlight toolbar":"Texthervorhebung Werkzeugleiste","Heading":"Überschrift","Choose heading":"Überschrift auswählen","Heading 1":"Überschrift 1","Heading 2":"Überschrift 2","Heading 3":"Überschrift 3","Heading 4":"Überschrift 4","Heading 5":"Überschrift 5","Heading 6":"Überschrift 6","Type your title":"Titel eingeben","Type or paste your content here.":"Hier Inhalt einfügen.","Font Size":"Schriftgrösse","Tiny":"Winzig","Small":"Klein","Big":"Gross","Huge":"Riesig","Font Family":"Schriftfamilie","Default":"Standard","Font Color":"Schriftfarbe","Font Background Color":"Hintergrundfarbe der Schrift","Document colors":"Farben des Dokuments","Find and replace":"","Find in text…":"","Find":"","Previous result":"","Next result":"","Replace":"","Replace all":"","Match case":"","Whole words only":"","Replace with…":"","Text to find must not be empty.":"","Tip: Find some text first in order to replace it.":"","Advanced options":"","Find in the document":"","Insert a soft break (a <code>&lt;br&gt;</code> element)":"","Insert a hard break (a new paragraph)":"","Cancel":"Abbrechen","Clear":"","Remove color":"Farbe entfernen","Restore default":"","Save":"Speichern","Show more items":"","%0 of %1":"","Cannot upload file:":"Datei kann nicht hochgeladen werden:","Rich Text Editor. Editing area: %0":"","Insert with file manager":"","Replace with file manager":"","Insert image with file manager":"","Replace image with file manager":"","File":"","With file manager":"","Toggle caption off":"","Toggle caption on":"","Content editing keystrokes":"","These keyboard shortcuts allow for quick access to content editing features.":"","User interface and content navigation keystrokes":"","Use the following keystrokes for more efficient navigation in the CKEditor 5 user interface.":"","Close contextual balloons, dropdowns, and dialogs":"","Open the accessibility help dialog":"","Move focus between form fields (inputs, buttons, etc.)":"","Move focus to the menu bar, navigate between menu bars":"","Move focus to the toolbar, navigate between toolbars":"","Navigate through the toolbar or menu bar":"","Execute the currently focused button. Executing buttons that interact with the editor content moves the focus back to the content.":"","Accept":"","Paragraph":"Absatz","Color picker":"","Insert code block":"Code-Block einfügen","Plain text":"Nur Text","Leaving %0 code snippet":"","Entering %0 code snippet":"","Entering code snippet":"","Leaving code snippet":"","Code block":"","Copy selected content":"","Paste content":"","Paste content as plain text":"","Insert image or file":"Bild oder Datei einfügen","Could not obtain resized image URL.":"Die URL des angepassten Bildes konnte nicht abgerufen werden.","Selecting resized image failed":"Das angepasste Bild konnte nicht ausgewählt werden.","Could not insert image at the current position.":"Das Bild konnte an der aktuellen Position nicht eingefügt werden.","Inserting image failed":"Einfügen des Bildes fehlgeschlagen","Open file manager":"","Cannot determine a category for the uploaded file.":"","Cannot access default workspace.":"","You have no image editing permissions.":"","Edit image":"","Processing the edited image.":"","Server failed to process the image.":"","Failed to determine category of edited image.":"","Block quote":"Blockzitat","Bold":"Fett","Italic":"Kursiv","Underline":"Unterstrichen","Code":"Code","Strikethrough":"Durchgestrichen","Subscript":"Tiefgestellt","Superscript":"Hochgestellt","Italic text":"","Move out of an inline code style":"","Bold text":"","Underline text":"","Strikethrough text":"","Saving changes":"Änderungen werden gespeichert","Revert autoformatting action":"","Align left":"Linksbündig","Align right":"Rechtsbündig","Align center":"Zentriert","Justify":"Blocksatz","Text alignment":"Textausrichtung","Text alignment toolbar":"Textausrichtung Werkzeugleiste"},getPluralForm(n){return (n != 1);}}};
e[ 'de-ch' ] ||= { dictionary: {}, getPluralForm: null };
e[ 'de-ch' ].dictionary = Object.assign( e[ 'de-ch' ].dictionary, dictionary );
e[ 'de-ch' ].getPluralForm = getPluralForm;
} )( window.CKEDITOR_TRANSLATIONS ||= {} );
