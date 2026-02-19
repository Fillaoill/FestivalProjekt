<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:param name="id" select="'p1'"/>
  <xsl:template match="/">
    <xsl:variable name="p" select="festival/performers/performer[@id=$id]"/>
    <xsl:if test="not($p)">
      <xsl:text>{"error":"Performer not found","code":404}</xsl:text>
      <xsl:return/>
    </xsl:if>
    <xsl:text>{"id":"</xsl:text><xsl:value-of select="$p/@id"/>
    <xsl:text>","name":"</xsl:text><xsl:value-of select="replace(replace($p/name, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>","genre":"</xsl:text><xsl:value-of select="replace(replace($p/genre, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>","country":"</xsl:text><xsl:value-of select="$p/country"/>
    <xsl:text>","shortBio":"</xsl:text><xsl:value-of select="replace(replace($p/shortBio, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>"}</xsl:text>
  </xsl:template>
</xsl:stylesheet>
