
package com.ulbs.proiectingineriesoftware.Common;

import java.util.Locale;
import javax.ejb.Local;
import javax.ejb.Stateful;
import javax.enterprise.context.SessionScoped;


@Stateful
@SessionScoped
public class LanguageBean {

    Locale locale_en=new Locale("en");
    Locale locale_ro=new Locale("ro");
    Locale locale_de=new Locale("de");
    
    String language="ro";

    public Locale getLocale(){
    if(language.equals("ro")) return locale_ro;
        if(language.equals("de")) return locale_de;
        if(language.equals("en")) return locale_en;

        return locale_en;
    }
    
    public void changeLanguage(String newLanguage){
        language=newLanguage;
    }
}
