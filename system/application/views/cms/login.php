<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?= $this->load->config->item('web_title') ?> - Login</title>
<!--<link rel="stylesheet" type="text/css" href="<?=$this->load->config->item('base_url').$this->load->config->item('css_main')?>" media="screen" />-->
<link rel="stylesheet" type="text/css" href="<?=base_url() . $this->load->config->item('inc_directory')?>css/style_cms.css" media="all" />
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="focusFirst()">

<?php //$this->load->view('cms/header_login'); ?>
<br/><br/><br/>
	
				
   				<table cellpadding="10" cellspacing="5" align="center">
					<tr>
						<td width="20" align="center">&nbsp;</td>
						<td>
                            <?=form_open('users/process_form_login') ?>
                        	<table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                            	<td height="40" valign="top">
                                <img src="<?php echo base_url().$this->load->config->item('image_directory'). 'Welcome.gif'?>" border="0">
                                <!--<font size="5" color="#000000" face="Verdana, Arial, Helvetica, sans-serif"><strong>Selamat Datang.</strong></font>
-->
                                </td>
                            </tr>
                            </table>
                        
						  <table border="0" cellpadding="0" cellspacing="0">
                      
							<tr><td><table width="495" background="<?php echo base_url().$this->load->config->item('image_directory'). 'box-round-green-bg.gif'?>" >
							<tr height="35" valign="bottom"> 
								<td width="10">&nbsp;</td>
								<td width="240" ><br/><font face="Arial, Helvetica, sans-serif" size="2" color="#000000"><strong>Username</strong></font></td>
								<td>
								<br/><font face="Arial, Helvetica, sans-serif" size="2" color="#000000"><strong>Password</strong></font>								</td>
							</tr>
							<tr valign="middle"> 
								<td>&nbsp;</td>
								<td><input type="text" name="usr" class="altLoginField" size="30" maxlength="30" value="<?=set_value('usr')?>"></td>
								<td>
									<input type="password" name="pwd" class="altLoginField" size="30" maxlength="30">							</td>
							</tr>
							<tr>
								<td align="right" height="45" valign="middle" colspan="3">
								<br/>
                                <input type="submit" value="  Login  " class="altButton" id="login" name="login" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;								</td>
							</tr>
							</table>
                            <table width="495" border="0" cellpadding="0" cellspacing="0">
                            	<tr><td height="30" valign="top" width="100%">
                                <img src="<?php echo base_url().$this->load->config->item('image_directory'). 'box-round-green-footer.gif'?>" border="0"></td></tr>
                            </table>
                            </td></tr>
                            
                            <tr>
                            	<td width="495" align="center">                                </td>
                            </tr>
							</table>						
                            </td>
						<td>&nbsp;</td>
					</tr>
                    <tr>
					  <td align="center">&nbsp;</td>
					  <td align="center" valign="top">
                      	<div class="error"><?=$this->session->flashdata('error')?></div>
                      	<?php 
							if(isset($pesan))
							{
								echo '<div class="error">'.$pesan.'</div>';
							}
						 ?>
                         <?php 
							if(isset($pesan_sukses))
							{
								echo '<div class="info">'.$pesan_sukses.'</div>';
							}
							
						 ?>
					  	<?php echo validation_errors(); ?>                      
                        </td>
					  <td>&nbsp;</td>
				  </tr>

				</table>
<?=form_close()?>
   
<br/>

<?php $this->load->view('cms/footer_login'); ?>

</body>

</html>