#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: ergo-colors.penumbra-light,  
    styles: ergo-styles.classic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Aluffi Ring Chapter 2 Section 1 Exercises",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= 1.1//1
#problem[
  Let $R$ be a Noetherian ring, and let $I$ be an ideal of $R$. Prove that $R\/I$ is a Noetherian ring.
][
  Since $R$ is Noetherian, every ideal of $R$ is finitely generated. Then, since ideal of $R\/I$ has a one-to-one correspondance with ideals in $R$ containing $I$ by projection. Because the Homomorphic Image of finitely generated $R$-modules are finitely generated (with projection being an $R$-module homomorphism also), every ideal of $R\/I$ is finitely generated, thus $R\/I$ is Noetherian.
]

\ 

= 1.2
#problem[
  Prove that if $R[x]$ is Noetherian, so is $R$ (Converse of Hilbert's Basis Theorem).
][
  Any homomorphic image of a Noetherian ring is also Noetherian based on #text(weight: "bold")[Problem 1.1]. Then, simply define the evaluation $phi:R[x]->> R$ by $phi(f) = f(0)$. This shows that $R$ is a homomorphic image of $R[x]$, hence Noetherian.
]

\ 

#theorem("Hilbert's Basis Theorem")[
  Given Noetherian ring $R$, its polynomial ring $R[x]$ is Noetherian.
][
  Given any ideal $J subset.eq R[x]$, define the subset $I subset.eq R$ by $I = {a in R | exists f in J, f= a x^n+...+a_0}$ (i.e. all the leading coefficients of elements in $J$).

  \ 

  We first show $I subset.eq R$ is an ideal: Given any $a,b in I$, there exists $f,g in J$, such that $f = a x^n+...+a_0$ and $g = b x^m+...+b_0$. WLOG, assume that $n>= m$, then we have $f+x^(n-m)g = (a x^n+...+a_0) - (b x^n+...+b_0 x^(n-m)) = (a-b)x^n+... in J$, showing that $a-b in I$. Hence, by subgroup test, $I$ is a subgroup of $R$ under addition.

  Now, given any $r in R$ and $a in I$, let $f = a x^n+...+a_0 in J$, one has $r f = (r a)x^n+...+(r a_0) in J$, showing $r a in I$. Therefore, $I$ is an ideal.

  \ 

  Then, since $R$ is Noetherian, $I$ is finitely generated, say $I=(a_1,...,a_n)$. Then, there exists polynomials $f_1,...,f_n in J$, each $f_i = a_i x^(k_i)+...+a_(i,0)$. Let $k = max{deg(f_1),...,deg(f_n)}$ (so each $k - k_i >=0$). We shall express every element in $J$ (more specifically, their components with all monomial with degree $>=k$) as some combination of $f_1,...,f_n$ to reduce it to cases with degree less than $k$:

  Given any $f in J$ with degree $>=k$, say $f = b x^k+...+b_0$. Since $b in I$, there exists $r_1,...,r_n in R$ such that $b=r_1a_1+...+r_n a_n$. Then, consider the term $f_1 = f - r_1 x^(k-k_1)f_1 - ... - r_n x^(k-k_n)f_n$. Each $r_i x^(k-k_i)f_i$ has leading term $r_i x^(k-k_i) dot a_i x^(k_i) = r_i a_i x^k$, hence the leading term of the entier expression (before verifying it's $0$) is $b x^k - r_1a_1 x^k-...-r_n a_n x^k = (b-(r_1a_1+...+r_n a_n))x^k = 0$, showing either $f_1=0$, or $deg(f_1)<deg(f)$. No matter what, by induction one can reduce $f$ to a combination of $f_1,...,f_n$, together with a polynomial $f_l$ with degree $<k$.

  \ 

  Finally, if consider $J_k := J sect (sum_(i=0)^(k-1)R x^(i))$ (i.e. all polynomials in $J$ with degree less than $k$). Notice that $sum_(i=0)^(k-1)R x^(i) tilde.equiv plus.circle.big_(i=0)^(k-1)R x^i$ as $R$-module, which is isomorphic to $R^(plus.circle k)$. Hence, with $R$ being Noetherian, $R^(plus.circle k)$ is a Noetherian $R$-module, showing that $J_k$ (identified as a submodule of it) is finitely-generated $R$-module. So, there exists $g_1,...,g_p in J_k$, such that $J_k = sum_(i=1)^p R g_i$.

  As a result, since $f$ can be expressed as polynomial combination of $f_1,...,f_n$ together with some $f_l in J_k$ (a polynomial with degree $<k$, and it's guaranteed to be in $J_k$, since $f,f_1,...,f_n$ are all in $J$), then $f_l$ is a ($R$)-linear combination of $g_1,...,g_p$. This shows that $f in (f_1,...,f_n, g_1,...,g_p)$, or $J subset.eq (f_1,...,f_n,g_1,...,g_p)$, and since all generators are in $J$, this is in fact an equality.

  \ 

  Hence, $J$ is finitely generated, showing that $R[x]$ is Noetherian.
]

\ 

= 1.3 (ND)
#problem[
  Let $k$ be a field, and let $f in k[x]$ be a nonconstant polynomia. For every subring $R$ of $k[x]$ containing $k$ and $f$, a homomorphism $phi:k[t]-> R$ by extending the identity on $k$ and mapping $t$ to $f$. This makes every such $R$ a $k[t]$-algebra.

  - Prove that $k[x]$ is finitely generated as a $k[t]$-module.
  - Prove that every subring $R$ as above is a finite generated $k[t]$-module.
  - Prove that every subring of $k[x]$ containing $k$ is a Noetherian ring.
][
  1. 
]

\ 

= 1.4
#problem[
  Let $R$ be the ring of real-valued continuous functions on the interval $[0,1]$. Prove that $R$ is not Noetherian.
][
  This suffices to find a chain of increasing ideals that does not stabilize. Define the set $I_n := {f in R | f(x)=0, forall x in [0,1/n]}$, for all $n in NN\\{0}$.

  \ 

  First, each of them is an ideal: Given any $f,g in I_n$, one has every $x in [1,1/n]$ satisfies $(f-g)(x) = f(x)-g(x)=0$, hence $f-g in I_n$, showing $I_n$ is a subgroup under addition.

  On the other hand, given any $h in R$ and $f in I_n$, one has all $x in [0,1/n]$ satisfies $(h dot f)(x) = h(x) f(x) = 0$, hence $h dot f in I_n$. Hence, $I_n$ is an ideal.

  \ 

  Then, based on definition it's clear that $I_1 subset.eq I_2 subset.eq ... subset.eq I_n subset.eq ...$. Now we claim that each is a strict inclusion:

  Given any $n in NN\\{0,1}$, define the following function $f_n$:
  $ f_n (x) = cases(
    0  & x in [0,1/n],
    x-1/n quad & x in [1/n, 1]
  ) $
  Then, $f_n$ is clearly continuous on $[0,1]$, together with $f_n in I_n$. Yet, $f_n in.not I_(n-1)$, since for any $x in (1/n,1/(n-1)]$ (which is a nonempty set), one has $f_n (x)!=0$. So, the chain of increasing ideals is in fact not stabilizing, proving that $R$ is not Noetherian.
]

