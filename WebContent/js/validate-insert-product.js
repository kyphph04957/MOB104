$().ready(function () {
            $("#form-insert-product").validate({
                onfocusout: false,
                onkeyup: false,
                onclick: false,
                rules: {
                    "productID": {
                        required: true,
                    },
                    "productName": {
                        required: true,
                    },
                    "productPrice": {
                        required: true,
                    },
                    "productAmount": {
                        required: true,
                    },
                    "productMonitor": {
                        required: true,
                    },
                    "productOS": {
                        required: true,
                    },
                    "productCamera": {
                        required: true,
                    },
                    "productFrontCamera": {
                        required: true,
                    },
                    "productCPU": {
                        required: true,
                    },
                    "productRAM": {
                        required: true,
                    },
                    "productROM": {
                        required: true,
                    },
                    "productSIM": {
                        required: true,
                    },
                    "productPIN": {
                        required: true,
                    },
                    "productFrontImg": {
                        required: true,
                    },
                    "productBehindImg": {
                        required: true,
                    },
                    "productThicknessImg": {
                        required: true,
                    }
                },
                messages: {
                    "productID": {
                    	required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productName": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productPrice": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productAmount": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productMonitor": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productOS": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productCamera": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productFrontCamera": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productCPU": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productRAM": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productROM": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productSIM": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productPIN": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productFrontImg": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productBehindImg": {
                        required: "Vui lòng không bỏ trống trường này!",
                    },
                    "productThicknessImg": {
                        required: "Vui lòng không bỏ trống trường này!",
                    }
                }
            });
            
        });