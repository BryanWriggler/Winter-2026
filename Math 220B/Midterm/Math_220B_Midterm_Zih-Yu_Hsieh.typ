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
    colors: ergo-colors.bw,  
    styles: ergo-styles.basic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 220B Midterm",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(1)")

= D//1
#problem[
  Let $A$ be a commutative ring. Prove or disprove that $A$ is a local ring if and only if $A[[x]]$ is a local ring.

  \ 

  #line(length: 100%)

  \ 
][
  /*Take $(x) subset.eq A[[x]]$. Note that it's contained in the jacobsonn radical.*/
  We'll prove that the two statements are equivalent. 
  
  Before the actual proof, let's do some observations:

  \

  1. Consider the ideal $(x) subset.eq A[[x]]$ and its effect: Given any power series $f(x) = sum_(n>=0)a_n x^n$, the term $1-x dot f(x) = 1-sum_(n>=0)a_n x^(n+1)$, which has constant term being $1$ (a unit in $A$), showing that $1-x dot f(x) in A[[x]]$ is invertible (this is due to the homework problem, where $f(x) = sum_(n>=0)a_n x^n$ is invertible in $A[[x]]$ iff $a_0 in U(A)$). Hence, by the characterization of Jacobson Radical, $x in J(A[[x]])$,so the ideal $(x) subset.eq J(A[[x]])$, which $(x)$ is contained in all maximal ideal of $A[[x]]$.

  \ 

  2. Consider the map $phi:A[[x]]->> A$ by $phi(sum_(n >=0)a_n x^n) = a_0$. This is in fact a ring homomorphism, because for any $f(x)=sum_(n>=0)a_n x^n$ and $g(x) = sum_(m>=0)b_m x^m$ in $A[[x]]$, they satisfy the following two equations:
    $ phi(f(x)+g(x)) &= phi(sum_(n>=0)(a_n + b_n)x^n)= a_0+b_0= phi(f(x))+phi(g(x)) $
    $ phi(f(x)g(x)) &= phi(sum_(k>=0)(sum_(n=0)^k a_n b_(k-n))x^k)= a_0 b_0= phi(f(x))phi(g(x))  $
    Which, given any $f(x)=sum_(n>=0)a_n x^n in A[[x]]$, one has: 
    
    $ f(x) in ker(phi) " " &<==> " " phi(f(x)) = a_0 = 0 " " <==>" " f(x) = sum_(n>=1)a_n x^n\ 
    &<==>" " f(x)=x dot sum_(n>=0)a_n x^(n-1)" " <==>" " f(x) in (x) $
    This proves that $ker(phi) = (x)$.

    Hence, one deduces that $A[[x]]\/(x) tilde.equiv A$; moreover, the sets ${"ideals" I subset.eq A[[x]] | (x) subset.eq I} <--> {"ideals" J subset.eq A}$ are in one-to-one correspondance via the associations $I mapsto phi(I)$ and $phi^(-1)(J) arrow.l.bar J$.

    Also, notice that such bijection preserves the inclusion as partial order: Given two ideals $I,I' subset.eq A[[x]]$ containing $(x)$, then $I subset.eq I'$ implies $phi(I) subset.eq phi(I')$; similarly, given two ideals $J,J' subset.eq A$, if $J subset.eq J'$, one has $phi^(-1)(J) subset.eq phi^(-1)(J')$.

    \ 

  Now, let's prove the actual correspondance:

  \ 

  $==>:$

  First, suppose $A$ is a local ring, let $frak(m) subset.neq A$ denotes its unique maximal ideal, then any proper ideal $J subset.neq A$ satisfies $J subset.eq frak(m)$. Hence, for any maximal ideal $M subset.neq A[[x]]$, since by (1) above we have $(x) subset.eq M$ (which, $M $ is in the set ${"ideal" I subset.eq A[[x]] | (x) subset.eq I}$), then by (2), one has $M =phi^(-1)(phi(M)) subset.eq phi^(-1)(frak(m))$ (since $phi(M)$ is a proper ideal). With $frak(m) subset.eq A$ being a proper ideal, $phi^(-1)(frak(m)) subset.eq A[[x]]$ is also proper, so $M subset.eq phi^(-1)(frak(m))$ together with $M$ being a maximal ideal in $A[[x]]$ implies $M = phi^(-1)(frak(m))$.

  Therefore, there exists unique maximal ideal in $A[[x]]$, namely $phi^(-1)(frak(m))$, showing $A[[x]]$ is a local ring.

  \ 

  $<==:$

  Then, suppose $A[[x]]$ is a local ring, let $M subset.neq A[[x]]$ denotes its unique maximal ideal. Then, for any maximal ideal $frak(m) subset.neq A$, since $phi^(-1)(frak(m))$ is a proper ideal in $A[[x]]$, one has $phi^(-1)(frak(m)) subset.eq M$. Using the correspondance in (2), one gets $frak(m) = phi(phi^(-1)(frak(m))) subset.eq phi(M)$. Yet, with $phi(M)$ being a proper ideal (since $M$ is proper), and with $frak(m) subset.neq A$ be a maximal ideal, then $frak(m) = phi(M)$.

  Thus, there exists unique maximal ideal in $A$, namely $phi(M)$, showing $A$ is a local ring.

  \ 

  The above two proofs conclude that $A$ is a local ring iff $A[[x]]$ is a local ring.
]

