<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:variable name="f" select="festival"/>
    <xsl:variable name="id" select="$f/identity"/>
    <xsl:text>{"id":"</xsl:text><xsl:value-of select="$f/@id"/>
    <xsl:text>","name":"</xsl:text><xsl:value-of select="replace(replace($f/identity/name, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>","edition":</xsl:text><xsl:value-of select="$f/identity/edition"/>
    <xsl:text>,"location":"</xsl:text><xsl:value-of select="replace(replace($f/identity/location, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>","dateFrom":"</xsl:text><xsl:value-of select="$f/identity/dateRange/@from"/>
    <xsl:text>","dateTo":"</xsl:text><xsl:value-of select="$f/identity/dateRange/@to"/>
    <xsl:text>","description":"</xsl:text><xsl:value-of select="replace(replace(replace(normalize-space($f/identity/description), '\\', '\\\\'), '&quot;', '\\&quot;'), '&#10;', '\\n')"/>
    <xsl:text>","website":"</xsl:text><xsl:value-of select="$f/identity/website"/>
    <xsl:text>","tickets":[</xsl:text>
    <xsl:for-each select="$f/identity/tickets/ticketType">
      <xsl:if test="position()&gt;1">,</xsl:if>
      <xsl:text>{"id":"</xsl:text><xsl:value-of select="@id"/>
      <xsl:text>","name":"</xsl:text><xsl:value-of select="replace(replace(name, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
      <xsl:text>","description":"</xsl:text><xsl:value-of select="replace(replace(description, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
      <xsl:text>","price":</xsl:text><xsl:value-of select="price"/>
      <xsl:text>,"currency":"</xsl:text><xsl:value-of select="price/@currency"/>
      <xsl:text>"}</xsl:text>
    </xsl:for-each>
    <xsl:text>]}</xsl:text>
  </xsl:template>
</xsl:stylesheet>
