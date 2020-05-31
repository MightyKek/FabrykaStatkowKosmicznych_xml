<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <link rel="stylesheet" href="statkiKosmiczne.css"/>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="statki">
    <xsl:for-each select="statek">
      <xsl:sort select="typ" order="descending"/>
      <div class="statek">
        <div class="container">
          <div class="id"><xsl:value-of select="@id"/></div>
          <div class="typ"><xsl:value-of select="@typ"/></div>
          <div class="dost"><xsl:value-of select="@dost"/></div>
          <div class="oznaczenia"><xsl:value-of select="oznaczenia"/></div>
          <div class="cena">
            <xsl:value-of select="cena"/><xsl:value-of select="cena/@waluta"/>
          </div>
        </div>
        <div class="komponenty">
          <xsl:apply-templates select="komponenty"/>
        </div>
      </div>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="komponenty">
    <div class="container">
      <div class="reaktor"><xsl:value-of select="reaktor"/></div>
      <div class="modelSilnika"><xsl:value-of select="modelSilnika"/></div>
      <div class="iloscZalogi"><xsl:value-of select="iloscZalogi"/></div>
    </div>
    <div class="container">
      <div class="kadlub">
        <xsl:apply-templates select="kadlub"/>
      </div>
    </div>
    <div class="container">
      <div class="komputerNawigacyjny">
        <xsl:apply-templates select="komputerNawigacyjny"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="kadlub">
    <div class="klasaPancerza"><xsl:value-of select="klasaPancerza"/></div>
    <div class="temperaturaStopienia">
      <xsl:value-of select="temperaturaStopienia"/><xsl:value-of select="temperaturaStopienia/@skala"/>
    </div>
    <div class="wykrywalnosc">
      <xsl:value-of select="wykrywalnosc"/><xsl:value-of select="wykrywalnosc/@jednostkaOdleglosci"/>
    </div>
  </xsl:template>

  <xsl:template match="komputerNawigacyjny">
    <div class="zasiegSkoku">
      <xsl:value-of select="zasiegSkoku"/><xsl:value-of select="zasiegSkoku/@jednostkaOdleglosci"/>
    </div>
    <div class="pojemnoscBankowPamieci">
      <xsl:value-of select="pojemnoscBankowPamieci"/><xsl:value-of select="pojemnoscBankowPamieci/@jednostkaPamieci"/>
    </div>
  </xsl:template>

  <xsl:template match="kategorie">
    <xsl:for-each select="kategoria">
      <div class="kategoria">
        <div class="kategoria--skrot"><xsl:value-of select="skrot"/></div>
        <div class="kategoria--pelnaNazwa"><xsl:value-of select="pelnaNazwa"/></div>
      </div>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
