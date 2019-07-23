Kaptan647 \	
	Exercise 1 \ #İlk egzersiz, 4 makineden oluşan bir ağ kurup aralarındaki haberleşmeyi ayarlamak
		prepare_client.sh #Client VMinin ayarlarını yapan betik
		prepare_gateway.sh #Gateway VMinin ayarlarını yapan betik
		prepare_router.sh #Router VMinin ayarlarını yapan betik
		prepare_server.sh #Server VMinin ayarlarını yapan betik
	topoloji.png #Kurulan GNS3 ağının toplolojisi
	iptables.sh #Bir sunucunun 80 portun üzerinden haberleşmesini engelleyen iptables kuralları
