<!-- 
	jGrouseDoc template file. Detailed documentation for file, shown in the main frame
	@Copyright (c) 2007 by Denis Riabtchik. All rights reserved. See license.txt and http://jgrouse.com for details@
	$Id: fileDetail.xslt 249 2007-11-12 00:51:31Z denis.riabtchik $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:param name='objName' />
    <xsl:param name='objType' />
	<xsl:param name='rootPath' />
	<xsl:param name='version'/>
	<xsl:param name='aux_css'>not_specified</xsl:param>
	<xsl:output method='HTML' doctype-public="-//W3C//DTD HTML 4.01//EN"
		doctype-system="http://www.w3.org/TR/html4/strict.dtd">
	</xsl:output>
    <xsl:import href="../../common/xslt/common.xslt"/>


	<xsl:template match="/">
        <xsl:comment>Generated by jGrouseDoc</xsl:comment>
        <xsl:apply-templates select="/jgdoc/items/*[@id=$objName]"/>
    </xsl:template>
    
    <xsl:template match="/jgdoc/items/*">
	
		<html>
		    <head>
                 <xsl:call-template name="writeCss">
                     <xsl:with-param name="rootPath"><xsl:value-of select="$rootPath"/></xsl:with-param>
                     <xsl:with-param name="aux_css"><xsl:value-of select="$aux_css"/></xsl:with-param>
                 </xsl:call-template>
            </head>
			<body>
			    <div class="physicalDetail"> 
			    <xsl:call-template name="navbarPhys"/>
                 <br/>
				<H2>
					<xsl:value-of select="$objType"/><xsl:text> </xsl:text>
					<xsl:value-of select="comment/name" />
				</H2>
				<xsl:element name='br' />
				<!-- description -->			
				<xsl:for-each
					select='comment/commentContent'>
					<a name="description"></a>
					<div><span class="descSection">Description</span></div>
					<div>
						<xsl:apply-templates
							select='comment/commentContent'/>
					</div>
				</xsl:for-each>
				<xsl:apply-templates select="comment" mode="genCommonAttrs"/>
				<p />
				<!--============== Build top level summaries ===================== -->
				<!-- Modules -->
                <xsl:apply-templates select="children" mode="writeSummary">
                    <xsl:with-param name="elementType">module</xsl:with-param>
                    <xsl:with-param name="elementName">Modules</xsl:with-param>
                </xsl:apply-templates>
				

                <xsl:apply-templates select="children" mode="writeSummary">
                    <xsl:with-param name="elementType">interface</xsl:with-param>
                    <xsl:with-param name="elementName">Interfaces</xsl:with-param>
                </xsl:apply-templates>

                <xsl:apply-templates select="children" mode="writeSummary">
                    <xsl:with-param name="elementType">class</xsl:with-param>
                    <xsl:with-param name="elementName">Classes</xsl:with-param>
                </xsl:apply-templates>
                
                <xsl:apply-templates select="children" mode="writeSummary">
                    <xsl:with-param name="elementType">object</xsl:with-param>
                    <xsl:with-param name="elementName">Objects</xsl:with-param>
                </xsl:apply-templates>

                <xsl:apply-templates select="children" mode="writeSummary">
                    <xsl:with-param name="elementType">struct</xsl:with-param>
                    <xsl:with-param name="elementName">Structures</xsl:with-param>
                </xsl:apply-templates>

                <xsl:apply-templates select="children" mode="writeSummary">
                    <xsl:with-param name="elementType">variable</xsl:with-param>
                    <xsl:with-param name="elementName">Variables</xsl:with-param>
                </xsl:apply-templates>

				
                <xsl:apply-templates select="children" mode="writeSummary">
				    <xsl:with-param name="elementType">function</xsl:with-param>
				    <xsl:with-param name="elementName">Functions</xsl:with-param>
				</xsl:apply-templates>
				
                <xsl:apply-templates select="children" mode="writeSummary">
                    <xsl:with-param name="elementType">ifunction</xsl:with-param>
                    <xsl:with-param name="elementName">Function Interfaces</xsl:with-param>
                </xsl:apply-templates>
                </div>
			</body>
		</html>
	</xsl:template>



</xsl:stylesheet>
