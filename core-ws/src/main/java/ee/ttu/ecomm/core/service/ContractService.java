package ee.ttu.ecomm.core.service;

import ee.ttu.ecomm.core.domain.Contract;

import java.util.List;

public interface ContractService {

    List<Contract> getContracts();

    List<Contract> getCustomerContracts(long customerId);

    Contract getContract(long contractId);

    void saveContract(Contract contract);

    void concludeContract(long contractId);

}
