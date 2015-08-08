    Sub FwdPrimes()
        Dim ol As Outlook.Application
        Dim expl As Outlook.Explorer
        Dim folder As Outlook.folder
        Dim obj As Object
        Dim mail As Outlook.MailItem
        Dim fwdFilter As String         ' What are we looking for?
        fwdFilter = "prime"
        Set ol = Application
        Set expl = ol.ActiveExplorer
        Set folder = expl.CurrentFolder
        For Each obj In folder.Items
            With obj
                If obj.Class = olMail Then
                    Set mail = obj
                    If Not (InStr(mail.Subject, fwdFilter) = 0) Then
                        sendPrimes mail
                    End If
                End If
            End With
        Next
    End Sub
    Sub sendPrimes(mail As Outlook.MailItem)
        If IsNumeric(mail.Body) Then
            Dim newMessage As Outlook.MailItem
            With mail
                Set newMessage = mail.Reply
                Dim max As Integer
                max = CInt(mail.Body)
                Dim primes() As Integer
                primes = findPrimes(max)
                    newMessage.Body = intsToString(primes)
                    newMessage.Send
            End With
        Else
            newMessage.Body = "Give me a number and only a number, please."
            newMessage.Send
        End If
    End Sub
    Function findPrimes(max As Integer)
        ' Get all prime numbers between zero and max
        Dim primes() As Integer
        Dim candidates() As Integer
        ReDim candidates(0) As Integer
        If max > 1 Then
            ReDim primes(0) As Integer
            primes(0) = 2
            If max > 2 Then
                candidates() = getCandidates(max)
                While ((Not UBound(candidates) = 0) And (candidates(0) ^ 2 <= max))
                    arraySize = UBound(primes) + 1
                    ReDim Preserve primes(0 To (arraySize)) As Integer
                    primes(arraySize) = candidates(0)
                    candidates = red(candidates, candidates(0))
                Wend
            End If
            Dim oldBound As Integer
            oldBound = UBound(primes)
            ReDim Preserve primes(oldBound + UBound(candidates) + 1)
            For X = 0 To UBound(candidates) Step 1
                primes(oldBound + 1 + X) = candidates(X)
            Next
        End If
        findPrimes = primes
    End Function
    Function red(candidates() As Integer, prime As Integer)
        Dim keep() As Integer
        ReDim keep(0)
        For X = 1 To UBound(candidates) Step 1
            If Not (candidates(X) Mod prime = 0) Then
                keep(UBound(keep)) = candidates(X)
                ReDim Preserve keep((UBound(keep)) + 1)
            End If
        Next
        ReDim Preserve keep(0 To UBound(keep) - 1) ' Remove the extra element
        red = keep
    End Function
    Function getCandidates(max As Integer)
        If max > 2 Then
            Dim candidates() As Integer     ' I think this is the only way to create a
            ReDim candidates(0)             ' dynamic array.
            candidates(0) = 3
            If max > 4 Then
                For X = 5 To (max) Step 2
                    ' Ugly solution for appending to the array, but hey, we built this city
                    ' on ugly solutions and ugly solutions alone.
                    ReDim Preserve candidates(UBound(candidates) + 1)
                    candidates(UBound(candidates)) = X
                Next
            End If
        End If
        getCandidates = candidates
    End Function

Function intsToString(a)
    On Error GoTo EmptyArrayHandler:
        Dim newSize As Integer
        newSize = UBound(primes)
        Dim primestrings() As String
        ReDim primestrings(newSize)
        For X = 0 To UBound(primes) Step 1
            primestrings(X) = CStr(primes(X))
        Next
        intsToString = Join(primestrings)
Exit Function
EmptyArrayHandler:
    intsToString = " "
End Function
