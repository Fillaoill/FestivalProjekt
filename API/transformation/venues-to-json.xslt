<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:text>{"venues":[</xsl:text>
    <xsl:for-each select="festival/venues/venue">
      <xsl:if test="position()&gt;1">,</xsl:if>
      <xsl:text>{"id":"</xsl:text><xsl:value-of select="@id"/>
      <xsl:text>","name":"</xsl:text><xsl:value-of select="replace(replace(name, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
      <xsl:text>","type":"</xsl:text><xsl:value-of select="type"/>
      <xsl:text>","description":"</xsl:text><xsl:value-of select="replace(replace(description, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
      <xsl:text>","address":{"street":"</xsl:text><xsl:value-of select="replace(replace(address/street, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
      <xsl:text>","city":"</xsl:text><xsl:value-of select="replace(replace(address/city, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
      <xsl:text>","postalCode":"</xsl:text><xsl:value-of select="address/postalCode"/>
      <xsl:text>","country":"</xsl:text><xsl:value-of select="address/country"/>
      <xsl:text>"}}</xsl:text>
    </xsl:for-each>
    <xsl:text>]}</xsl:text>
  </xsl:template>
</xsl:stylesheet>
