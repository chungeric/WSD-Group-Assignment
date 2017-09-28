<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : bookings.xsl
    Created on : 27 September 2017, 6:59 PM
    Author     : ericchung
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="userType"/>
    <xsl:param name="studentEmail"/>
    <xsl:param name="tutorEmail"/>
    <xsl:template match="/">
        <table class="tableResults">
            <xsl:choose>
                <xsl:when test="$userType = 'Student'">
                    <thead>
                        <tr>
                            <td>Booking ID</td><td>Subject</td><td>Tutor Name</td><td>Tutor Email</td><td>Booking Status</td>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates />
                    </tbody>
                </xsl:when>
                <xsl:otherwise>
                    <thead>
                        <tr>
                            <td>Booking ID</td><td>Subject</td><td>Student Name</td><td>Student Email</td><td>Booking Status</td>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates />
                    </tbody>
                </xsl:otherwise>
            </xsl:choose>
        </table>
    </xsl:template>
    
    <!--  
        Matching any booking that has a studentEmail or tutorEmail that we sent in as parameter  
        One of them will have no value as we pass in the parameter depending on their user type
        See bookings.jsp
    -->
    <xsl:template match="booking[studentEmail = $studentEmail] | booking[tutorEmail = $tutorEmail]">
        <xsl:variable name="bookingStatusVar" select="bookingStatus"/>
        
        <!--  
            New table row for each matched booking
        -->
        <tr class="bookingTableRow">
            
            <td><xsl:value-of select="bookingID"/></td>
            <td><xsl:value-of select="subject"/></td>
            
            <xsl:choose>
                

                <!--  
                    IF user is a STUDENT, then we show them this data
                -->
                
                
                <xsl:when test="$userType = 'Student'">
                    <td><xsl:value-of select="tutorName"/></td>
                    <td><xsl:value-of select="tutorEmail"/></td>
                    <!-- This class is used for filtering bookings.jsp -->
                    <td class="{$bookingStatusVar}"> 
                        <xsl:choose>
                            <!--  
                                IF this booking's status is currently active, then add a cancel button
                                to the table that allows the user to cancel this booking
                            -->
                            <xsl:when test="$bookingStatusVar = 'active'">
                                <xsl:value-of select="bookingStatus"/>
                                <form method="POST" action="cancelBookingAction.jsp">
                                    <input type="hidden" name="bookingID">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="bookingID" />
                                        </xsl:attribute>
                                    </input>
                                    <input type="submit" value="Cancel booking"/>
                                </form>
                            </xsl:when>
                            <!--  
                                IF this booking's status is currently anything OTHER THAN active
                                then we simply display the status (cancelled or completed)
                            -->
                            <xsl:otherwise>
                                <xsl:value-of select="bookingStatus"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </xsl:when>
                
                
                

                <!--  
                    IF user is a TUTOR, then we show them this data
                -->

                <xsl:otherwise>
                    <td><xsl:value-of select="studentName"/></td>
                    <td><xsl:value-of select="studentEmail"/></td>
                    <td class="{$bookingStatusVar}">
                        <xsl:choose>
                            <!--  
                                IF this booking's status is currently active, then add a cancel button
                                and a complete button to the table that allows the tutor to either 
                                cancel this booking or complete the booking
                            -->
                            <xsl:when test="$bookingStatusVar = 'active'">
                                
                                <xsl:value-of select="bookingStatus"/>

                                <form method="POST" action="cancelBookingAction.jsp">
                                    <input type="hidden" name="bookingID">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="bookingID" />
                                        </xsl:attribute>
                                    </input>
                                    <input type="submit" value="Cancel booking"/>
                                </form>

                                <form method="POST" action="completeBookingAction.jsp">
                                    <input type="hidden" name="bookingID">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="bookingID" />
                                        </xsl:attribute>
                                    </input>
                                    <input type="submit" value="Complete booking"/>
                                </form>
                                
                            </xsl:when>
                            <!--  
                                IF this booking's status is currently anything OTHER THAN active
                                then we simply display the status (cancelled or completed)
                            -->
                            <xsl:otherwise>
                                <xsl:value-of select="bookingStatus"/>
                            </xsl:otherwise>

                        </xsl:choose>
                    </td>
                </xsl:otherwise>
            </xsl:choose>
        </tr>
    </xsl:template>
    
    <xsl:template match="text()" />

</xsl:stylesheet>
