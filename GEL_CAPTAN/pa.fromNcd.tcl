
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name dig_mac -dir "D:/cbradford/FiFoFix/GEL_CAPTAN/planAhead_run_1" -part xc4vlx25ff668-10
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "D:/cbradford/FiFoFix/GEL_CAPTAN/TOP_LEVEL_cs.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/cbradford/FiFoFix/GEL_CAPTAN} {../ipcore_dir} {ipcore_dir} }
add_files [list {../ipcore_dir/ADDR_FIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../ipcore_dir/DATA_FIFO_0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../ipcore_dir/INFO_FIFO_0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ADC_FIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ethernetFIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ethernet_FIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo_adc.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "TOP_LEVEL.ucf" [current_fileset -constrset]
add_files [list {TOP_LEVEL.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "D:/cbradford/FiFoFix/GEL_CAPTAN/TOP_LEVEL.ncd"
if {[catch {read_twx -name results_1 -file "D:/cbradford/FiFoFix/GEL_CAPTAN/TOP_LEVEL.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"D:/cbradford/FiFoFix/GEL_CAPTAN/TOP_LEVEL.twx\": $eInfo"
}
