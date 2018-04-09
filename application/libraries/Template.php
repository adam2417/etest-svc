<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Template Class
 *
 * Template View Parse Class
 *
 * @package     CodeIgniter
 * @subpackage  Libraries
 * @category    Templates
 * @author      Koola
 * @link
 */
class Template {
	
	 var $js = array();
	 var $css = array();
	 var $regions = array(
	      '_scripts' => array(),
	      '_styles' => array(),
   	 );

	/**
	 * Constructor
	 *
	 * @access    public
	 */
	function __construct()
	{
		log_message('debug', "Template Class Initialized");
	}

	// --------------------------------------------------------------------

	/**
	 * Load template
	 *
	 * @access   public
	 * @param    String
	 * @param    Array
	 * @param    Array
	 * @param    bool
	 * @return   parsed view
	 */
	function load($template = '', $view = array(), $vars = array(), $return = FALSE, $renderMainTemplate = TRUE, $renderContentTemplate = TRUE)
	{
		$this->CI =& get_instance();
		$tpl = array();

		// Check for partials to load
		if (count($view) > 0)
		{
			// Load views into var array
			foreach($view as $key => $file)
			{
				if($renderContentTemplate) $tpl[$key] = $this->CI->parser->parse($file, $vars, TRUE);
				else $tpl[$key] = $this->CI->load->view($file, $vars, TRUE);
					
			}
			// Merge into vars array
			$vars = array_merge($vars, $tpl);
		}

		// Load master template
		if($renderMainTemplate) 
			return $this->CI->parser->parse($template,$vars,$return);
		else 
			return $this->CI->load->view($template, $vars, $return);		 
	}
	
	/**
    * Dynamically include javascript in the template
    * 
    * NOTE: This function does NOT check for existence of .js file
    *
    * @access  public
    * @param   string   script to import or embed
    * @param   string  'import' to load external file or 'embed' to add as-is
    * @param   boolean  TRUE to use 'defer' attribute, FALSE to exclude it
    * @return  TRUE on success, FALSE otherwise
    */
   
   function add_js($script, $type = 'import', $defer = FALSE)
   {
   	  $this->CI =& get_instance();
      $success = TRUE;
      $js = NULL;
      
      $this->CI->load->helper('url');
      
      switch ($type)
      {
         case 'import':
            $filepath = base_url() . $script;
            $js = '<script type="text/javascript" src="'. $filepath .'"';
            if ($defer)
            {
               $js .= ' defer="defer"';
            }
            $js .= "></script>";
            break;
         
         case 'embed':
            $js = '<script type="text/javascript"';
            if ($defer)
            {
               $js .= ' defer="defer"';
            }
            $js .= ">";
            $js .= $script;
            $js .= '</script>';
            break;
            
         default:
            $success = FALSE;
            break;
      }
      
      // Add to js array if it doesn't already exist
      if ($js != NULL && !in_array($js, $this->js))
      {
         $this->js[] = $js;
         $this->write('_scripts', $js);
      }
      
      return $success;
   }
   
   // --------------------------------------------------------------------
   
   /**
	 * Write contents to a region
	 *
	 * @access	public
	 * @param	string	region to write to
	 * @param	string	what to write
	 * @param	boolean	FALSE to append to region, TRUE to overwrite region
	 * @return	void
	 */
   
   function write($region, $content, $overwrite = FALSE)
   {
      if (isset($this->regions[$region]))
      {
         if ($overwrite === TRUE) // Should we append the content or overwrite it
         {
            $this->regions[$region]['content'] = array($content);
         } else {
            $this->regions[$region]['content'][] = $content;
         }
      }
      
      // Regions MUST be defined
      else
      {
         show_error("Cannot write to the '{$region}' region. The region is undefined.");
      }
   }
   
   // --------------------------------------------------------------------
	
}