\ 

= 1.5
#problem[
  Determine for which sets $S$ the power set ring $cal(P)(S)$ is Noetherian.

  Note:
  $ forall A,B in cal(P)(S), quad A+B := A\\B union B\\A, quad A dot B := A sect B $
  Which, under this ring, $A + emptyset = A\\emptyset union emptyset \\ A = A$ (so $emptyset$ is the zero), $A + A = A\\A union A\\A = emptyset$ (so everything has self additive inverse, which has characteristic $2$), and $A dot S = A sect S = A$ (so $S$ is the unity).
][
  We'll claim that $cal(P)(S)$ is Noetherian iff $S$ is a finite set.

  \ 
  
  $<==:$

  First, it's clear that if $S$ is finite, $cal(P)(S)$ is finite, hence Noetherian (since finite implies all ideals are finite, hence finitely generated).

  \ 

  \ 

  $==>:$

  Then, we'll prove by contrapositive: Suppose $S$ is infinite, consider the ideal $I subset.eq cal(P)(S)$ formed by all finite subsets of $S$ (including $emptyset$). It's clear that $I$ is an ideal: Any finit subset $A,B in I$, one has $A+B = A\\B union B\\A subset.eq A union B$ being finite, hence $A-B = A+(-B) = A+B in I$, showing $I$ is a subgroup under addition. Also, for all $C in cal(P)(S)$ and $A in I$, since $C dot A = C sect A subset.eq A$ is finite, $C sect A in I$. So, $I$ is an ideal.

  \ 

  Now, we claim that $I$ is not finitely generated: Suppose the contrary, that $I = (A_1,...,A_n)$ (each finite subset). WLOG, one can assume $A_1,...,A_n$ are all mutually disjoint: 

  This can be achieved by the fact that $(A,B\\A) = (A,B)$, and induction: 
  
  First, since one has the following:
  $ B\\A &= B\\(A sect B) = B\\(A sect B) union emptyset \
  &= B\\(A sect B) union (A sect B)\\B \
  &= B+(A sect B) = B + A dot B $
  so $(A,B\\A) subset.eq (A,B) $.
  
  On the other hand, one has: 
  $ (B\\A) + B dot A &= (B\\(A sect B)) + (A sect B) \
  &= ((B\\(A sect B))\\(A sect B)) union ((A sect B)\\(B\\(A sect B)))\
  & B union (A sect B)=B $
  So, this concludes that $(A,B) subset.eq (A, B\\A)$.

  Hence, inductively, one can say $(A_1,...,A_n) = (A_1, A_2\\A_1,..., A_n \\ (A_1 union ... A_(n-1)))$, which the generators are mutually disjoint.

  \ 

  As a result, consider any singleton ${s} in cal(P)(S)$: Since ${s} in I$, there exists $C_1,...,C_n in cal(P)(S)$, such that ${s} = C_1 dot A_1+...+C_n dot A_n$. However, with each $A_i$ being mutually disjoint, one has ${s} = (C_1 sect A_1) union.sq ... union.sq (C_n sect A_n)$, showing that $s in C_i sect A_i subset.eq A_i$ for some index $i$. Hence, one has $S = union.big_(i=1)^n A_i$ (sine every element is in one of the $A_i$). Yet, it also implies $S$ is finite, contradicting our assumption.

  So, $I$ is not finitely generated, showing that $cal(P)(S)$ is not Noetherian.
]

