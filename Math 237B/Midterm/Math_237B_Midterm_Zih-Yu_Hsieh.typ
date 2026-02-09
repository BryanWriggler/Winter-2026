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
  title: "Math 237B Midterm",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(1)")

= ND//1
#problem[
  Let $A=CC[X,Y]\/(f(X,Y))$ and consider the scheme $X=Spec(A)$. Prove or disprove that there is a finite set $S subset X$ such that every connected component of $X\\S$ is ireducible as a topological space.

  \ 

  #line(length: 100%)

  \ 
][
  Guess: True, consider removing the intersection of each irreducible factor of $f(X,Y)$. If $g, h$ are two irreducible polynomials in $CC[x,y]$ that're distinct, try and argue that their set of solutions must be distinct (transferring to $CC^2$ with Zariski Topology may be hard, but can use this as an intuition check)
]

#pagebreak()

= D//2
#problem[
  Let $f:X->Y$ be a morphism of integral schemes which is a topological homeomorphism. Prove or disprove that $f$ is an isomorphism of schemes.

  \ 

  #line(length: 100%)

  \ 

][
  /*
  Possibly needed information: integral schemes $<==>$ it's reduced and irreducible. We know it's a homeomorphism on each affine cover. If we can prove that it transfer fundamental open subsets of each affine cover to another one (that're isomorphic), then I think we're done.

  \ 

  In the notes there's a move, choosing a local integral domain $A$ not a field, take its fraction field $F(A)$, then take the 1-pt space with these two as constant sheaves. Which, identity on $X$ induces the inclusion $A arrow.hook F(A)$, but it's not a local homomorphism (so it's not a morphism between locally ringed space).

  \ 

  Based on this, if one has two local integral domains, a local homomorphism that's not an isomorphism maybe is a counterexample.

  \

  #text(weight: "bold")[Answer:] Consider the case between spec of two fields.
  */
  We'll disprove the statement by constructing a counterexample.

  \ 

  Consider the field inclusion $iota: RR arrow.hook CC$, which generates the pullback map $iota^*:Spec(CC) -> Spec(RR)$. 
  
  First, notice that because $RR,CC$ are both fields, the $Spec(CC), Spec(RR)$ are both singleton set, hence as continuous maps between topological spaces, $iota^*$ is a topological homeomorphism. 
  
  Second, since they're singletons, then the only nonempty open subsets are $Spec(CC)$ and $Spec(RR)$ themselves, so one deduces $cal(O)(Spec(CC)) = CC$ and $cal(O)(Spec(RR)) = RR$, which both are integral domains. Hence, these two spaces have all the nonempty open neighborhoods corresponding to an integral domain using their structure sheaves, showing $Spec(CC)$ and $Spec(RR)$ are integral schemes.

  \ 

  Yet, it's not an isomorphism as schemes: Suppose the contrary that it's an isomorphism of schemes, there exists another morphism of integral schemes $j:Spec(RR) -> Spec(CC)$, such that it's not only an inverse of $iota^*$, but its induced ring homomorphism $j^*:cal(O)(Spec(CC))-> cal(O)(Spec(RR))$ is the inverse of the ring homomorphism $(iota^*)^*:cal(O)(Spec(RR))-> cal(O)(Spec(CC))$. However, the induced ring homomorphism of $iota^*$, or $(iota^*)^*$, is precisely the inclusion $iota:RR arrow.hook CC$; since $j^*:CC -> RR$ is its inverse, they imply that $RR$ and $CC$ are isomorphic fields. 
  
  This is a contradiction, because consider $i in CC$, its multiplicative order is $4$ (since $i^4 = 1$, and any positive integer $n<4$ has $i^n!=1$); however, there's no element in $RR$ with multiplicative order of $4$ (since if $x in RR$ satisfies $x^4 = 1$, then $x^4-1 = (x-1)(x+1)(x^2+1)=0$; with $x^2+1=0$ having no solution in $RR$, then $x=pm 1$, which it either has multiplicative order of $1$ or $2$, not $4$). hence, $RR, CC$ can't be isomorphic fields, leading to a contradiction.

  So, since we derive a contradiction, $iota^*:Spec(CC)-> Spec(RR)$ can't be an isomorphism of schemes, despite it's a topological homeomorphism.
]

#pagebreak()

