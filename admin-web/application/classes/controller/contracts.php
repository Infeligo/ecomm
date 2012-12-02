<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Contracts extends Controller {

    public function before() {
        $this->soap = new SoapClient("http://localhost:8080/core/soap/ContractService?wsdl");
    }

    public function action_index()
    {
        $view = View::factory("contracts");
        $view->contracts = $this->soap->findContracts()->return;

        $this->response->body($view);
    }

    public function action_view()
    {
        $view = View::factory("contract-view");
        $id = $this->request->param("id");
        $view->contract = $this->soap->getContract(array("id" => $id))->return;

        $this->response->body($view);
    }

    public function action_edit() {
        $contract = $this->request->post();
        //$result = $this->soap->saveContract($contract)->return;
        echo json_encode($contract);
    }

    public function action_accept() {
        //$result = $this->soap->acceptContract(array("id" => $this->request->param("id")))->return;
        $result = $this->request->post();
        $this->response->body(json_encode($result));
    }

    public function action_reject() {
        $result = $this->soap->rejectContract(array("id" => $this->request->param("id")))->return;
        $this->response->body(json_encode($result));
    }

} // End Welcome
