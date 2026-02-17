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
  title: "Math 231B HW 3",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(i)")

= ND//1
#problem[
  Etingof Lecture Note Exercise 31.15:

  + Show that for even $dim V$, the representations $(xi^* M)_0, (xi^* M)_1$ are isomorphic to $S_+,S_-$ respectively.
  + Show that for odd $dim V$, the representations $xi^* M_+$ and $xi^* M_-$ are both isomorphic to $S$.

  #text(weight: "bold")[Hint:] Find the highest weight vector for each of these representations and compute the weight of this vector. Then compare dimensions.
][
  
]

#pagebreak()

= ND//2
#problem[
  Etingof Lecture Notes Exercise 35.8 (i), (ii):

  Let $G=GL_n (CC)$. A #text(weight: "bold")[regular algebraic function] on $G$ is a polynomial of $X_(i j)$ and $det(X)^(-1)$ for $X in G$. Denote by $cal(O)(G)$ the algebra of regular algebraic functions on $G$.
  + Show that $G times G$ acts on $cal(O)(G)$ by left and right multiplication.
  + (Algebraic Peter-Weyl theorem) Show that as a $G times G$-module, we have 
    $ cal(O)(G) = plus.circle.big_(V in "Irrep"(G))V tensor V^* $

  #text(weight: "bold")[Hint:] Compute $Hom_G (V, cal(O)(G))$ where $G$ acts on $cal(O)(G)$ by right translations. For this, interpret elements of this space as equivariant functions $G -> V^*$ and show that such functions are automatically regular algebraic.
][]