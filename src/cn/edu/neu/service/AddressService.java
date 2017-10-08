package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.model.Address;

public interface AddressService {

	List<Address> findAddressByUserId(int userId);

	boolean addAddress(Address address);

	Address findAddrById(int addrId);

	boolean delAddress(int addrId);

	int setDefaultAddress(int userId, int addrId);

}
