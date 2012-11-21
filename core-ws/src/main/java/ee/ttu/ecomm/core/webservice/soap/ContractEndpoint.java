package ee.ttu.ecomm.core.webservice.soap;

import ee.ttu.ecomm.core.domain.Contract;
import ee.ttu.ecomm.core.service.ContractService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.jws.WebMethod;
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
    public Contract getContract(long contractId) {
        return contractService.getContract(contractId);
    }

    @WebMethod
    public String saveContract(Contract contract) {
        contractService.saveContract(contract);
        return contract.getContractNumber();
    }

    @WebMethod
    public void acceptContract(long contractId) {
        contractService.acceptContract(contractId);
    }

    @WebMethod
    public void rejectContract(long contractId) {
        contractService.rejectContract(contractId);
    }

}