= D//3
#problem[
  Let $k$ be a countable field and let $f:X -> Spec(k)$ be a finite type morphism of schemes. Prove or disprove hat $X$ has at most countably many points.

  \ 

  #line(length: 100%)

  \ 
][
  /*Claim 1: $X$ is Noetherian (because $Spec(k)$ is affine + quasi-compact (a single point), while the morphism is finite type). So, one only needs to find finitely many affine cover for $X$ (because $X$ Noetherian $==>$ Quasi-compact).

  Claim 2: Each affine cover can be chosen, so that $U_i-> Spec(k)$ is induced by a finite type ring homomorphism $k -> cal(O)(U)$, showing $cal(O)(U)$ is a quotient of polynomial rings with finitely many variables. So, want to claim it's countable, one needs to claim that $k[x_1,...,x_n]$ has countable prime ideals.

  However, this is true as one can use the unique factorizatoin property to claim that a prime ideal is created by finitely many irreducibles, so if there are countable irreducibles, there are countable prime ideals.

  \ 
  */
  We'll prove that $X$ has at most countably many points.

  \ 

  First, since $Spec(k)$ is an affine scheme, and $k$ is a field (which is Noetherian), it's a locally Noetherian Scheme. Moreover, $Spec(k)$ is a singleton, hence quasi-compact, so $Spec(k)$ is a Noetherian scheme. Which, with $f:X -> Spec(k)$ being a finite type morphism and $Spec(k)$ being a Noetherian scheme, $X$ must be Noetherian also (based on a theorem proven in class).

  \ 

  Then, using the definition of finite type morphism, there exists an affine cover ${U_i}$ of $Spec(k)$, each $U_i$ corresponds to finite affine open subset ${U_(i j)}$ in $X$, such that $f^(-1)(U_i) = union.big_(j)U_(i j)$, and the induced ring homomorphism $cal(O)(U_i) -> cal(O)(U_(i j))$ is a finite type ring homomorphism. 
  
  Notice that since $Spec(k)$ is compact, the list ${U_i}$ can be chosen to be finite (moreover, with $Spec(k)$ being singleton, it can be chosen to be a single set $U$). Which, since $U$ covers $Spec(k)$, one has $U = Spec(k)$, deducing that $cal(O)(U) = cal(O)(Spec(k))=k$. So, given that $f^(-1)(U)=f^(-1)(Spec(k)) = X$, one has $X = union.big_(j)U_j$ for finitely many affine open subsets $U_j$, and each induced ring homomorphism $cal(O)(U) -> cal(O)(U_j)$ is of finite type. 

  With $cal(O)(U) = k$, then the given ring homomorphism is of finite type implies there exists a surjective $k$-algebra homomorphism $k[x_1,...,x_n]->> cal(O)(U_j)$, where $n$ is a finite number (in other words, each $cal(O)(U_j)$ is a quotient of finite-variable polynomial rings over $k$).

  \ 

  Now, we claim that each $U_j$ is in fact countable: Based on the above fact, with $cal(O)(U_j)$ being a quotient of $k[x_1,...,x_n]$ for some finite $n$, then $U_j = Spec(cal(O)(U_j))$ can be interpreted as a subset of $Spec(k[x_1,...,x_n])$ (since given a commutative ring $A$ with an ideal $I subset A$, ${"ideal" J subset.eq A\/I}$ and ${"ideal" K subset A | I subset.eq K}$ are of bijective correspondance, while preserving prime ideals). Hence, to prove $U_j$ is countable, it suffices to prove that $Spec(k[x_1,...,x_n])$ is countable (given that $k$ is a countable field). We'll prove it as follow:

  1. $k[x_1,...,x_n]$ is countable, given that $k$ is countable: 
  
    Here we'll approach by induction on the number of variables $n$. For $n=1$, recall that every polynomial $f(x) in k[x]$ is of bounded degree, hence there exists $i in NN$, such that $f(x) in plus.circle.big_(n=0)^i k x^n$, which is isomorphic to $plus.circle.big_(n=0)^i k$. Because finite product of countable sets is countable, and finite product coincides with direct coincides for abelian groups, one has $plus.circle.big_(n=0)^i k x^n$ being countable. As a result, $k[x] = union.big_(i=0)^infinity (plus.circle.big_(n=0)^i k x^i)$ is a countable union of countable sets, hence countable.

    Now, suppose for given $n in NN$, all $j<n$ satisfies $k[x_1,...,x_j]$ being countable, then for $k[x_1,...,x_n]$, interpret as the polynomial ring $(k[x_1,...,x_(n-1)])[x_n]$. Because $k[x_1,...,x_(n-1)]$ is countable by induction hypothesis, apply the proof for the case $n=1$, we obtained that $k[x_1,...,x_n]$ (as a single-variable polynomial ring over $k[x_1,...,x_(n-1)]$) is also countable. This finishes the induction.

    \ 

  2. There are at most countable ideals for $k[x_1,...,x_n]$: Based on Hilbert's Basis Theorem, since $k$ is a field (in particular a Noetherian Ring), $k[x_1,...,x_n]$ is a Noetherian Ring. Hence, all ideals of $k[x_1,...,x_n]$ are finitely generated. 

    Now, for each ideal $I$, fix a specific finite set of generators (say $I=(f_1,...,f_i)$), then let $S = {"all finite subset of "k[x_1,...,x_n]}$, there is a clear inclusion from $Sigma = {"ideals "I subset.eq k[x_1,...,x_n]}$ to $S$, by $I mapsto {f_1,...,f_i}$ (the fixed finite set of generators).

    Finally, because $k[x_1,...,x_n]$ is countable, let $(f_i)_(i=0)^infinity$ be an ordering of $k[x_1,...,x_n]$ using natural numbers. Then, for any finite subset $T subset k[x_1,...,x_n]$, it contains some largest index, say $i_T in NN$, in particular $T in cal(P)({f_0,...,f_(i_T)})$ (the power set of ${f_0,...,f_(i_T)}$). So as a set, one has $S subset.eq union.big_(i=0)^infinity cal(P)({f_0,...,f_i})$. Because the index is countable, and each $cal(P)({f_0,...,f_i})$ is finite, then the union $union.big_(i=0)^infinity cal(P)({f_0,...,f_i})$ is countable, which its subset $S$ is also countable.

    As a result, because the set of ideals $Sigma$ can be identified as a subset of $S$, $Sigma$ is also countable, showing $k[x_1,...,x_n]$ has countable ideals. In particular, $Spec(k[x_1,....,x_n])$ is also countable (since it collects all prime ideals of $k[x_1,...,x_n]$).

  \ 

  Finally, since each $Spec(k[x_1,...,x_n])$ is countable, because $cal(O)(U_j)$ is a quotient of $k[x_1,...,x_n]$ (for some positive integer $n$), then $Spec(cal(O)(U_j)) = U_j$ is also countable. Then, because $X = union.big_(j)U_j$, with the index being finite, $X$ itself must be countable as set, hence has at most countably many points.
]

