
#' 处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' accountDetailSelectServer()
accountDetailSelectServer <- function(input,output,session,dms_token,erp_token) {
  #获取参数
  date_startDate=tsui::var_date('date_startDate')
  date_endDate=tsui::var_date('date_endDate')




  #查询按钮

  shiny::observeEvent(input$btn_accountDetail_query,{

    FStatrDate = date_startDate()
    FEndDate = date_endDate()
    data = mdljhaccountDetailPkg::accountDetail_select(erp_token =erp_token ,FStatrDate = FStatrDate,FEndDate = FEndDate)
    tsui::run_dataTable2(id ='dt_accountDetail_resultView' ,data =data )

    tsui::run_download_xlsx(id = 'dl_accountDetail',data = data,filename = '银行流水.xlsx')



  })



}


#' 处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' accountDetailServer()
accountDetailServer <- function(input,output,session,dms_token,erp_token) {
  accountDetailSelectServer(input = input,output = output,session = session,dms_token = dms_token,erp_token=erp_token)


}
