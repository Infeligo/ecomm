<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Contracts extends Controller {

    public function before()
    {
        $this->contractService = new SoapClient("http://192.168.1.13:8081/core/soap/ContractService?wsdl", array('cache_wsdl' => WSDL_CACHE_MEMORY));
        $this->customerService = new SoapClient("http://192.168.1.13:8081/core/soap/CustomerService?wsdl", array('cache_wsdl' => WSDL_CACHE_MEMORY));
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

    public function action_view()
    {
        $view = View::factory("contract-view");
        $id = $this->request->param("id");
        $view->contract = $this->contractService->getContract(array("id" => $id))->return;
        $this->response->body($view);
    }

    public function action_update()
    {
        $this->contractService->updateContract(array(
            "contract" => array(
                "id" => $this->request->post("id"),
                "name" => $this->request->post("name"),
                "description" => $this->request->post("description")
            )
        ));
        echo json_encode("ok");
    }

    public function action_create()
    {
        $result = $this->contractService->createContract(array(
            "contract" => array(
                "name" => $this->request->post("name"),
                "description" => $this->request->post("description"),
                "valueAmount" => $this->request->post("valueAmount"),
                "validFrom" => $this->request->post("validFrom"),
                "period" => $this->request->post("period"),
                "customerId" => $this->request->post("customerId"),
                "addressId" => $this->request->post("addressId")
            )
        ));
        echo json_encode($result);
    }

} // End Welcome
