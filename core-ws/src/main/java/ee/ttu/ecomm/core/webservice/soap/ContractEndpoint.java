package ee.ttu.ecomm.core.webservice.soap;

import ee.ttu.ecomm.core.domain.Contract;
import ee.ttu.ecomm.core.service.ContractService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import java.util.List;

@Component
@WebService(serviceName = "ContractService")
public class ContractEndpoint {

    @Resource
    ContractService contractService;

    @WebMethod
    public List<Contract> findContracts() {
        return contractService.findContracts();
    }

    @WebMethod
    public Contract getContract(@WebParam(name = "id") long contractId) {
        return contractService.getContract(contractId);
    }

    @WebMethod
    public void saveContract(@WebParam(name = "contract") ContractDTO contractDTO) {
        contractService.saveContract(contractDTO.toContract());
    }

}