#pagebreak()

= ND//4
#problem[
  Let $X$ be a scheme which is covered by two affine open subschemes. Prove or disprove that $X$ is affine.

  \ 

  #line(length: 100%)

  \
][
  Counterexample: $CC PP^1$ can be covered by two affine spaces. Given $AA^1_CC = Spec(CC[x])$, the gluing map between two copies of $AA^1_CC\\{0}$ is $(x-z) mapsto (x-1/z)$ (corresponding to the gluing map $z mapsto 1/z$ when creating two projective spaces).

  \ 

  Here, we'll prove that $X$ is not necessarily affine, by constructing a counterexample.

  \ 

  Consider the two schemes $Y=Z=AA^1_CC= Spec(CC[t])$, and consider $U= AA^1_CC\\{(t)}$ (where $(t)$ corresponds to the maximal ideal for origin $0 in CC$). Then, take the identity map $f=id_U:U arrow.tilde U$, the inclusion $iota_U:U arrow.hook Y=Z$, and consider $X = Y union.sq_f Z$ as the gluing of schemes:
  #set align(center)
  #diagram($
             U edge("hook->", script(iota_U)) edge("d","hook->", script(iota_U)) & Y edge("d",->, script(iota_Y))\ 
             Z edge(->, script(iota_Z)) & X=Y union.sq_f Z
           $)
  #set align(left)
  Which, $X$ is clearly covered by $Y$ and $Z$ (or the image of them under the canonical inclusion maps), which both open subsets are affine. Yet, we claim that $X$ itself is not affine:
  
]

#pagebreak()

