#print function that doesnt output long strings for item, category or store name
printdf <- function(df) {
    tryCatch(
        expr = {df = select(df,-c(item_category_name,item_name,shop_name))},
        error = function(e) {e},
        finally = print(df)
    )
        
}