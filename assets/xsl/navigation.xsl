<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:sfm="http://schema.slothsoft.net/farah/module" xmlns:sfd="http://schema.slothsoft.net/farah/dictionary" xmlns:sfs="http://schema.slothsoft.net/farah/sitemap" xmlns:php="http://php.net/xsl"
	extension-element-prefixes="php">

	<xsl:import href="farah://slothsoft@amber.slothsoft.net/xsl/global" />

	<xsl:template match="/*">
		<xsl:variable name="currentPage" select="*[@name = 'sites']//*[@current] | *[@name = 'sites']//sfs:domain[not(.//*[@current])]" />
		<xsl:variable name="ancestorPages" select="$currentPage/ancestor::sfs:*" />
		<xsl:variable name="childPages" select="$currentPage/sfs:page" />

		<div>
			<title>
				<xsl:apply-templates select="$currentPage" mode="page-title" />
				<xsl:for-each select="$ancestorPages">
					<xsl:sort select="position()" order="descending" data-type="number" />
					<xsl:text> - </xsl:text>
					<xsl:apply-templates select="." mode="page-title" />
				</xsl:for-each>
			</title>

			<nav>
				<xsl:if test="$ancestorPages">
					<div class="breadcrumb">
						<xsl:for-each select="$ancestorPages">
							<xsl:apply-templates select="." mode="page-link" />
							<xsl:text> » </xsl:text>
						</xsl:for-each>
					</div>
				</xsl:if>

				<xsl:apply-templates select="$currentPage" mode="page-link" />

				<xsl:if test="$childPages">
					<div class="options">
						<xsl:for-each select="$childPages">
							<xsl:apply-templates select="." mode="page-link" />
						</xsl:for-each>
					</div>
				</xsl:if>
			</nav>
		</div>
	</xsl:template>
</xsl:stylesheet>
