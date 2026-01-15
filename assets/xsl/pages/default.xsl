<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sfm="http://schema.slothsoft.net/farah/module" xmlns:sfd="http://schema.slothsoft.net/farah/dictionary"
    xmlns:sfs="http://schema.slothsoft.net/farah/sitemap" xmlns:php="http://php.net/xsl" extension-element-prefixes="php">

    <xsl:template match="/*">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>

        <html>
            <head>
                <xsl:copy-of select="//html:title" />

                <link rel="icon" type="image/png" href="/favicon.ico" />

                <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes" />
                <meta name="author" content="Daniel Schulz" />
            </head>
            <body>
                <header>
                    <xsl:copy-of select="//html:nav" />
                </header>
                <main>
                    <xsl:for-each select="sfm:param[@name='page']">
                        <sfd:lookup key="page-body.{@value}" />
                    </xsl:for-each>
                    <xsl:copy-of select="*[@name='content']/*" />
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
