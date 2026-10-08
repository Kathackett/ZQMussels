email_excel<-read.xlsx("//sfp.idir.bcgov/S140/S40203/WFC AEB/General/2 SCIENCE - Invasives/SPECIES/Zebra_Quagga_Mussel/Operations/Watercraft Inspection Data/Multiyear data/WatercraftInspectionData_AllYears_All_Columns.xlsx")

email_excel = email_excel |>
  filter(Year == 2025) |>
  filter(str_detect(Email, regex("dfo", ignore_case = TRUE))) |>
  mutate(TimeOfInspection = as.POSIXct(
    TimeOfInspection * 86400,
    origin = "1899-12-30",
    tz = "UTC"
  )
  ) |>
  select(Watercraft_Risk_Assessment_ID, Station,TimeOfInspection)

write.xlsx(email_excel, "./02_IMDP_Figure_Generator/data/dfo_2025_emails.xlsx")

