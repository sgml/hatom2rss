<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="utf-8"
doctype-system="about:legacy-compat"
indent="yes"/>

<xsl:template match="/">
  <!--Boilerplate-->
  <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
      <!--Replace . with the current URL, fill in description, link, title-->
      <!--Reference1: https://developer.mozilla.org/en-US/docs/The_XSLT_JavaScript_Interface_in_Gecko/Setting_Parameters -->
      <!--Reference2: https://developer.mozilla.org/en-US/docs/Web/XSLT/PI_Parameters -->
      <!--Reference3: http://php.net/manual/en/xsltprocessor.setparameter.php -->
      
      <atom:link href="." rel="self" type="application/rss+xml" />
      <description></description>
      <link></link>
      <title></title>
      
      <xsl:apply-templates/>
    </channel>
</xsl:template>

<!-- Convert hentry to item -->
<xsl:template match="//*[@class='hentry']">
  <item>
    <xsl:apply-templates select="@class" />
  </item>
</xsl:template>

<!-- Convert entry-title to title -->
<xsl:template match="//*[@class='entry-title']">
  <title>
    <xsl:value-of select="."/>
  </title>  
</xsl:template>

<!-- Convert entry-content to description -->
<xsl:template match="//*[@class='entry-content']">
  <description>
    <xsl:value-of select="."/>
  </description>
</xsl:template>

<!-- Convert bookmark to link -->
<xsl:template match="//*[@class='bookmark']">
  <link>
    <xsl:value-of select="."/>
  </link>    
</xsl:template>

</xsl:stylesheet>
