package main

import "fmt"

type folder struct {
	components []component
	name string
}

func (f *folder) search(keyword string) {
	fmt.Printf("Searching for keyword %s in file %s\n", keyword, f.name)
}

func (f *folder) addComponent(c component) {
	f.components = append(f.components, c)
}
