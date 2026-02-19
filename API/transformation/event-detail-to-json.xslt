<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:param name="id" select="'e1'"/>
  <xsl:template match="/">
    <xsl:variable name="e" select="festival/events/event[@id=$id]"/>
    <xsl:if test="not($e)">
      <xsl:text>{"error":"Event not found","code":404}</xsl:text>
      <xsl:return/>
    </xsl:if>
    <xsl:text>{"id":"</xsl:text><xsl:value-of select="$e/@id"/>
    <xsl:text>","title":"</xsl:text><xsl:value-of select="replace(replace($e/title, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>","type":"</xsl:text><xsl:value-of select="$e/type"/>
    <xsl:text>","dayRef":"</xsl:text><xsl:value-of select="$e/dayRef"/>
    <xsl:text>","venueRef":"</xsl:text><xsl:value-of select="$e/venueRef"/>
    <xsl:text>","startTime":"</xsl:text><xsl:value-of select="$e/startTime"/>
    <xsl:text>","endTime":"</xsl:text><xsl:value-of select="$e/endTime"/>
    <xsl:text>","performerIds":[</xsl:text>
    <xsl:for-each select="$e/performerRefs/performerRef">
      <xsl:if test="position()&gt;1">,</xsl:if>
      <xsl:text>"</xsl:text><xsl:value-of select="."/>
      <xsl:text>"</xsl:text>
    </xsl:for-each>
    <xsl:text>],"description":"</xsl:text><xsl:value-of select="replace(replace($e/description, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
    <xsl:text>"}</xsl:text>
  </xsl:template>
</xsl:stylesheet>