\ 

= 1.7 (ND)
#problem[
  Prove that if $R$ is a Noetherian ring, then the ring of power series ring $R[[x]]$ is also Noetherian.

  (Hint: Look at the dominant coefficient, i.e. the smallest degree nonzero coefficient, and use the similar idea in Hilbert's Basis Theorem to construct an ideal in $R$; finally, use the ascending chain condition on $R$).
][
  Given any ideal $J_n subset.eq R[[x]]$, define the subset $I_n subset.eq R$ by all the dominant coefficients of elements in $J_n$, together with $0$. Hence, $I_n = {a in R | sum_(i=k)^infinity a_i x^i in J_n, quad a_k = a}$.

  \

  First, $I_n$ is a subgroup under addition, since given any $a,b in I_n$, say $a x^k + sum_(i=k+1)^infinity a_i x^i$ and $b x^l + sum_(j=l+1)^infinity b_j x^j$ are elements in $J_n$ (also, WLOG, assume $k>= l$). Then, one has the following:
  $ &(a x^k+sum_(i=k+1)^infinity a_i x^i)-x^(k-l)(b x^l+sum_(j=l+1)^infinity b_j x^j)\ 
  &= (a x^k+sum_(i=k+1)^infinity a_i x^i)-(b x^k + sum_(j=l+1)^infinity b_j x^(k+j-l))\ 
  &= (a-b)x^k + sum_(i=k+1)^infinity (a_i - b_(i-(k-l)))x^i $
  Hence, one has $a-b in I_n$, showing $I_n$ is a subgroup under addition.

  Also, given any $a x^k+sum_(i=k+1)^infinity a_i x^i in J_n$ (or arbitrary $a in I_n$), and any $c x^l + sum_(j=l+1)^infinity c_j x^j in R[[x]]$, one has:
  $ c(a x^k+sum_(i=k+1)^infinity a_i x^i)= (a c)x^k+sum_(i=k+1)^infinity (c a_i)x^i $
  This shows that $c a in I_n$, hence $I_n$ is an ideal.

  \ 

  Now, given $J_1 subset.eq J_2 subset.eq ...$ an ascending chain of ideals in $R[[x]]$, it's clear that the corresponding ideals form a chain $I_1 subset.eq I_2 subset.eq...$ in $R$. By the Noetherian property, such chain stabilizes, so there exists $N in NN$, such that $I_N = I_(N+1)=...$. Then, we claim that this equality also happens on the level of $J_n$'s:


]

