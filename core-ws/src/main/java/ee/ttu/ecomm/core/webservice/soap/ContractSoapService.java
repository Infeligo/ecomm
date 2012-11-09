package ee.ttu.ecomm.core.webservice.soap;

import ee.ttu.ecomm.core.domain.Contract;
import ee.ttu.ecomm.core.service.ContractService;
import org.springframework.stereotype.Service;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ContractSoapService {

    @Resource
    ContractService contractService;

    public List<Contract> getContracts() {
        return contractService.getContracts();
    }

}
