// set the Searched Keyword & Page Title
// Or get the Searched Keyword & Title

package com.SearchEngineProject;
public class getHistoryresult {
    public String getKeyword() {                 // getter Function for return the Keyword
        return keyword;
    }

    public void setKeyword(String keyword) {    // Setter Function for set the Keyword
        this.keyword = keyword;
    }

    public String getLink() {                   // getter Function for return the page Link
        return Link;
    }

    public void setLink(String link) {      // Setter Function for set the Page Link
        Link = link;
    }

    String keyword;
    String Link;


}
