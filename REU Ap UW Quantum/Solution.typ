#import "../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *
#import "@preview/physica:0.9.8": *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: ergo-colors.penumbra-light,  
    styles: ergo-styles.basic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "UW Quantum REU Solution",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(i)")

#problem("Distinguishing between two states")[
  Let $n in NN$, Suppose you are handed #emph[one] of two $n$-qubit states $ket(psi_0), ket(psi_1)$ uniformly at random. Assume that you know exactly what the two states are: you just don't know #emph[which one] of the two you are given. Assume also that the two states are not identical (differing only by a global phase still counts as being identical here). In this question you will find the projective measurement ${P, I-P}$ that maximizes the distinguishing success probability, i.e. it maximizes
  $ 1/2"Pr"[0 | psi_0] + 1/2"Pr"[1,psi_1] $
  where $"Pr"[i | psi_i]$ denotes the probability that the measurement outcome is $i$, given that the state was $ket(psi_i)$.

  \

  + #emph[Carefully] show that, without loss of generality, you can restrict your search to the 2-dimensional space spanned by $ket(psi_0)$ and $ket(psi_1)$, i.e. you can restrict yourself to consider measurements of the form 
    $ {ket(u)bra(u), II - ket(u)bra(u)} $
    where $ket(u)$ lies in the span of $ket(psi_0)$ and $ket(psi_1)$
    
    (You should try to make this proof as rigorous as possible -- this queston is more subtle than meets the eye!).

    \ 

  + Find the optimal measurement, and show that it is optimal.

  \ 

  #line(length: 100%)

  \ 

][
  Given that $ket(psi_0), ket(psi_1)$ are in an $n$-qubit state (in particular they're normalized states), let $cal(H) := CC^2 = {mat(a;b) #eval(150%) a,b in CC}$ be the $2$-dimensional Hilbert Space for each qubit, then the $n$-qubit state is described by the space $cal(H)^(times.circle n)$ (the tensor product of $n$ copies of $cal(H)$), which is finite-dimensional of dimension $d = 2^n$. 

  In particular, $cal(H)^(times.circle n)$ is an inner product space with the inner product induced by each component $cal(H)$, hence one can specifically choose an orthonormal basis involving $ket(psi_0), ket(psi_1)$, say ${ket(psi_0), ket(psi_1),...,ket(psi_(d-1))} subset cal(H)^(times.circle n)$
]