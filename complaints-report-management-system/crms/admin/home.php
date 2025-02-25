<?php include 'db_connect.php' ?>
<style>
   span.float-right.summary_icon {
    font-size: 3rem;
    position: absolute;
    right: 1rem;
    top: 0;
}
.imgs{
		margin: .5em;
		max-width: calc(100%);
		max-height: calc(100%);
	}
	.imgs img{
		max-width: calc(100%);
		max-height: calc(100%);
		cursor: pointer;
	}
	#imagesCarousel,#imagesCarousel .carousel-inner,#imagesCarousel .carousel-item{
		height: 60vh !important;background: black;
	}
	#imagesCarousel .carousel-item.active{
		display: flex !important;
	}
	#imagesCarousel .carousel-item-next{
		display: flex !important;
	}
	#imagesCarousel .carousel-item img{
		margin: auto;
	}
	#imagesCarousel img{
		width: auto!important;
		height: auto!important;
		max-height: calc(100%)!important;
		max-width: calc(100%)!important;
	}
</style>

<div class="containe-fluid">
	<div class="row mt-3 ml-3 mr-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <H5><B>CRIME REPORTING & MANAGEMENT SYSTEM </B></H5>
                    <hr>
                </div>
				<TABLE cellspacing = "10px", cellpadding="10px">
				<TR>		
				<td ><a href="index.php?page=complaints" class="nav-item nav-complaints"><span class='icon-field'><i class="fa fa-list-alt "></i></span><h6><b> Crimes Reported</b></h6></a></a></td>
				<td><a href="index.php?page=complainants" class="nav-item nav-complainants"><span class='icon-field'><i class="fa fa-user-secret "></i></span> <h6><b>Victims</b></h6></a></td>
				<td><a href="index.php?page=responders" class="nav-item nav-responders"><span class='icon-field'><i class="fa fa-user-shield "></i></span><h6><b> Responders</b></h6></a></td>
				</tr>

				<tr >
				<td><a href="index.php?page=stations" class="nav-item nav-stations"><span class='icon-field'><i class="fa fa-building "></i></span><h6><b> Stations</b></h6></a></td>	
				<td><a href="index.php?page=complaints_report" class="nav-item nav-complaints_report"><span class='icon-field'><i class="fa fa-th-list"></i></span><h6><b> Complaints Report</b></h6></a></td>
				<td><a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users "></i></span><h6><b> Users</b></h6></a></td>
				</tr>
				<tr>
				<td><a href="index.php?page=site_settings" class="nav-item nav-site_settings"><span class='icon-field'><i class="fa fa-cogs"></i></span> <h6><b>System Settings</b></h6></a></td>
				
				</tr>
			</TR>
			</TABLE>	
			<br><br><br><br><br>
			
					<div class="card-body">
                    <p><B>THIS PROJECT IS DONE BY TIMOTHY BARAKA REG NO:SCT221-0830/2021 (FINAL EXAM)</B></p>
                    <hr>
                </div>			
            </div>      			
        </div>
    </div>
</div>

<script>
	$('#manage-records').submit(function(e){
        e.preventDefault()
        start_load()
        $.ajax({
            url:'ajax.php?action=save_track',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success:function(resp){
                resp=JSON.parse(resp)
                if(resp.status==1){
                    alert_toast("Data successfully saved",'success')
                    setTimeout(function(){
                        location.reload()
                    },800)

                }
                
            }
        })
    })
    $('#tracking_id').on('keypress',function(e){
        if(e.which == 13){
            get_person()
        }
    })
    $('#check').on('click',function(e){
            get_person()
    })
    function get_person(){
            start_load()
        $.ajax({
                url:'ajax.php?action=get_pdetails',
                method:"POST",
                data:{tracking_id : $('#tracking_id').val()},
                success:function(resp){
                    if(resp){
                        resp = JSON.parse(resp)
                        if(resp.status == 1){
                            $('#name').html(resp.name)
                            $('#address').html(resp.address)
                            $('[name="person_id"]').val(resp.id)
                            $('#details').show()
                            end_load()

                        }else if(resp.status == 2){
                            alert_toast("Unknow tracking id.",'danger');
                            end_load();
                        }
                    }
                }
            })
    }
</script>