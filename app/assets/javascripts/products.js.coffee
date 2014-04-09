$("#product_search").typeahead({
  name: "product",
  remote: "/products/autocomplete?search=%QUERY"
});