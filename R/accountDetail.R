
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





  #查询按钮

  shiny::observeEvent(input$btn_accountDetail_query,{
    accountDetail_date_startDate=tsui::var_date('accountDetail_date_startDate')
    accountDetail_date_endDate=tsui::var_date('accountDetail_date_endDate')

    FStatrDate = accountDetail_date_startDate()
    FEndDate = accountDetail_date_endDate()


    data = mdljhaccountDetailPkg::accountDetail_select(erp_token =erp_token ,FStatrDate = FStatrDate,FEndDate = FEndDate)
    tsui::run_dataTable2(id ='dt_accountDetail_resultView' ,data =data )

    tsui::run_download_xlsx(id = 'dl_accountDetail',data = data,filename = '银行流水.xlsx')



  })

  shiny::observeEvent(input$btn_accountDetail_bankAcntState_view,{
    text_accountDetail_bankAcntState_StartDate = tsui::var_date("text_accountDetail_bankAcntState_StartDate")

    text_accountDetail_bankAcntState_EndDate = tsui::var_date("text_accountDetail_bankAcntState_EndDate")

    FStartDate=text_accountDetail_bankAcntState_StartDate()

    FEndDate = text_accountDetail_bankAcntState_EndDate()

    FStartDate <- as.character(FStartDate, format = "%Y-%m-%d")
    FEndDate <- as.character(FEndDate, format = "%Y-%m-%d")


    mdljhaccountDetailr::sync_bank_data(erp_token=erp_token,FStartDate = FStartDate,FEndDate = FEndDate)


    tsui::pop_notice("导入完成")



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
