<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Contracts extends Controller {

    public function before()
    {
        $this->contractService = new SoapClient("http://localhost:8080/core/soap/ContractService?wsdl", array('cache_wsdl' => WSDL_CACHE_MEMORY));
        $this->customerService = new SoapClient("http://localhost:8080/core/soap/CustomerService?wsdl", array('cache_wsdl' => WSDL_CACHE_MEMORY));
    }

    public function action_index()
    {
        $view = View::factory("contracts");
        $view->contracts = $this->contractService->findContracts()->return;
        $this->response->body($view);
    }

    public function action_new()
    {
        $view = View::factory("contract-new");
        $this->response->body($view);
    }

    public function action_find_customers()
    {
        $query = $this->request->query("query");
        $customers = $this->customerService->findCustomers(array("query" => $query));
        echo json_encode($customers);
    }

    public function action_get_customer()
    {
        $customerId = $this->request->query("customerId");
        $customer = $this->customerService->getCustomer(array("id" => $customerId))->return;
        $addresses = $this->customerService->findAddresses(array("customerId" => $customerId));
        $customer->addresses = array_key_exists("return", $addresses) ? $addresses->return : array();
        echo json_encode($customer);
    }

    public function action_edit()
    {
        $view = View::factory("contract-view");
        $id = $this->request->param("id");
        $view->contract = $this->contractService->getContract(array("id" => $id))->return;
        $this->response->body($view);
    }

    public function action_update() {
        echo json_encode("ok");
    }

    public function action_create()
    {
        echo json_encode("ok");
    }

} // End Welcome
