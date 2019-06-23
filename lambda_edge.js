exports.handler = (event, context, callback) => {
	    const response = {
			        status: '200',
			        statusDescription: 'OK',
			        body: "Lambda@Edge is awesome! Ver.4",
			    };
	    callback(null, response);
};
