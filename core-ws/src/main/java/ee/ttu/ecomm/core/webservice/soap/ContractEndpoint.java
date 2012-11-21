package ee.ttu.ecomm.core.webservice.soap;

import ee.ttu.ecomm.core.domain.Contract;
import ee.ttu.ecomm.core.service.ContractService;
import ee.ttu.ecomm.core.webservice.soap.schema.*;
import org.springframework.ws.server.endpoint.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Endpoint
public class ContractEndpoint {

    private static final String NAMESPACE_URI = "http://ttu.ee/ecomm/schemas/messages";

    @Resource
    ContractService contractService;

    ObjectFactory objectFactory = new ObjectFactory();

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "FindContractsRequest")
    @ResponsePayload
    public FindContractResponse findContracts() {
        FindContractResponse findContractResponse = objectFactory.createFindContractResponse();
        for (Contract contract : contractService.findContracts()) {
            ee.ttu.ecomm.core.webservice.soap.schema.Contract c = objectFactory.createContract();
            c.setContractNumber(contract.getContractNumber());
            findContractResponse.getContract().add(c);
        }
        return findContractResponse;
    }

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "GetContractRequest")
    @Namespace(prefix = "c", uri = NAMESPACE_URI)
    @ResponsePayload
    public Contract getContract(long contractId) {
        return contractService.getContract(contractId);
    }

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "AcceptContractRequest")
    public void acceptContract(long contractId) {
        contractService.acceptContract(contractId);
    }

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "RejectContractRequest")
    public void rejectContract(long contractId) {
        contractService.rejectContract(contractId);
    }

}