\ 

= 1.8
#problem[
  Prove that every ideal in a Noetherian ring $R$ contains a finite product of prime ideals. (Hint: Zorn's Lemma, on the family of ideals without this property, then proceed by contradiction).
][
  Suppose the contrary that there are some ideals not containig finite product of prime ideals. Let $Sigma$ represents such family of ideals, which forms a POset. 

  Because $R$ is Noetherian, any collection of ideals (as a POset) must have maximal elements, say $M in Sigma$ is such maximal element.

  \ 

  As an ideal, because $M$ is not prime, so there exists $a,b in R\\M$, such that $a b in M$. Then, consider the two ideals $M+(a)$ and $M+(b)$: Because they strictly contains $M$, by the maximality of $M$ within $Sigma$, these two new ideals can't be in $Sigma$, so they contain finite product of prime ideals. Say $J_1 subset.eq M+(a)$ and $J_2 subset.eq M+(b)$ are finite product of prime ideals.

  However, consider the fact that $(M+(a))(M+(b)) = M^2+M(a)+M(b)+(a)(b) subset.eq M+(a b) subset.eq M$ (since $a b in M$), then the product $J_1 J_2 subset.eq M$, while it's a finite product of prime ideals. This contradictts the assumption that $M in Sigma$.

  As a result, our claim is false, all ideal in $R$ must contain a finite product of prime ideals.
]

\ 

= 1.9
#problem[
  Let $R$ be a commutative ring, and let $I subset.eq R$ be a proper ideal. (Assume we know the existence of minimal prime ideals for commutative rings), in particular this applies to all primes containing $I$ (called the #emph[minimal primes] of $I$). Prove that if $R$ is Noetherian, then the set of minimal primes of $I$ is finite.
][
  Suppose the contrary that there exists ideal $I subset.eq R$, such that its set of minimal primes is finite. Let $Sigma$ collects all such ideals (which is nonempty by assumption), hence by the Noetherian property of $R$, $Sigma$ has a maximal element, say $J$.

  \ 

  First, notice that $J$ is not prime (as if it's prime, then $J$ is not only a minimal prime containing itself, but "the minimum", as all prime ideals strictly containing it cannot be minimal), hence there exists $a,b in R\\J$, such that $a b in J$.

  Now, consider the ideals $J+(a), J+(b)$ that strictly contains $J$: By maximality of $J$, one deduces that $J+(a), J+(b) in.not Sigma$, hence both of them have finite set of minimal prime ideals containing it.

  Then, notice that since $a b in J$, one has $(J+(a))(J+(b)) subset.eq J$. As a result, if $P$ is a minimal prime ideal of $J$, since $(J+(a))(J+(b)) subset.eq P$, one must have $P$ containing one of the ideals; furthermore, if say $J+(a) subset.eq P$, it's in fact a minimal prime ideal of $J+(a)$ (since if there are any prime ideal $P' subset.neq P$ that contains $J+(a)$, it also contains $J$, which violates the minimality of $P$ as prime ideals of $J$).

  So, let $S_J$ denotes all minimal prime ideals of $J$ (which is infinite), one has $S_J subset.eq S_(J+(a)) union S_(J+(b))$ by the above claim. Yet, with both $J+(a),J+(b)$ having finite minimal prime ideals, this implise $S_J$ is also finite, which is a contradiction.

  \ 

  So, our assumption is wrong, every ideal must associates to finite minimal prime ideals.
]