= D//5
#problem[
  Let $A=RR[X_1,X_2,X_3]\/(X_2-X_1^2, X_3-X_1^3)$ and $X=Spec(A)$. Let $f(X_1,X_2,X_3) = a_1X_1+a_2X_2+a_3X_3+a_4$, where $a_i in RR$ and $Y=Spec(RR[X_1,X_2,X_3]\/(f))$. Is the set $X sect Y$ finite? If yes, what is a finite upper bound on its cardinality? Explain your answer with complete argument.

  \ 

  #line(length: 100%)

  \
][
  /*It's equivalent to say that the set $(t,t^2,t^3) subset.eq RR^3$ has only finite intersection with a plane. Which is always true, since the plane $a_1x^1+a_2x_2+a_3x_3+a_4=0$ plugging in the set has $a_1t+a_2t^2+a_3t^3+a_4 = 0$, which is a degree 3 $RR$-polynomial, so the bound of the intersection must be $3$. (Here it's a bit more complicated, because $RR$ is not algebraically closed...)

  \ 

  Some tools: For an integral domain $B$ that's a finitely-generate $k$-algebra ($k$ a field, not necessarily algebraically close), then the Krull dimension of $B$ equals the transcedental degree of $F(B)$, its fraction field as a $k$-algebra over $k$.

  \ 

  Step 1: Argue that the first ring has krull dimension $1$, the second ring has krull dimension 2 (by proving they're isomorphic to $RR[t]$ and $RR[s,u]$). In other words, the first prime ideal has height 2, the second has height 1.

  Step 2: Argue they're not including each other. So, if a prime ideal contains both (i.e. in $X sect Y$ when viewed them as subspaces in $Spec(RR[x_1,x_2,x_3])$), it must properly contain the two. With the second one already at height $2$, this proper containment makes the larger prime ideal height $3$ (matching the krull dimension of $RR[x_1,x_2,x_3]$), hence it's maximal.

  Step 3: Construct a quotient and show that the quotient is isomorphic to either $RR$ or $CC$ (i.e. it always embedds into $CC$) by some fixed evaluation. Then, argue that this evaluation must have $x_2-x_1^2$, $x_3-x_1^3$,and $a_1 x_1+a_2x_2+a_3x_3+a_4$ all being $0$ (by fixing $x_1$). Then, show there's only $3$ such possibility.

  \ 

  #line(length: 100%)

  \ 
  */
  We'll prove that $X sect Y$ is not necessarily finite, by showing it's infinite for $f=0$. 
  //(For safety, we'll also prove that $f!=0$ implies $X sect Y$ is finite, and has a bound on its cardinality being $3$).
  
  Here we denote $I = (X_2-X_1^2, X_3-X_1^3)$, and utilized the fact that $X = Spec(RR[X_1,X_2,X_3]\/I) tilde.equiv V(I)$, and $Y=Spec(RR[X_1,X_2,X_3]\/(f)) tilde.equiv V((f))$ in $Spec(RR[X_1,X_2,X_3])$. Which, the intersection $X sect Y$ is precisely all the prime ideals $P subset RR[X_1,X_2,X_3]$ that contains both $I$ and $(f)$.

  Here's an order of the proof: 
  1. Show that $RR[X_1,X_2,X_3]\/I tilde.equiv RR[t]$. //which is a PID (where all prime ideals are maximal)
  2. Show that $X sect Y$ has a one-to-one correspondance to a specific subset of $Spec(RR[t])$.
  3. Deduce $X sect Y$ is infinite for the case $f=0$.
  //4. (Extra:) Show that for $f!=0$, $X sect Y$ is finite, and has 3 as upper bound of its cardinality.

  \ 

  #text(weight: "bold")[Proof of (1):]

  Consider the evaluation map $phi:RR[X_1,X_2,X_3]->> RR[t]$ by $phi(f(X_1,X_2,X_3)) = f(t, t^2, t^3)$. If consider $X_2-X_1^2, X_3-X_1^3$ (the generators of $I$), one has the following:
    $ phi(X_2-X_1^2) = t^2-(t)^2 = 0, quad phi(X_3-X_1^3)= t^3-(t)^3 = 0 $
    This shows that $X_2-X_1^2, X_3-X_1^3 in ker(phi)$, so $I subset.eq ker(phi)$. 

    Now, we argue that $I = ker(phi)$: Given any monomial $X_1^(n_1)X_2^(n_2)X_3^(n_3)$, then one has the following equality:
    $ X_1^(n_1)X_2^(n_2)X_3^(n_3) &= (X_1^(n_1)X_2^(n_2)X_3^(n_3) - X_1^(n_1+2 n_2)X_3^(n_3))+X_1^(n_1+2 n_2)X_3^(n_3)\ 
    &= X_1^(n_1)X_3^(n_3)(X_2^(n_2)-X_1^(2 n_2))+(X_1^(n_1+2n_2)X_3^(n_3) - X_1^(n_1+2n_2+3n_3))+X_1^(n_1+2n_2+3n_3)\ 
    &= X_1^(n_1)X_3^(n_3)(sum_(i=0)^(n_2-1)X_2^i (X_1^2)^(n_2-i-1))(X_2-X_1^2) + X_1^(n_1+2n_2)(X_3^(n_3)-X_1^(3n_3))+X_1^(n_1+2n_2+3n_3)\ 
    &= X_1^(n_1)X_3^(n_3)(sum_(i=0)^(n_2-1)X_2^i (X_1^2)^(n_2-i-1))(X_2-X_1^2) + X_1^(n_1+2n_2)(sum_(j=0)^(n_3-1)X_3^j(X_1^3)^(n_3-j-1))(X_3-X_1^3)+X_1^(n_1+2n_2+3n_3)  $
    Hence, all monomials can be written as $X_1^(n_1)X_2^(n_2)X_3^(n_3) = f dot (X_2-X_1^2)+g dot (X_3-X_1^3) + X_1^k$ for some $f,g in RR[X_1,X_2,X_3]$, and $k in NN$. As a result, all polynomials $h(X_1,X_2,X_3) = f dot (X_2-X_1^2)+g dot (X_3-X_1^3) + h_1(X_1)$ for some $f,g in RR[X_1,X_2,X_3]$, and $h_1(t) in RR[t]$.

    So, one has $h in ker(phi)$ iff $phi(h) = h_1(t)=0$ (since $X_2-X_1^2, X_3-X_1^3$ are evaluated to $0$), which happens iff $h(X_1,X_2,X_3) = f dot (X_2-X_1^2)+g dot (X_3-X_1^3) in I$. This concludes that $I = ker(phi)$. As a result, $RR[X_1,X_2,X_3]\/I tilde.equiv RR[t]$.

    \ 

    #text(weight: "bold")[Proof of (2):]

    Since $(X sect Y) subset X = Spec(RR[X_1,X_2,X_3]\/I) tilde.equiv Spec(RR[t])$, it's naturally identified as a subset of prime ideals of $RR[t]$ (the identification $(X sect Y)-> Spec(RR[t])$ is by $P mapsto phi(P)$, where $P$ is the evaluation map defined in (1)). 

    Notice that all prime ideals $P in (X sect Y)$ also contains $f=a_1X_1+a-2X_2+a_3X_3+a_4$, hence it satisfies $phi(f) = a_1t+a_2t^2+a_3t^3+a_4 in phi(P)$, so $X sec subset.eq V((a_1t+a_2t^2+a_3t^3+a_4)) subset Spec(RR[t])$.
    
    Conversly, given prime ideal $overline(P) in V((a_1t+a_2t^2+a_3t^3+a_4))$, then under the preimage of ealuation map, one has $f=a_1X_1+a_2X_2+a_3X_3+a_4 in phi^(-1)(a_1t+a_2t^2+a_3t^3+a_4) subset phi^(-1)(overline(P))$, showing that $phi^(-1)(overline(P))$ is a prime ideal containing both $I$ and $(f)$, which is in $X sect Y$. Therefore, set wise one can conclude that $X sect Y = V((a_1t+a_2t^2+a_3t^3+a_4))$.

  \ 

  #text(weight: "bold")[Proof of (3):]

  Part (2) provides that $X sect Y = V((a_1t+a_2t^2+a_3t^3+a_4))$ as set bijection. However, if take $f=a_1X_1+a_2X_2+a_3X_3+a_4=0$, this ideal becomes $(0)$, hence $X sect Y = V((0))$, which is exactly $Spec(RR[t])$. However, $Spec(RR[t])$ is infinite (since $t-a in RR[t]$ is irreducible for all $a in RR$, so $(t-a)$ is a distinct prime ideal in $Spec(RR[t])$). Hence, $f=0$ is a case where $X sect Y$ is infinite, showing $X sect Y$ is not necessarily finite. This completes the proof.

  \ 

  //#text(weight: "bold")[(Extra) Proof of (4):]

  
]