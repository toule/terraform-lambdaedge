exports.handler = (event, context, callback) => {
	    const response = {
			        status: '200',
			        statusDescription: 'OK',
			        body: "Welcome to CloudFront Day Ver.3- Rayhli",
			    };
	    callback(null, response);
};
