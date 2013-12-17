<?php
    
namespace Smirik\CoreBundle\Log;

class ObjectCountLog
{
    
    protected $object;

    protected $num;

    protected $start;
    protected $stop;
    
    public function __construct($object, $num, $start, $stop)
    {
        $this->object = $object;
        $this->num    = $num;
        $this->start  = $start;
        $this->stop   = $stop;
    }
    
	public function setObject($object)
	{
		$this->object = $object;
	}

	public function getObject()
	{
		return $this->object;
	}
    
	public function setNum($num)
	{
		$this->num = $num;
	}

	public function getNum()
	{
		return $this->num;
	}
    
}