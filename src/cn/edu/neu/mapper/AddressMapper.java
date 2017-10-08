package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.model.Address;

public interface AddressMapper {

	List<Address> findAddressByUserId(int userId);

	Boolean addAddress(Address address);

	Address findAddrById(int addrId);

	boolean delAddress(int addrId);

	boolean clearDefault(int userId);

	boolean setDefaultAddress(int addrId);

	int findAddressByUserIdAndDef(int userId);

}
