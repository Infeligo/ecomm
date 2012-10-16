package ee.ttu.ecomm.core.webservice.rest;

import ee.ttu.ecomm.core.domain.Contract;
import ee.ttu.ecomm.core.service.ContractService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * RESTful webservice adapter implemented as Spring MVC controller
 */
@Controller
@RequestMapping("contracts")
public class ContractRestfulService {

    @Resource
    ContractService contractService;

    @RequestMapping(value = "", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Contract> getContracts() {
        return contractService.getContracts();
    }

}
