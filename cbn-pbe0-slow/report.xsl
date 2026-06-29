<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:math="http://exslt.org/math">
  <xsl:output method="xml" indent='yes'/> 
 <xsl:template match="/">
 <report>

  <test>
    <status>
    <xsl:choose>
    <xsl:when test="math:abs(document('eigval.xml')/eigval/kpt[1]/state[5]/@eigenvalue - document('eigval.ref.xml')/eigval/kpt[1]/state[5]/@eigenvalue)&lt;1e-6">
     <xsl:text>passed</xsl:text></xsl:when>
     <xsl:otherwise> <xsl:text>failed</xsl:text></xsl:otherwise>
    </xsl:choose>
    </status>
    <name>  Correct valence band maximum (VBM)</name>
    <description>passes if the VBM is the same as in reference:
     <xsl:value-of select="document('eigval.xml')/eigval/kpt[1]/state[5]/@eigenvalue"/> vs. <xsl:value-of select="document('eigval.ref.xml')/eigval/kpt[1]/state[5]/@eigenvalue"/>
    </description>
    <directory>cbn-pbe0-slow</directory>
  </test>

  <test>
    <status>
    <xsl:choose>
    <xsl:when test="math:abs(document('eigval.xml')/eigval/kpt[3]/state[6]/@eigenvalue - document('eigval.ref.xml')/eigval/kpt[3]/state[6]/@eigenvalue)&lt;1e-6">
     <xsl:text>passed</xsl:text></xsl:when>
     <xsl:otherwise> <xsl:text>failed</xsl:text></xsl:otherwise>
    </xsl:choose>
    </status>
    <name>  Correct conduction band minimum (CBM)</name>
    <description>passes if the CBM is the same as in reference:
     <xsl:value-of select="document('eigval.xml')/eigval/kpt[3]/state[6]/@eigenvalue"/> vs. <xsl:value-of select="document('eigval.ref.xml')/eigval/kpt[1]/state[5]/@eigenvalue"/>
    </description>
    <directory>cbn-pbe0-slow</directory>
  </test>

  <test>
    <xsl:variable name="result" select="sum(document('eigval.xml')/eigval/kpt/state/@eigenvalue)"/>
    <xsl:variable name="reference" select="sum(document('eigval.ref.xml')/eigval/kpt/state/@eigenvalue)"/>
    <status>
     <xsl:choose>
     <xsl:when test="math:abs($result - $reference) &lt; 1e-5">
      <xsl:text>passed</xsl:text></xsl:when>
      <xsl:otherwise> <xsl:text>failed</xsl:text></xsl:otherwise>
     </xsl:choose>
    </status>
    <name>  Correct sum of eigenvalues </name>
    <description>passes if the sum is the same as in reference:
     <xsl:value-of select="$result"/> vs. <xsl:value-of select="$reference"/>
    </description>
    <directory>cbn-pbe0-slow</directory>
  </test>

</report>
</xsl:template>
</xsl:stylesheet> 
