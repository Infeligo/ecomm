package ee.ttu.ecomm.core.service;

import com.avaje.ebean.Ebean;
import ee.ttu.ecomm.core.domain.Contract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
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
    public Long saveContract(Contract contract) {
        Ebean.save(contract);
        return contract.getId();
    }

}
