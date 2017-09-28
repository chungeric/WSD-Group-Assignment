<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="subject"/>
    <xsl:param name="name"/>
    <xsl:param name="status"/>
    
    <xsl:template match="tutors">
        <table class="tableResults">
            <thead>
                <tr>
                    <td>Name</td><td>Email</td><td>Subject</td><td>Status</td>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates />
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="tutor[subject = $subject] | tutor[name = $name] | tutor[status = $status]">
        <xsl:variable name="statusVar" select="status"/>
        <tr>
            <td class="tutorName"><xsl:value-of select="name"/></td>
            <td class="tutorEmail"><xsl:value-of select="email"/></td>
            <td class="tutorSubject"><xsl:value-of select="subject"/></td>
            
            <xsl:choose>
                
                <xsl:when test="$statusVar = 'Available'">
                    <td class="tutorStatus">
                        <xsl:value-of select="status"/>
                        <br/>
                        
                        <form method="POST" action="createBooking.jsp">
                            <input type="hidden" name="email">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="email" />
                                </xsl:attribute>
                            </input>
                            <input type="hidden" name="name">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="name" />
                                </xsl:attribute>
                            </input>
                            <input type="hidden" name="subject">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="subject" />
                                </xsl:attribute>
                            </input>
                            <input type="hidden" name="status">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="status" />
                                </xsl:attribute>
                            </input>
                            <input type="submit" value="Book tutor" />
                        </form>
                        
                    </td>
                </xsl:when>
                
                <xsl:otherwise>
                    <td class="tutorStatus">
                        <xsl:value-of select="status"/>
                    </td>
                </xsl:otherwise>
                
            </xsl:choose>
        </tr>
    </xsl:template>
    
    <xsl:template match="text()" />
    
</xsl:stylesheet>