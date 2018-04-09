<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
class TableBeans {
    function __construct(){
        include(APPPATH.'third_party/beans/UserLoginBean.php');
        include(APPPATH.'third_party/beans/MenuMapBean.php');
        include(APPPATH.'third_party/beans/QuestionBankBean.php');
        include(APPPATH.'third_party/beans/AnswerBean.php');
        include(APPPATH.'third_party/beans/StudentBean.php');
    }
}