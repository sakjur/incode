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
    End If
End Sub

Function findPrimes(max As Integer)
    Dim primes() As Integer
    Dim candidates() As Integer
    ReDim candidates(0) As Integer
    If max > 1 Then
        ReDim primes(0) As Integer
        primes(0) = 2
        If max > 2 Then
            candidates(0) = 3
            If max > 4 Then
                 For X = 5 To (max) Step 2
                     ReDim Preserve candidates(UBound(candidates) + 1)
                     candidates(UBound(candidates)) = X
                 Next
            End If
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
    ReDim Preserve keep(0 To UBound(keep) - 1)
    red = keep
End Function

Function intsToString(a)
    On Error GoTo EmptyArrayHandler:  ' This is dangerous.
        Dim newSize As Integer
        newSize = UBound(primes)
        Dim primestrings() As String
        ReDim primestrings(newSize)
        For X = 0 To UBound(primes) Step 1
            primestrings(X) = CStr(primes(X))
        Next
        intsToString = Join(primestrings)
Exit Function
EmptyArrayHandler:  ' But what if? No. Nothing can go wrong here.
    intsToString = " "
End Function
