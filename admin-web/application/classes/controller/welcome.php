<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Welcome extends Controller {

    $client = new SoapClient("localhost:8080/core/soap/ContractService?wsdl");


    public function action_index()
    {
        $this->response->body('hello, world!');
    }

} // End Welcome
