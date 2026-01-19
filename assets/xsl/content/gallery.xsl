<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sfm="http://schema.slothsoft.net/farah/module" xmlns:sfs="http://schema.slothsoft.net/farah/sitemap"
    xmlns:php="http://php.net/xsl" extension-element-prefixes="php">

    <xsl:import href="farah://slothsoft@farah/xsl/module" />

    <xsl:template match="/*">
        <article class="amber-post">
            <p>Eine lose Zusammenstellung von Bildern, hauptsächlich für meine eigenen Debug-Zwecke.</p>
            <details>
                <summary>
                    <h2>Alte Editor Screenshots</h2>
                </summary>
                <p>
                    <figure>
                        <img src="/slothsoft@amber.slothsoft.net/static/screenshots/character-editor" alt="Screenshot" />
                        <figcaption>Ein Ausschnitt aus dem Spielstand-Editor, für eines der möglichen Partymitglieder.</figcaption>
                    </figure>
                </p>
                <p>
                    <figure>
                        <img src="/slothsoft@amber.slothsoft.net/static/screenshots/map-editor" alt="Screenshot" />
                        <figcaption>Ein Ausschnitt aus dem Level-Editor, für eine der 2D-Karten.</figcaption>
                    </figure>
                </p>
            </details>
            <details>
                <summary>
                    <h2>Portraits</h2>
                </summary>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/portraits'" />
                </xsl:call-template>
            </details>
            <details>
                <summary>
                    <h2>Items</h2>
                </summary>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/items'" />
                </xsl:call-template>
            </details>
            <details>
                <summary>
                    <h2>Combat Backgrounds</h2>
                </summary>
                <xsl:apply-templates select="." mode="resource-images">
                    <xsl:with-param name="archive" select="'Combat_background.amb'" />
                </xsl:apply-templates>
            </details>
            <details>
                <summary>
                    <h2>Events</h2>
                </summary>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/events/1'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/events/2'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/events/3'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/events/4'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/events/5'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/events/6'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/events/7'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/events/8'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/events/9'" />
                </xsl:call-template>
            </details>
            <details>
                <summary>
                    <h2>Monsters</h2>
                </summary>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/1'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/2'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/3'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/4'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/5'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/6'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/7'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/8'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/9'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/10'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/11'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/12'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/13'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/14'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/15'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/16'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/17'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/18'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/19'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/20'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/21'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/22'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/23'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/24'" />
                </xsl:call-template>
                <xsl:call-template name="game-image">
                    <xsl:with-param name="gfx" select="'/ambermoon/gfx/monsters/25'" />
                </xsl:call-template>
            </details>
        </article>
    </xsl:template>

    <xsl:template match="*" mode="resource-images">
        <xsl:param name="archive" />
        <xsl:param name="palette" select="1" />

        <xsl:call-template name="resource-image">
            <xsl:with-param name="archive" select="$archive" />
            <xsl:with-param name="palette" select="$palette" />
        </xsl:call-template>

        <xsl:if test="$palette &lt; 49">
            <xsl:apply-templates select="." mode="resource-images">
                <xsl:with-param name="archive" select="$archive" />
                <xsl:with-param name="palette" select="$palette +1" />
            </xsl:apply-templates>
        </xsl:if>
    </xsl:template>

    <xsl:template name="resource-image">
        <xsl:param name="archive" />
        <xsl:param name="palette" select="49" />
        <xsl:variable name="url" select="concat('/slothsoft@amber/api/gfx?archiveId=', $archive, '&amp;paletteId=', $palette)" />

        <a href="{$url}" class="resource-image">
            <img src="{$url}" />
        </a>
    </xsl:template>

    <xsl:template name="game-image">
        <xsl:param name="gfx" />
        <xsl:variable name="url" select="concat('/slothsoft@amber/static', $gfx)" />

        <a href="{$url}" class="game-image">
            <img src="{$url}" />
        </a>
    </xsl:template>
</xsl:stylesheet>
