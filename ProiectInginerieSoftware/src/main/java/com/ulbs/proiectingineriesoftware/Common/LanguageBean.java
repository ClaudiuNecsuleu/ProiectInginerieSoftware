
package com.ulbs.proiectingineriesoftware.Common;

import java.util.Locale;
import javax.ejb.Local;
import javax.ejb.Stateful;
import javax.enterprise.context.SessionScoped;


@Stateful
@SessionScoped
public class LanguageBean {

    Locale content_en=new Locale("en");
    Locale content_ro=new Locale("ro");
    Locale content_de=new Locale("de");
    Locale content_fr=new Locale("fr");
    Locale content_es=new Locale("es");
    
    String language="ro";

    public Locale getLocale(){
    if(language.equals("ro")) return content_ro;
        if(language.equals("de")) return content_de;
        if(language.equals("en")) return content_en;
        if(language.equals("fr")) return content_fr;
        if(language.equals("es")) return content_es;
        return content_ro;
    }
    
    public void changeLanguage(String newLanguage){
        language=newLanguage;
    }
}
