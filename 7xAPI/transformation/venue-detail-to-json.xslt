<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:param name="id" select="'v1'"/>
  <xsl:template match="/">
    <xsl:variable name="v" select="festival/venues/venue[@id=$id]"/>
    <xsl:if test="not($v)">
      <xsl:text>{"error":"Venue not found","code":404}</xsl:text>
      <xsl:return/>
    </xsl:if>
    <xsl:text>{"id":"</xsl:text><xsl:value-of select="$v/@id"/>
    <xsl:text>","name":"</xsl:text><xsl:value-of select="replace(replace($v/name, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>","type":"</xsl:text><xsl:value-of select="$v/type"/>
    <xsl:text>","description":"</xsl:text><xsl:value-of select="replace(replace($v/description, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>","address":{"street":"</xsl:text><xsl:value-of select="replace(replace($v/address/street, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>","city":"</xsl:text><xsl:value-of select="replace(replace($v/address/city, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>","postalCode":"</xsl:text><xsl:value-of select="$v/address/postalCode"/>
    <xsl:text>","country":"</xsl:text><xsl:value-of select="$v/address/country"/>
    <xsl:text>"}}</xsl:text>
  </xsl:template>
</xsl:stylesheet>
