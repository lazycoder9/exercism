package lasagna

func PreparationTime(layers []string, time int) int {
  if time == 0 {
    time = 2
  }
  return len(layers) * time
}

func Quantities(layers []string) (noodles int, sauce float64) {
  noodles = 0
  sauce = 0.0

  for i := 0; i < len(layers); i++ {
    if layers[i] == "noodles" {
      noodles += 50
    }
    if layers[i] == "sauce" {
      sauce += 0.2
    }
  }

  return
}

func AddSecretIngredient(friendList []string, myList []string) []string {
  myList[len(myList) - 1] = friendList[len(friendList) - 1]

  return myList
}

func ScaleRecipe(quantities []float64, portions int) []float64 {
  var scaled []float64
  scale := float64(portions) / 2

  for _, e := range quantities {
    scaled = append(scaled, e * float64(scale))
	}

  return scaled
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
// 
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more 
// functionality.
