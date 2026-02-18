<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:param name="page" select="1"/>
  <xsl:param name="pageSize" select="20"/>
  <xsl:template match="/">
    <xsl:variable name="all" select="festival/performers/performer"/>
    <xsl:variable name="total" select="count($all)"/>
    <xsl:variable name="start" select="($page - 1) * $pageSize + 1"/>
    <xsl:variable name="paged" select="$all[position() &gt;= $start and position() &lt; $start + $pageSize]"/>
    <xsl:text>{"performers":[</xsl:text>
    <xsl:for-each select="$all[position() &gt;= $start and position() &lt; $start + $pageSize]">
      <xsl:if test="position() &gt; 1">,</xsl:if>
        <xsl:text>{"id":"</xsl:text><xsl:value-of select="@id"/>
        <xsl:text>","name":"</xsl:text><xsl:value-of select="replace(replace(name, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
        <xsl:text>","genre":"</xsl:text><xsl:value-of select="replace(replace(genre, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
        <xsl:text>","country":"</xsl:text><xsl:value-of select="country"/>
        <xsl:text>","shortBio":"</xsl:text><xsl:value-of select="replace(replace(shortBio, '\\', '\\\\'), '&quot;', '\\&quot;')"/>
        <xsl:text>"}</xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:text>],"pagination":{"page":</xsl:text><xsl:value-of select="$page"/>
    <xsl:text>,"pageSize":</xsl:text><xsl:value-of select="$pageSize"/>
    <xsl:text>,"total":</xsl:text><xsl:value-of select="$total"/>
    <xsl:text>}}</xsl:text>
  </xsl:template>
</xsl:stylesheet>
