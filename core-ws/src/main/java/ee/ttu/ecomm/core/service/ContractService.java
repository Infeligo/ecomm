package ee.ttu.ecomm.core.service;

import ee.ttu.ecomm.core.domain.Contract;

import java.util.List;

public interface ContractService {

    List<Contract> findContracts();

    Contract getContract(long contractId);

    void saveContract(Contract contract);

    void acceptContract(long contractId);

    void rejectContract(long contractId);

}
