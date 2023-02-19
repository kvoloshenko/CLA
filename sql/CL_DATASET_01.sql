-- select count(*)  from nc_objects o where o.object_type_id = 9163172376313089064 -- Credit Limit

select TO_CHAR(o.object_id) as object_id, 
pr.value as MAX_CL_ADJUSTOR_REVIEWER,
TO_CHAR(pr1.date_value, 'YYYY-MM-DD HH24:MI:SS') as DATE_MAX_CL_ADJUSTOR_REVIEWER,
pr2.value as  EFFECTIVE_MAXIMUM_CL,
pr3.value as  MIN_CL,
pr4.value as  OTP,
pr5.value as  CL_AMOUNT_OTP,
lv6.value as  CL_TYPE_OTP,
pr7.value as  CUSTOMER_TYPE,
pr8.value as  CUSTOMER_SUB_SEGMENT,
pr9.value as NUMBER_LINES,
pr10.value as PENDING_ACTUAL_CL,
lv11.value as EFFECTIVE_MAX_CL_EDIT_LOCKED,
lv12.value as ACTUAL_CL_EDIT_LOCKED,
lv13.value as TEMP_CL_EDIT_LOCKED,
pr14.value as DEPOSIT,
lv15.value as ADD_CL_CRITERIA,
pr16.value as ADD_CL_AMOUNT,
TO_CHAR(pr17.date_value, 'YYYY-MM-DD HH24:MI:SS') as LAST_ADD_CL_DATE,
pr18.value as SMART_HOME_PROD_MRC,
pr19.value as AUCTION_PACK_MRC,
pr20.value as CREDIT_CARD_TYPE,
pr21.value as COUNT_ADD_CL_MODIFICAT,
pr22.value as MOB,
pr23.value as PAYMENT_TYPE,
pr24.value as AGE,
pr25.value as GENDER,
pr26.value as PROFESSION,
pr27.value as EMIRATE,
pr28.value as TYPE_LINE,
TO_CHAR(pr29.date_value, 'YYYY-MM-DD HH24:MI:SS') as FINAL_ASSESSMENT_VALIDITY,
pr30.value as Adj_Req_Proc_ID,
--pr31.value as BILLING_ACCOUNT
--o.name as BILLING_ACCOUNT
TO_CHAR(pr31.date_value, 'YYYY-MM-DD HH24:MI:SS') as LAST_UPDATE_CL

from nc_objects o, nc_params pr, nc_params pr1, nc_params pr2, nc_params pr3, 
nc_params pr4, nc_params pr5, nc_params pr6, nc_list_values lv6, nc_params pr7, 
nc_params pr8, nc_params pr9, nc_params pr10, nc_params pr11, nc_list_values lv11, 
nc_params pr12, nc_list_values lv12, nc_params pr13, nc_list_values lv13, nc_params pr14, 
nc_params pr15, nc_list_values lv15, nc_params pr16, nc_params pr17, nc_params pr18, 
nc_params pr19, nc_params pr20, nc_params pr21, nc_params pr22, nc_params pr23,
nc_params pr24, nc_params pr25, nc_params pr26, nc_params pr27, nc_params pr28, 
nc_params pr29, nc_params pr30, nc_params pr31
--, nc_references rf31

