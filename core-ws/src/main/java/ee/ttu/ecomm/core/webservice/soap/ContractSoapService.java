package ee.ttu.ecomm.core.webservice.soap;

import ee.ttu.ecomm.core.service.ContractService;
import org.springframework.stereotype.Service;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;

import javax.annotation.Resource;

@Service
public class ContractSoapService {

    @Resource
    ContractService contractService;



}