\ 

= 1.10
#problem[
  A ring is #emph[Artinian] if it satisfies the Descending Chain Condition (d.c.c.) for ideals. Prove that if $R$ is Artinian and $I subset.eq R$ is an ideal, then $R\/I$ is Artinian. 
  
  Prove that if $R$ is an Artinian integral domain, then it's a field. (Hint: consider the descending chain of $(r) supset.eq (r^2) supset.eq ...$ for all nonzero $r in R$).

  Prove that Artinian rings have Krull dimension $0$, or all prime ideals are maximal.
][
  1. Given $R$ is Artinian, say $overline(J_1) supset.eq overline(J_2) supset.eq...$ is a descending chain within $R\/I$, then take their preimage under projection, say $J_n := p^(-1)(overline(J_i))$ (where $p:R->R\/I$ is the canonical projection), it also forms a descending chain $J_1 supset.eq J_2 supset.eq ...$. 
  
    Using the descending chain condition in $R$, one has this chain stabilizes at some $N in NN$, so $J_N=J_(N+1)=...$; as a result, since $p$ is surjective, one has $overline(J_n) = p(J_n)$ for all $n in NN$, hence $overline(J_N) = p(J_N)=p(J_(N+k)) - overline(J_(N+k))$ for all $k in NN$, showing $overline(J_n)$'s also is a chain that stabilizes. 
  
    Hence, $R\/I$ satisfies d.c.c., which is also Artinian.

    \ 

  2. Suppose $R$ is an Artinian integral domain, for any $r in R$ that's nonzero, one has the following descending chain of ideals:
    $ (r) supset.eq (r^2) supset.eq ... supset.eq (r^n) supset.eq ... $
    Notice that because $r!=0$ and $R$ is an integral domain, all these ideals are nonzero; also, because $R$ is Artinian, such descending chain stabilizes at some point, say $(r^N) = (r^(N+1))=...$. 
    
    This implies that $r^N = c dot r^(N+1)$ for some $c in R$. Which helps deduce the fact that $r^N (1-c r) = 0$. Yet, because $r^N!=0$, one must have $1-c r=0$, so $c r=1$, showing $r$ is a unit.

    Hence, this concludes that $R$ is a field.

    \ 

  3. To show that $R$ Artinian implies all its prime ideals are maximal, combining part 1 and 2, we have all prime ideals $P subset.neq R$ satisfies $R\/P$ being an Artinian domain, which is a field. As a consequence, $P$ is maximal.
]

#pagebreak()

= 1.11
#problem[
  Prove that the "associate" relation on elements in $R$ is an equivalence relation.
][
  First, for any $a in R$, one has $a tilde a$, since $(a)=(a)$ (reflexivity).

  Then,if $a tilde b$, then $(a)=(b)$, similarly $(b)=(a)$, showing $b tilde a$ (symmetric).

  Finally, $a tilde b$ and $b tilde c$ implies $(a)=(b)=(c)$, so $a tilde c$ (transitivity).
]

\ 