where o.object_type_id = 9163172376313089064 -- Credit Limit
and o.object_id  = pr.object_id (+)
and pr.attr_id  (+) =  9163769360113194987  -- Maximum Credit Limit by Adjustor/Reviewer
and o.object_id  = pr1.object_id (+)
and pr1.attr_id  (+) =  9164487943913805840  -- Date of Maximum Credit Limit by Adjustor/Reviewer
and o.object_id  = pr2.object_id (+)
and pr2.attr_id  (+) =  9163769371613194939  -- Effective Maximum Credit Limit
and o.object_id  = pr3.object_id (+)
and pr3.attr_id  (+) =  9163769388713195138  -- Minimum Credit Limit
and o.object_id  = pr4.object_id (+)
and pr4.attr_id  (+) =  9163769386313195264  -- OTP
and o.object_id  = pr5.object_id (+)
and pr5.attr_id  (+) =  9164391404813287128  -- Credit Limit Amount for OTP
and o.object_id  = pr6.object_id (+)
and pr6.attr_id  (+) =  9164391414113287314  -- Credit Limit Type for OTP
and pr6.list_value_id = lv6.list_value_id (+)
and o.object_id  = pr7.object_id (+)
and pr7.attr_id  (+) =  9164073552213087816  -- Customer Type
and o.object_id  = pr8.object_id (+)
and pr8.attr_id  (+) =  9163831011913074360  -- Customer Sub-Segment
and o.object_id  = pr9.object_id (+)
and pr9.attr_id  (+) =  9163319095213091890  -- Number of Lines
and o.object_id  = pr10.object_id (+)
and pr10.attr_id  (+) =  9163769407113195725  -- Pending Actual Credit Limit
and o.object_id  = pr11.object_id (+)
and pr11.attr_id  (+) =  9163769422213196358  -- Effective Maximum Credit Limit Edit Locked
and pr11.list_value_id = lv11.list_value_id (+)
and o.object_id  = pr12.object_id (+)
and pr12.attr_id  (+) =  9163899358213158226  -- Actual Credit Limit Edit Locked
and pr12.list_value_id = lv12.list_value_id (+)
and o.object_id  = pr13.object_id (+)
and pr13.attr_id  (+) =  9164444552113621698  -- Temporary Credit Limit Edit Locked
and pr13.list_value_id = lv13.list_value_id (+)
and o.object_id  = pr14.object_id (+)
and pr14.attr_id  (+) =  9163769451113197266  -- Deposit
and o.object_id  = pr15.object_id (+)
and pr15.attr_id  (+) =  9163769450413197392  -- Additional Credit Limit Criteria
and pr15.list_value_id = lv15.list_value_id (+)
and o.object_id  = pr16.object_id (+)
and pr16.attr_id  (+) =  9163769463713197436  -- Additional Credit Limit Amount
and o.object_id  = pr17.object_id (+)
and pr17.attr_id  (+) =  9163769471413197510  -- Last Additional Credit Limit Date
and o.object_id  = pr18.object_id (+)
and pr18.attr_id  (+) =  9163329704013117670  -- Smart Home Product MRC
and o.object_id  = pr19.object_id (+)
and pr19.attr_id  (+) =  9163329704813117570  -- Auction Package MRC
and o.object_id  = pr20.object_id (+)
and pr20.attr_id  (+) =  9164349660613407680  -- Credit Card Type
and o.object_id  = pr21.object_id (+)
and pr21.attr_id  (+) =  9164349333513407020  -- Counter on Additional Credit Limit Modification
and o.object_id  = pr22.object_id (+)
and pr22.attr_id  (+) =  9163399255713326960  -- MOB
and o.object_id  = pr23.object_id (+)
and pr23.attr_id  (+) =  9163561509013578233  -- Payment Type
and o.object_id  = pr24.object_id (+)
and pr24.attr_id  (+) =  9163561745513580552  -- Age
and o.object_id  = pr25.object_id (+)
and pr25.attr_id  (+) =  9163561577313579348  -- Gender
and o.object_id  = pr26.object_id (+)
and pr26.attr_id  (+) =  9163561561913578946  -- Profession
and o.object_id  = pr27.object_id (+)
and pr27.attr_id  (+) =  9163561696213580283  -- Emirate
and o.object_id  = pr28.object_id (+)
and pr28.attr_id  (+) =  9163319206813092045  -- Type of Line
and o.object_id  = pr29.object_id (+)
and pr29.attr_id  (+) =  9163863456413138586  -- Final Assessment Validity
and o.object_id  = pr30.object_id (+)
and pr30.attr_id  (+) =  9164367327513203121  -- Adjustor Request Process ID

-- and o.object_id  = pr31.object_id (+)
/*and o.object_id = rf31.reference (+)
and rf31.attr_id  (+) =  9164079933913097481  -- Billing Account*/

and o.object_id  = pr31.object_id (+)
and pr31.attr_id  (+) =  9164547772213009025;  -- Last update of Credit Limit


/*select to_char(o.object_id) as object_id, pr.value as MAX_CL_ADJUSTOR_REVIEWER from nc_objects o, nc_params pr 
where o.object_type_id = 9163172376313089064 -- Credit Limit
and o.object_id  = pr.object_id (+)
and pr.attr_id  (+) =  9163769360113194987  -- Maximum Credit Limit by Adjustor/Reviewer*/



/*select *
  from nc_objects o, nc_params pr
 where o.object_type_id = 9163172376313089064 -- Credit Limit
   and pr.object_id = o.object_id*/
   
/*select a.name as a_name, 
         nvl (nvl(pr.value, lv.value), TO_CHAR(pr.date_value, 'YYYY-MM-DD HH24:MI:SS')) as a_value, 
         a.show_order as show_order,
         a.attr_id, 
         'attr' as a_type,
         0  as a_references
     from nc_params pr, nc_attributes a, nc_list_values lv 
     where pr.object_id=3165843495440375781 --P_OBJ_ID
     and pr.attr_id=a.attr_id
     and pr.list_value_id = lv.list_value_id (+) 
union
     select ra.name as a_name, 
     ro.name as a_value, 
     ra.show_order as show_order,
     ra.attr_id, 
     'references' as a_type,
     ro.object_id as a_references
     from nc_references rf, nc_objects ro, nc_attributes ra
     where rf.object_id=3165843495440375781 --P_OBJ_ID
     and rf.reference=ro.object_id
     and rf.attr_id=ra.attr_id
*/
