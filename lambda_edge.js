exports.handler = (event, context, callback) => {
	    const response = {
			        status: '200',
			        statusDescription: 'OK',
			        body: "Welcome to CloudFront Day - Rayhli",
			    };
	    callback(null, response);
};