#pagebreak()

= D//2
#problem[
  Let $A$ be a commutative ring and $a!=0$ be an element of $A$. Prove or disprove that we can find a multiplicatively closed subset $S subset A$ such that the image of $a$ under the localization $A -> S^(-1)A$ lies in every maximal ideal of $S^(-1)A$.

  \ 

  #line(length: 100%)

  \ 
][
  /*If $a$ is a unit then this fails, else if $a$ is not a unit, take a maximal ideal $frak(m) in.rev a$, then the localization $A_frak(m)$ has $a$ be contained in all (and the only) maximal ideal, namely $frak(m) A_frak(m)$.*/
  Here, if $a!=0$ can be a unit, we claim that the statement is false; else if $a$ is not a unit, we claim that the statement is true.

  \ 

  #text(weight: "bold")[I. If $a!=0$ can be a unit:]

  If $a!=0$ is allowed to be a unit, take $S = {1} subset A$, it's multiplicatively closed, since $1 in S$ and $0 in.not S$, together with $1 dot 1=1$. However, notice that given the set $A times S$, if any $a,b in A$ has $(a,1) tilde (b,1)$ under the equivalance relation of localization, then $(a dot 1-b dot 1) dot 1 = (a-b) = 0$, so $a=b$. Hence, one has $a/1 = b/1$ in $S^(-1)A$ iff $a=b$. Which, the map $phi:A -> S^(-1)A$ by $phi(a)=a/1$ is an isomorphism (since it's surjective by definition, together with $phi(a)=0/1$ iff $a/1 = 0/1$ iff $a=0$, showing $ker(phi)=0$, or $phi$ is injective).

  Yet, since $phi(a) = a/1$ is a unit in $S^(-1)A$, it can't lie in any maximal ideal of $S^(-1)A$, providing a counterexample to the statement.

  \ 

  #text(weight: "bold")[II. If $a!=0$ is not a unit:]

  Since $a!=0$ is not a unit, the ideal $(a) subset.neq A$ is proper, hence there exists a maximal ideal $M subset.neq A$, where $(a) subset.eq M$.

  Now, since $M$ is also a prime ideal (because it's maximal), then take $S = A\\M$ a multiplicatively closed set, one has the localization $S^(-1)A = A_M$, while under the map $phi:A -> A_M$ by $phi(x)=x/1$ has the extension of $M$, say $M^e = M A_M$ being the unique maximal ideal of $A_M$. 

  Then, since $a in M$, one has $phi(a)=a/1 in M A_M$ (the unique maximal ideal of $S^(-1)A=A_M$). Hence, the image of $a$ under the localization lies in every maximal ideal of $S^(-1)A$ (since there's only one maximal ideal). 
]

#pagebreak()

= D//3
#problem[
  Let $A$ be a finite integral domain. Prove or disprove that $A$ is a quotient of $ZZ$.

  \ 

  #line(length: 100%)

  \ 
][
  /*Either redefine multiplication on $ZZ_2 times ZZ_2$, or prove that $ZZ[i]\/3ZZ[i]$ is a finite integral domain, then show it can't be a quotient of $ZZ$ by showing it's not cyclic as an abelian group.*/
  We'll prove that $A$ is not necessarily a quotient of $ZZ$, by constructing a counterexample.

  \ 

  /*Consider the ring $ZZ[i] = {a+b i in CC | a,b in ZZ}$, and its subset $3ZZ[i] = {a+b i in CC | a,b in 3ZZ}$, we aim to use these to construct a counterexample. Which, we claim that $3ZZ[i] subset ZZ[i]$ is an ideal:
  - Given any $a+b i, c+d i in 3ZZ[i]$, with $a,b,c,d in 3ZZ$, one has $a-c, b-d in 3ZZ$ (since $3ZZ$ is a subgroup of $ZZ$). Hence, $(a+b i)-(c+d i) = (a-c)+(b-d)i in 3ZZ[i]$, showing $3ZZ[i]$ passes subgroup test (under addition), which is an additive subgroup of $ZZ[i]$.
  - Given any $a+b i in ZZ[i]$ and $c+d i in 3ZZ[i]$, with $c,d in 3ZZ$, one has $a c, b c, a d, b d in 3ZZ$, hence $(a c-b d), (a d+b c) in 3ZZ$ (since $3ZZ$ is an ideal of $ZZ$). As a result, $(a+b i)(c+d i) = (a c-b d)+(a d+b c)i in 3ZZ[i]$, showing $3ZZ[i]$ is an ideal of $ZZ[i]$.

  \ 

  Now, consider its quotient $S= ZZ[i]\/3ZZ[i]$, our goal is claiming it's a finite integral domain that's not a quotient of $ZZ$.

  1. First, we claim that all element $overline(a+b i) in S$ can be written as $overline(r_1+r_2 i)$, where $r_1,r_2 in {0,1,2}$: Using Euclid's division algorithm, there exists $q_1, q_2 in ZZ$ and $r_1,r_2 in {0,1,2}$, such that $a=3 q_1+r_1$ and $b = 3 q_2+r_2$. So, one has $(a+b i) = (3q_1+r_1)+(3q_2+r_2)i = (3q_1+3q_2i)+(r_1+r_2 i)$, where $(3q_1+3q_2 i) in 3ZZ[i]$. This shows that $overline(a+b i)=overline(r_1+r_2 i)$, which proves the claim.

    As a result, since $S = {overline(r_1+r_2 i) | r_1,r_2 in {0,1,2}}$, then $S$ is finite.

    \ 

  2. Second, we claim that $S$ is an integral domain: Given any $overline(a+b i), overline(c+d i) in S$ that satisfy $overline(a+b i) dot overline(c+d i) = overline((a c+b d)+(a d-b c)i)=0$. Which, $(a c+b d), (a d-b c) in 3ZZ$, and using (1) we can assume that $a,b,c,d in {0,1,2}$.

    Since any $x,y in {0,1,2}$ satisfies $0 <= x y <= 4$, this restricts*/
  Consider the field $k=ZZ\/2ZZ$, the polynomial ring $k[x]$, and the polynomial $x^2+x+1 in k[x]$, we'll use these to construct a counterexample.

  Given that $0,1$ are the only elements inf $k= ZZ\/2ZZ$, if plugin $x^2+x+1$, one gets:
  $ 0^2+0+1 = 1!=0, quad 1^2+1+1 = 1+1+1 = 1 != 0 $
  This shows that $x^2+x+1$ has no solution in $k$; also, because it is of degree $2$, it can't be factored into any smaller degree nonconstant polynomial (since smaller degree nonconstant polynomials are degree $1$, which always has a solution in a field), so $x^2+x+1 in k[x]$ is an irreducible element. Because $k[x]$ is a PID (since $k$ is a field), then $(x^2+x+1) subset k[x]$ is a maximal ideal, the ring $A = k[x]\/(x^2+x+1)$ is a field (in particular an integral domain).

  \ 

  Now, we claim that $A$ is a finite integral domain, and is not a quotient of $ZZ$:

  \ 

  1. We first claim that $A = {overline(a)+overline(b x) | a,b in k}$ (which since $k=ZZ\/2ZZ$ is finite, this implies $A$ is finite).

    Given $x^2$, since one has $overline(x^2+x+1)=0$ under $S$, then $overline(x^2) = overline(-1-x) = overline(1)+overline(x)$ in $S$. Now, if consider any degree $n>=2$ monomial $x^n$, since $x^n = x^2 dot x^(n-2)$, then one has the following: 
    $ overline(x^n) = overline(x^2) dot overline(x^(n-2)) = (overline(1+x)) dot overline(x^(n-2)) = overline(x^(n-2))+overline(x^(n-1)) $
    Which, using induction, since $overline(x^n)$ can be written as linear combinations of smaller degree monomials, it can be written as linear combinations of $overline(a)$ and $overline(x)$.

    Hence, since all monimials can be written in the form $overline(a)+overline(b x)$ in $A$ (and all polynomials are finite linear combinations of monomials), one concludes that $A = {overline(a)+overline(b x) | a,b in k}$.

    \ 

  2. Based on (1), we know $A = {overline(0)," " overline(1)," " overline(x)," " overline(1)+overline(x)}$ as sets (so $A$ has cardinality $4$). In particular, $overline(1)!=0$, and $overline(1)+overline(1) = overline(0)$ (since under $k=ZZ\/2ZZ$, $1+1=0$), so $Char(A) = 2$. 
  
    However, among all the quotient of $ZZ$, since the only ideals of $ZZ$ are of the form $I = n ZZ$ (where $n in ZZ$; WLOG say $n>=0$, since if $n<0$, one has $n ZZ = -n ZZ$), then $Char(ZZ\/n ZZ) = n$, since $sum_(i=1)^n overline(1)=overline(n) = overline(0)$ in $ZZ\/n ZZ$, and for any $0<k<n$, by definition $sum_(i=1)^k overline(1) = overline(k)!=0$ (since $k in.not n ZZ$).

    So, suppose $I=n ZZ$ is an ideal of $ZZ$ satisfying $ZZ\/n ZZ = A$, then $2=Char(A) = Char(ZZ\/n ZZ) = n$, showing $I = 2 ZZ$. Yet, this implies $A = ZZ\/2 ZZ = {0," " 1}$, or $A$ has cardinality 2 instead of $4$, which is a contradiction. Therefore, $A$ cannot be a quotient of $ZZ$.

  \ 

  Here, the provided example $A = k[x]\/(x^2+x+1)$ (for $k=ZZ\/2ZZ$) is an example of a finite integral domain, which is not a quotient of $ZZ$, hence a counterexample of the statement.
     


]

