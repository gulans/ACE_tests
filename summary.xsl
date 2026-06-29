<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:key name="fail-by-dir" match="test[normalize-space(status)='failed']"
           use="normalize-space(directory)"/>

  <xsl:template match="/">
    <xsl:variable name="passed" select="count(//test[normalize-space(status)='passed'])"/>
    <xsl:variable name="failed" select="count(//test[normalize-space(status)='failed'])"/>

    <xsl:text>-------------_Test summary_-------------
</xsl:text>
    <xsl:text>Passed: </xsl:text><xsl:value-of select="$passed"/><xsl:text>
</xsl:text>
    <xsl:text>Failed: </xsl:text><xsl:value-of select="$failed"/><xsl:text>

</xsl:text>

    <xsl:text>Directories with failures:
</xsl:text>

    <xsl:choose>
      <xsl:when test="$failed = 0">
        <xsl:text>(none)
</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="//test[normalize-space(status)='failed']
                              [generate-id() =
                               generate-id(key('fail-by-dir', normalize-space(directory))[1])]">
          <xsl:sort select="normalize-space(directory)"/>
          <xsl:text>- </xsl:text>
          <xsl:value-of select="normalize-space(directory)"/>
          <xsl:text> (</xsl:text>
          <xsl:value-of select="count(key('fail-by-dir', normalize-space(directory)))"/>
          <xsl:text> failed)
</xsl:text>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
