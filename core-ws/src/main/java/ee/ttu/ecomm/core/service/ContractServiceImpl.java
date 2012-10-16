package ee.ttu.ecomm.core.service;

import com.avaje.ebean.Ebean;
import ee.ttu.ecomm.core.domain.Contract;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContractServiceImpl implements ContractService {


    @Override
    public List<Contract> getContracts() {
        return Ebean.find(Contract.class).findList();
    }

    @Override
    public List<Contract> getCustomerContracts(long customerId) {
        return Ebean.find(Contract.class).where().eq("customer.id", customerId).findList();
    }

    @Override
    public Contract getContract(long contractId) {
        return Ebean.find(Contract.class, contractId);
    }

    @Override
    public void concludeContract(long contractId) {
        throw new UnsupportedOperationException("Contract conclusion is not implemented yet.");
    }
}
