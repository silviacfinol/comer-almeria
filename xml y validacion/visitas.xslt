<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Visitas a mi web</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                    }
                    table {
                        border-collapse: collapse;
                        width: 100%;
                        max-width: 800px;
                    }
                    th, td {
                        border: 1px solid #ccc;
                        padding: 10px;
                        text-align: left;
                    }
                    th {
                        background-color: #333;
                        color: white;
                        font-weight: bold;
                    }
                    tr.chrome {
                        background-color: yellow;
                    }
                    tr.edge {
                        background-color: blue;
                        color: white;
                    }
                </style>
            </head>
            <body>
                <h1>Visitas a mi web</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Navegador</th>
                            <th>Duración</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="visitas/visita">
                            <xsl:sort select="fecha" order="ascending"/>
                            <xsl:sort select="hora" order="ascending"/>
                            <xsl:variable name="navegador" select="translate(navegador, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
                            <tr>
                                <xsl:attribute name="class">
                                    <xsl:value-of select="$navegador"/>
                                </xsl:attribute>
                                <td><xsl:value-of select="fecha"/></td>
                                <td><xsl:value-of select="hora"/></td>
                                <td><xsl:value-of select="navegador"/></td>
                                <td><xsl:value-of select="duracion"/> seg</td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>