= 1.12
#problem[
  Let $R$ be an integral domain. Prove that a nonzero $a in R$ is irreducible iff $(a)$ is maximal among proper principal ideals of $R$.
][

  $==>:$

  First, suppose $a$ is irreducible, then for any $b in R$, suppose $(a) subset.eq (b)$, since $a=c b$ for some $c in R$, by irreducibility either $c$ is a unit (where $b = c^(-1)a$, so $(b)=(a)$), or $b$ is a unit (where $(b)=R$). This shows the maximality of $(a)$ among the proper principal ideals.

  \ 

  $<==:$ Suppose $(a)$ is maximal among all proper principal ideals, then for all $b,c in R$ such that $a = b c$, one has $(a) subset.eq (b)$. Which by maximality of $(a)$ among proper principal ideals, either $(a)=(b)$ or $(b) = R$.

  The second case is easier, since $(b)=R$ implies $b$ is a unit; else if $(a)=(b)$, this implies there exists $d in R$, such that $b = d a$. As a result, $a = b c= c d a$, so $(1-c d)a = 0$. Yet, sice $a!=0$ (since $(0)$ is clearly not maximal among proper principal ideals unless $R$ is a field, which can first be ruled out), and $R$ is an integral domain, one has $1-c d=0$, or $c d=1$. Hence, $c$ is a unit.

  This shows that $a = b c$ implies either $b$ or $c$ is a unit, showing $a$ is irreducible.
]

\ 

= 1.13 
#problem[
  Prove that, for nonzero elements, prime $<==>$ irreducible in $ZZ$.
][
  It's clear that prime elements are irreducible (which is a theorem among commutative rings).

  Now, suppose $a in ZZ$ is irreducible (WLOG, assume $a$ is positive, since multiplying $pm 1$ the units doesn't change the irreducibility). If $a = b c$ for some $b,c in ZZ$ (which, WLOG can also assume $b,c$ are positive), then one of $b,c$ must be a unit, which is limited to $pm 1$ for $ZZ$ (more specifically, $1$ since we're limited to positive case). So, this is the equivalent condition for being prime in elementary number theory.

  Since prime elements of $ZZ$ as a ring coincides with the traditional definition of prime numbers (up to $pm$ sign), all irreducibles must also be prime.
]

#pagebreak()

= 1.14
#problem[
  For $a,b$ in a commutative ring $R$, prove that the $overline(a) in R\/(b)$ is prime iff $overline(b) in R\/(a)$ is prime.
][
  It suffices to show that $(R\/(a))/((overline(b))) tilde.equiv (R\/(b))/((overline(a)))$ (which can be achieved by showing them as isomorphic to the same quotient of $R$).

  \ 

  First, we have projections $p:R -> R\/(b)$, and $q:R\/(b)-> (R\/(b))/((overline(a)))$, this defines a surjective ring homomorphism $q compose p:R ->> (R\/(b))/((overline(a)))$, hence $(R\/(b))/((overline(a))) tilde.equiv R\/ker(q compose p)$.

  Now, we claim that $ker(q compose p) = (a,b)$: It's clear that $(a,b) subset.eq ker(q compose p)$ (as $q compose p(a) = q(overline(a))=0$, and $q compose p(b)= q(overline(0))=0$); on the other hand, if $c in ker(q compose p)$, one has $q(p(c)) = q(overline(c))=0$, showing that $overline(c) in (overline(a))$, or $overline(c) = overline(r) dot overline(a)$ for some $r in R$.

  As a result, $c - r a in (b)$, hence there exists $s in R$, such that $c-r a=s b$, showing $c = r a+ s b in (a,b)$. So, $ker(phi) = (a,b)$.

  \ 

  This shows that $(R\/(b))/((overline(a))) tilde.equiv R\/(a,b)$. However, after switching positions of $a,b$, one can also show that $(R\/(a))/((overline(b))) tilde.equiv R\/(a,b)$. Hence, the two rings we mentioned are isomorphic, which are integral domains together.

  Therefore, $overline(a) in R\/(b)$ is prime $<==>$ $(R\/(b))/((overline(a))) tilde.equiv (R\/(a))/((overline(b)))$ is an integral domain $<==>$ $overline(b) in R\/(a)$ is prime.
]

\ 

= 1.15
#problem[
  Identify $S=ZZ[x_1,...,x_n]$ in the natural way with a subring of the polynomial ring $R=ZZ[x_1,x_2,...]$ (countably infintely many variables). Prove that if $f in S$ and $(f) subset.eq (g)$ in $R$, then $g in S$ as well. Conclude that the ascending chain condition for principal ideals holds in $R$, and hence $R$ is a domain with factorizations.
][
  Suppose $(f) subset.eq (g) in R$, 
]