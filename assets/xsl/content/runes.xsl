<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sfm="http://schema.slothsoft.net/farah/module" xmlns:sfs="http://schema.slothsoft.net/farah/sitemap"
    xmlns:php="http://php.net/xsl" xmlns:str="http://exslt.org/strings" extension-element-prefixes="php">

    <xsl:import href="farah://slothsoft@farah/xsl/module" />

    <xsl:template match="/*">
        <article class="post">
            <p>Das Runenalphabet, wie es in Ambermoon und Amberstar benutzt wird.</p>
            <p>
                <xsl:text>Die verwendeten Fonts sind </xsl:text>
                <a href="https://fontstruct.com/fontstructions/show/1668008/ambermoon-game" rel="external" target="_blank">Ambermoon-game</a>
                <xsl:text> und </xsl:text>
                <a href="https://fontstruct.com/fontstructions/show/1669858/ambermoon-game-1" rel="external" target="_blank">Ambermoon-rune</a>
                <xsl:text> von </xsl:text>
                <a href="https://fontstruct.com/fontstructors/1680334/nicode" rel="external" target="_blank">Nico Bendlin</a>
                <xsl:text>.</xsl:text>
            </p>
            <ul class="rune-table amber-text">
                <xsl:for-each select="str:tokenize('abcdefghijklmnopqrstuvwxyzßäöü', '')">
                    <li>
                        <span class="amber-text">
                            <xsl:value-of select="." />
                        </span>
                        <span class="amber-text amber-text--runes">
                            <xsl:value-of select="." />
                        </span>
                    </li>
                </xsl:for-each>
            </ul>
        </article>
    </xsl:template>
</xsl:stylesheet>
