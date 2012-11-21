package ee.ttu.ecomm.core.service;

import com.avaje.ebean.Ebean;
import ee.ttu.ecomm.core.domain.Contract;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContractServiceImpl implements ContractService {


    @Override
    public List<Contract> findContracts() {
        return Ebean.find(Contract.class).findList();
    }

    @Override
    public Contract getContract(long contractId) {
        return Ebean.find(Contract.class, contractId);
    }

    @Override
    public void saveContract(Contract contract) {
        Ebean.save(contract);
    }

    @Override
    public void acceptContract(long contractId) {
        Contract contract = this.getContract(contractId);
        // Set accepted state
        // Save contract
    }

    @Override
    public void rejectContract(long contractId) {
        Contract contract = this.getContract(contractId);
        // Set rejected state
        // Save contract
    }
}
