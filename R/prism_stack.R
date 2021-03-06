#' Stack Prism files
#' @description Create a stack of prism files
#' @param prismfile a vector of file names returned by ls_prism_data()
#' @examples \dontrun{
#' get_prism_dailys(type="tmean", minDate = "2013-06-01", maxDate = "2013-06-14", keepZip=FALSE)
#' mystack <- prism_stack(ls_prism_data()[1:14])
#' }
#' @export
prism_stack <- function(prismfile){
  prismfile_fp <- sapply(prismfile,function(x){paste(options("prism.path")[[1]],"/",x,"/",x,".bil",sep="")})
  masterRaster <- stack(raster(prismfile_fp[1]))
  if(length(prismfile_fp) > 1){
    for(i in 2:length(prismfile_fp)){
      masterRaster<-  addLayer(masterRaster,raster(prismfile_fp[i]))  
    }
  }
  return(masterRaster)
}
