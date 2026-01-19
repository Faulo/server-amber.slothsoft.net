<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:sfm="http://schema.slothsoft.net/farah/module" xmlns:sfd="http://schema.slothsoft.net/farah/dictionary" xmlns:sfs="http://schema.slothsoft.net/farah/sitemap" xmlns:php="http://php.net/xsl"
	extension-element-prefixes="php">

	<xsl:template match="*" mode="page-link">
		<a href="{@uri}" class="amber-text amber-text--green">
			<xsl:apply-templates select="." mode="page-title" />
		</a>
	</xsl:template>

	<xsl:template match="*" mode="page-title">
		<sfd:lookup key="page-title.{@name}">
			<xsl:value-of select="@title" />
		</sfd:lookup>
	</xsl:template>
</xsl:stylesheet>
