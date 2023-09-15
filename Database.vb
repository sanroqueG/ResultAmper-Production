Imports MySql.Data.MySqlClient



Public Class Database

    Public conn As New MySqlConnection("server=localhost; user=root; password=;database=app_resultamper")
    Public Function AbrirLigacao()
        Try
            If Not conn.State = ConnectionState.Open Then
                conn.Open()
            End If
        Catch ex As MySqlException
            MessageBox.Show(ex.Message, "ERRO!", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        Return Nothing
    End Function

    Public Function FecharLigacao()
        Try
            If Not conn.State = ConnectionState.Closed Then
                conn.Close()
            End If
        Catch ex As MySqlException
            MessageBox.Show(ex.Message, "ERRO!", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        Return Nothing
    End Function
End Class
