package ee.ttu.ecomm.core.service;

import ee.ttu.ecomm.core.domain.Contract;

import java.util.List;

public interface ContractService {

    List<Contract> findContracts();

    Contract getContract(long contractId);

    Long saveContract(Contract contract);

}
