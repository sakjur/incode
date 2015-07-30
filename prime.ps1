param ( $max = 100 )

# Finds multiples
function multiples($p, [int] $max)
{
    $i = 1
    $multiples = @()
    while ($p*$i -le $max)
    {
        $multiples += $p*$i
        $i += 1
    }
    return $multiples
}

# find primes
function getPrimes($n)
{
    $candidates = New-Object System.Collections.ArrayList
    ForEach($candidate In 2..$n)
    {
        $candidates.Add($candidate) >$null
    }
    $primes = @()
    while($candidates.length -gt 0)
    {
        $primes += $candidates[0]
        $multiples = multiples $candidates[0] $n
        
        ForEach($composite In $multiples)
        {
            $candidates.Remove($composite)
        }
    }
    return $primes
}

getPrimes $max