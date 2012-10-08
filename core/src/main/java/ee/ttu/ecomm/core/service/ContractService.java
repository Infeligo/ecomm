package ee.ttu.ecomm.core.service;

import ee.ttu.ecomm.core.domain.Contract;

import java.util.List;

public interface ContractService {

    List<Contract> getCustomerContracts(Long customerId);
    Contract getContract(Long contractId);
    void concludeContract(Long contractId);

}
