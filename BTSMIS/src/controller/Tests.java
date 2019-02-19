package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.AccessRequestModel;
import model.BtsModel;
import model.GenFuelTrackingModel;
import model.GenSetModel;
import model.InStockModel;
import model.ItemCategoryModel;
import model.ItemControllerModel;
import model.ItemUsageModel;
import model.PartnerModel;
import model.UserModel;

import service.AccessRequest;
import service.Bts;
import service.GenFuelTracking;
import service.GenSet;
import service.InStock;
import service.ItemCategory;
import service.ItemController;
import service.ItemUsage;
import service.Partner;
import service.User;

public class Tests {
public static void main(String[]arg){

ItemUsage i = new ItemUsage();
ItemUsageModel iu = new ItemUsageModel();

List<ItemUsage> l = new ArrayList<>();
l = iu.getGenSetFuelTrackingRegion(1, "BG2206");
for(ItemUsage s: l)
	System.out.println(s.getRunHour());

}
}