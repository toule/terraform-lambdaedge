exports.handler = (event, context, callback) => {
	    const response = {
			        status: '200',
			        statusDescription: 'OK',
			        body: "Lambda@Edge is awesome! Ver.1",
			    };
	    callback(null, response);
};
