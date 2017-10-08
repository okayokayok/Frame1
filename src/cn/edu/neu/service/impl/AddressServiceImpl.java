package cn.edu.neu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.neu.mapper.AddressMapper;
import cn.edu.neu.model.Address;
import cn.edu.neu.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	AddressMapper addressMapper;
	
	@Override
	public List<Address> findAddressByUserId(int userId) {
		// TODO Auto-generated method stub
		return addressMapper.findAddressByUserId(userId);
	}

	@Override
	public boolean addAddress(Address address) {
		// TODO Auto-generated method stub
		return addressMapper.addAddress(address);
	}

	@Override
	public Address findAddrById(int addrId) {
		// TODO Auto-generated method stub
		return addressMapper.findAddrById(addrId);
	}

	@Override
	public boolean delAddress(int addrId) {
		// TODO Auto-generated method stub
		return addressMapper.delAddress(addrId);
	}

	@Override
	public int setDefaultAddress(int userId, int addrId) {
		// TODO Auto-generated method stub
		int id= addressMapper.findAddressByUserIdAndDef(userId);
		boolean clear = addressMapper.clearDefault(userId);
		if (clear) {
			boolean result = addressMapper.setDefaultAddress(addrId);
			
		}
		return id;
	}

}
