<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://schema.slothsoft.net/farah/sitemap" xmlns:sfs="http://schema.slothsoft.net/farah/sitemap" xmlns:sfd="http://schema.slothsoft.net/farah/dictionary" xmlns:sfm="http://schema.slothsoft.net/farah/module"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/*">
        <domain name="amber.slothsoft.net" vendor="slothsoft" module="amber.slothsoft.net" ref="pages/home" status-active="" status-public="" sfd:languages="de-de en-us" version="1.1">
            <xsl:apply-templates select="*[@name='index']/*" />
        </domain>
    </xsl:template>

    <xsl:template match="game">
        <xsl:variable name="game" select="@name" />
        <xsl:variable name="url" select="concat('/', @title, '/', mod[not(@hidden)][1]/@name, '/')" />

        <page name="{@title}" ref="pages/{$game}/description?page=Ambermoon" status-active="" status-public="">
            <sfm:param name="game" value="{$game}" />

            <page name="EditorHelp" ref="pages/{$game}/description?page=EditorHelp" status-active="" status-public="" />
            <page name="Downloads" ref="pages/{$game}/description?page=Downloads" status-active="" status-public="" />
            <page name="Gallery" ref="/pages/{$game}/gallery" status-active="" status-public="" />

            <xsl:apply-templates select="mod" />
        </page>

        <file name="sitemap.xml" ref="//slothsoft@farah/sitemap-generator" />
        <file name="favicon.ico" ref="/static/icons/Ambermoon" />
    </xsl:template>


    <xsl:template match="mod">
        <xsl:variable name="game" select="../@name" />
        <page name="{@name}" redirect="GameData/" status-active="">
            <xsl:if test="not(@hidden)">
                <xsl:attribute name="status-public" />
            </xsl:if>
            <xsl:if test="@repository">
                <sfm:param name="repository" value="{@repository}" />
            </xsl:if>
            <sfm:param name="version" value="{@name}" />
            <page name="SaveEditor" title="SavegameEditor" ref="pages/{$game}/editor" status-active="" status-public="">
                <sfm:param name="infosetId" value="lib.save" />
            </page>
            <page name="GameEngine" title="GameEditor" ref="pages/{$game}/description" status-active="" status-public="">
                <page name="DictionaryEditor" title="DictionaryEditor" ref="pages/{$game}/editor" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.dictionaries" />
                </page>
                <page name="ItemEditor" title="ItemEditor" ref="pages/{$game}/editor" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.items" />
                </page>
                <page name="NPCEditor" title="NPCEditor" ref="pages/{$game}/editor" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.npcs" />
                </page>
                <page name="MonsterEditor" title="MonsterEditor" ref="pages/{$game}/editor" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.monsters" />
                </page>
                <page name="SpellEditor" title="SpellEditor" ref="pages/{$game}/editor" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.spells" />
                </page>
                <!-- <page name="Places" title="PlaceEditor" ref="pages/{$game}/editor" status-active="" status-public=""> <sfm:param name="infosetId" value="lib.places" /> </page> <page name="Maps" title="MapEditor" ref="pages/{$game}/editor" status-active="" status-public=""> <sfm:param name="infosetId" 
                    value="lib.maps" /> </page> <page name="Extra" title="ExtraEditor" ref="pages/{$game}/editor" status-active="" status-public=""> <sfm:param name="infosetId" value="lib.extra" /> </page> -->
            </page>
            <page name="GameData" title="GameData" ref="pages/{$game}/description" status-active="" status-public="">
                <page name="ItemList" title="ItemList" ref="pages/{$game}/resource" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.items" />
                </page>
                <page name="PCList" title="PCList" ref="pages/{$game}/resource" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.pcs" />
                </page>
                <page name="NPCList" title="NPCList" ref="pages/{$game}/resource" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.npcs" />
                </page>
                <page name="MonsterList" title="MonsterList" ref="pages/{$game}/resource" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.monsters" />
                </page>
                <page name="ClassList" title="ClassList" ref="pages/{$game}/resource" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.classes" />
                </page>
                <page name="PortraitList" title="PortraitList" ref="pages/{$game}/resource" status-active="" status-public="">
                    <sfm:param name="infosetId" value="lib.portraits" />
                </page>
                <!-- <page name="Maps2D" title="Maps2D" ref="pages/{$game}/resource" status-active="" status-public=""> <sfm:param name="infosetId" value="lib.maps-2d" /> </page> <page name="Maps3D" title="Maps3D" ref="pages/{$game}/resource" status-active="" status-public=""> <sfm:param name="infosetId" 
                    value="lib.maps-3d" /> </page> <page name="WorldmapLyramion" title="WorldmapLyramion" ref="pages/{$game}/resource" status-active=""> <sfm:param name="infosetId" value="lib.worldmap-lyramion" /> </page> <page name="WorldmapKire" title="WorldKire" ref="pages/{$game}/resource" status-active="" status-public=""> 
                    <sfm:param name="infosetId" value="lib.worldmap-kire" /> </page> <page name="WorldmapMorag" title="WorldmapMorag" ref="pages/{$game}/resource" status-active="" status-public=""> <sfm:param name="infosetId" value="lib.worldmap-morag" /> </page> -->
            </page>
        </page>
    </xsl:template>
</xsl:stylesheet>