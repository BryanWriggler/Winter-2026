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

= ND//1
#problem[
  Let $A=CC[X,Y]\/(f(X,Y))$ and consider the scheme $X=Spec(A)$. Prove or disprove that there is a finite set $S subset X$ such that every connected component of $X\\S$ is ireducible as a topological space.

  \ 


][
  Guess: True, consider removing the intersection of each irreducible factor of $f(X,Y)$. If $g, h$ are two irreducible polynomials in $CC[x,y]$ that're distinct, try and argue that their set of solutions must be distinct.
]

#pagebreak()

= D//2
#problem[
  Let $f:X->Y$ be a morphism of integral schemes which is a topological homeomorphism. Prove or disprove that $f$ is an isomorphism of schemes.

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
  
  This is a contradiction, because consider $i in CC$, its multiplicative order is $4$ (since $i^4 = 1$, and any positive integer $n<4$ has $i^n!=1$); however, there's no element in $RR$ with multiplicative order of $4$ (since if $x in RR$ satisfies $x^4 = 1$, then $x^4-1 = (x-1)(x+1)(x^2+1)=0$; with $x^2+1=0$ having no solution in $RR$, then $x=pm 1$, which it either has multiplicative order of $1$ or $2$, not $4$).

  So, since we derive a contradiction, $iota^*:Spec(CC)-> Spec(RR)$ can't be an isomorphism of schemes, despite it's a topological homeomorphism.
]

#pagebreak()

= ND//3
#problem[
  Let $k$ be a countable field and let $f:X -> Spec(k)$ be a finite type morphism of schemes. Prove or disprove hat $X$ has at most countably many points.
][
  Claim 1: $X$ is Noetherian (because $Spec(k)$ is affine + quasi-compact (a single point), while the morphism is finite type). So, one only needs to find finitely many affine cover for $X$ (because $X$ Noetherian $==>$ Quasi-compact).

  Claim 2: Each affine cover can be chosen, so that $U_i-> Spec(k)$ is induced by a finite type ring homomorphism $k -> cal(O)(U)$, showing $cal(O)(U)$ is a quotient of polynomial rings with finitely many variables. So, want to claim it's countable, one needs to claim that $k[x_1,...,x_n]$ has countable prime ideals.
]

#pagebreak()

= ND//4
#problem[
  Let $X$ be a scheme which is covered by two affine open subschemes. Prove or disprove that $X$ is affine.
][
  Counterexample: $CC PP^1$ can be covered by two affine spaces. Given $AA^1_CC = Spec(CC[x])$, the gluing map between two copies of $AA^1_CC\\{0}$ is $(x-z) mapsto (x-1/z)$ (corresponding to the gluing map $z mapsto 1/z$ when creating two projective spaces).
]

#pagebreak()

= ND//5
#problem[
  Let $A=RR[X_1,X_2,X_3]\/(X_2-X_1^2, X_3-X_1^3)$ and $X=Spec(A)$. Let $f(X_1,X_2,X_3) = a_1X_1+a_2X_2+a_3X_3+a_4$, where $a_i in RR$ and $Y=Spec(RR[X_1,X_2,X_3]\/(f))$. Is the set $X sect Y$ finite? If yes, what is a finite upper bound on its cardinality? Explain your answer with complete argument.
][
  It's equivalent to say that the set $(t,t^2,t^3) subset.eq RR^3$ has only finite intersection with a plane. Which is always true, since the plane $a_1x^1+a_2x_2+a_3x_3+a_4=0$ plugging in the set has $a_1t+a_2t^2+a_3t^3+a_4 = 0$, which is a degree 3 $RR$-polynomial, so the bound of the intersection must be $3$.
]