#pagebreak()

= D//4
#problem[
  Let $A$ be a commutative ring. Prove or disprove that the canonical map $(A[X,Y])/((X Y))-> A[X] times A[Y]$, given by $f(X,Y) mapsto (f(X,0), f(0,Y))$, is an isomorphism of rings.

  \ 

  #line(length: 100%)

  \ 

][
  /*If this is true: Check first that the kernel is $(X Y)$ (which requires the statement $(X) sect (Y) = (X Y)$ to be true). Then, the question becomes: is it surjective? Is there a polynomial $f(X,Y)$, such that $f(X,0)=g(X)$ and $f(0,Y)=h(Y)$ for any desired $g(X)$, $h(Y)$?

  If $f(X,Y) = f_n (X)Y^n + ...+ f_1 (X)Y + f_0(X)$, then mapping to $A[X]$ provides $f_0 (X)$; then, mapping th $A[Y]$ provides $f_n (0)Y^n + ... + f_1 (0)Y + f_0(0)$, each represents their zeroth coefficient.

  Then, one needs their zeroth coefficient to agree, before one can say anything.

  \

  Conclusion: This is probably false.*/
  We'll prove that it's not an isomorphism of rings, specifically by proving it's not surjective.

  \ 

  First, given the map $overline(phi):A[X,Y]/((X Y))->A[X] times A[Y]$ by $overline(phi)(f(X,Y)) = (f(X,0),f(0,Y))$, with the projection $pi:A[X,Y]->>A[X,Y]/((X Y))$, one produces a map $phi:= overline(phi) compose pi: A[X,Y]->A[X] times A[Y]$ (given by $phi(f(X,Y)) = (f(X,0),f(0,Y))$ also, notation wise). Which, because $pi$ is surjective, one has $overline(phi)$ being surjective $<==>$ $phi$ is surjective. So, the goal is proving $phi$ is not surjective.

  Given any $f(X,Y) in A[X,Y]$, if view this ring as the form $(A[X])[Y]$, one can rewrite $f(X,Y)$ as the following:
  $ f(X,Y) = f_(n)(X)Y^n + ... +f_(1)(X)Y+ f_(0)(X), quad quad forall i in {0,1,...,n}," " f_i (X) in A[X] $
  Which, plugin to $phi$, one yields the following:
  $ phi(f(X,Y)) = (f_0(X)," " f_n (0)Y^n+...+f_1(0)Y+f_0(0)) $
  Now, we claim that the element $(0,1) in A[X] times A[Y]$ is not in the image of $phi$: Suppose the contrary that $(0,1) in im(phi)$, there exists $f(X,Y) in A[X,Y]$ such that $phi(f(X,Y))=(0,1)$. Using the above form, one yields the following:
  $ (0,1)=phi(f(X,Y))=(f_0(X)," " f_n (0)Y^n+...+f_1(0)Y+f_0(0)) $
  In particular, $f_0(X) = 0$ in $A[X]$, while $f_n (0)Y^n+...+f_1(0)Y + f_0(0) = 1$ in $A[Y]$. Take the second equality, the constant term of $f_n (0)Y^n+...+f_1(0)Y+f_0(0)$ is $f_0(0)$, showing $f_0(0)=1$; yet, this contradicts the other equality $f_0(X)=0$ (which states $f_0(0)=0$).

  So, the element $(0,1) in.not im(phi)$, showing $phi$ is not surjective. This proves that $A[X,Y]/((X Y))->A[X] times A[Y]$ by $f(X,Y) mapsto (f(X,0),f(0,Y))$ cannot be an isomorphism.
]

#pagebreak()

= ND//5
#problem[
  Let $A$ be a commutative ring and $B=A[X_1,...,X_n]\/I$ for some maximal ideal $I subset A[X_1,...,X_n]$. Prove or disprove that under the canonical composite ring homomorphism $A -> A[X_1,...,X_n]->> B$, $B$ is a finitely generated $A$-module (i.e., generated by finitely many elements as an $A$-module).

  \ 

  #line(length: 100%)

  \ 
][
  No idea yet...if it's a field it's definitely true in my opinion.
]