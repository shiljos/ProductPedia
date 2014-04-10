$(function() {
  var products = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: "/products/autocomplete?search=%QUERY"
  });
   
  products.initialize();
   
  $('#product_search').typeahead(
    {
      hint: true,
      highlight: true,
      minLength: 1    
    }, 
    {
      name: 'products',
      displayKey: 'value',
      source: products.ttAdapter()
    }
  );
   
});