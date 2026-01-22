<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sfm="http://schema.slothsoft.net/farah/module" xmlns:sfd="http://schema.slothsoft.net/farah/dictionary"
    xmlns:sfs="http://schema.slothsoft.net/farah/sitemap" xmlns:php="http://php.net/xsl" extension-element-prefixes="php">

    <xsl:import href="farah://slothsoft@amber.slothsoft.net/xsl/global" />

    <xsl:template match="/*">
        <xsl:variable name="content" select="*[@name='content']" />

        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>

        <html>
            <head>
                <xsl:apply-templates select="." mode="title" />

                <link rel="icon" type="image/png" href="/favicon.ico" />

                <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes" />
                <meta name="author" content="Daniel Schulz" />
            </head>
            <body>
                <header>
                    <xsl:apply-templates select="." mode="nav" />
                </header>
                <main>
                    <xsl:if test="$currentPage">
                        <xsl:comment>
                            <xsl:value-of select="concat('page-body.', $currentPage/@name)" />
                        </xsl:comment>
                        <sfd:lookup key="page-body.{$currentPage/@name}" />
                    </xsl:if>
                    <xsl:if test="$content">
                        <xsl:comment>
                            <xsl:value-of select="$content/@url" />
                        </xsl:comment>
                        <xsl:copy-of select="$content/*" />
                    </xsl:if>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="/*" mode="title">
        <title>
            <xsl:apply-templates select="$currentPage" mode="page-title" />
            <xsl:for-each select="$ancestorPages">
                <xsl:sort select="position()" order="descending" data-type="number" />
                <xsl:text> - </xsl:text>
                <xsl:apply-templates select="." mode="page-title" />
            </xsl:for-each>
        </title>
    </xsl:template>


    <xsl:template match="/*" mode="nav">
        <nav class="nav">
            <div class="nav__breadcrumb">
                <xsl:for-each select="$ancestorPages">
                    <xsl:apply-templates select="." mode="page-link" />
                    <xsl:text> » </xsl:text>
                </xsl:for-each>
            </div>

            <div class="nav__current amber-text">
                <xsl:apply-templates select="$currentPage" mode="page-title" />
            </div>

            <xsl:if test="$childPages">
                <div class="nav__options">
                    <xsl:for-each select="$childPages">
                        <xsl:apply-templates select="." mode="page-link" />
                    </xsl:for-each>
                </div>
            </xsl:if>
        </nav>
    </xsl:template>
</xsl:stylesheet>
