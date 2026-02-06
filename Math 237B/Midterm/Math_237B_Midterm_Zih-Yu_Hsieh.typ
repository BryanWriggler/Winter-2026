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
    styles: ergo-styles.sidebar2, 
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
][
  Guess: True, consider removing the intersection of each irreducible fator of $f(X,Y)$.
]

\ 

= ND//2
#problem[
  Let $f:X->Y$ be a morphism of integral schemes which is a topological homeomorphism. Prove or disprove that $f$ is an isomorphism of schemes.
][]

\ 

= ND//3
#problem[
  Let $k$ be a countable field and let $f:X -> Spec(k)$ be a finite type morphism of schemes. Prove or disprove hat $X$ has at most countably many points.
][]

\ 

= ND//4
#problem[
  Let $X$ be a scheme which is covered by two affine open subschemes. Prove or disprove that $X$ is affine.
][]

\ 

= ND//5
#problem[
  Let $A=RR[X_1,X_2,X_3]\/(X_2-X_1^2, X_3-X_1^3)$ and $X=Spec(A)$. Let $f(X_1,X_2,X_3) = a_1X_1+a_2X_2+a_3X_3+a_4$, where $a_i in RR$ and $Y=Spec(RR[X_1,X_2,X_3]\/(f))$. Is the set $X sect Y$ finite? If yes, what is a finite upper bound on its cardinality? Explain your answer with complete argument.
][]