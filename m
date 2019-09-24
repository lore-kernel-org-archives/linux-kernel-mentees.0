From: skhan at linuxfoundation.org (Shuah Khan)
Date: Tue, 24 Sep 2019 13:44:55 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 2/2] cec-compliance:
 add/refactor tuner control tests
In-Reply-To: <20190924192445.93575-3-c0d1n61at3@gmail.com>
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
	<20190924192445.93575-3-c0d1n61at3@gmail.com>
Message-ID: <d8e866e5-fca2-eed7-5b2f-38bfca380d81@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 9/24/19 1:24 PM, Jiunn Chang wrote:
> Tests added/refactored for new features added to the cec-follower.
> 
> Analog tuner control tests added/refactored:
>    - give analog tuner status
>    - select tuner analog service
>    - analog tuner step decrement
>    - analog tuner step increment
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>   utils/cec-compliance/cec-test.cpp | 181 +++++++++++++++++++++++-------
>   1 file changed, 140 insertions(+), 41 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index aece546c..91600d39 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -722,9 +722,19 @@ static struct remote_subtest deck_ctl_subtests[] = {
>     TODO: These are very rudimentary tests which should be expanded.
>    */
>   
> -static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int tuner_ctl_analog_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
>   {
>   	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_select_analogue_service(&msg, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +			                7668, CEC_OP_BCAST_SYSTEM_PAL_BG); // 479.25 MHz analog frequency
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	if (unrecognized_op(&msg))
> +		return NOTSUPPORTED;
> +	if (refused(&msg))
> +		return REFUSED;
>   
>   	cec_msg_init(&msg, me, la);
>   	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> @@ -737,6 +747,14 @@ static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bo
>   	if (cec_msg_status_is_abort(&msg))
>   		return PRESUMED_OK;
>   
> +	cec_ops_tuner_device_status(&msg, &info);
> +	if (info.analog.ana_bcast_type != CEC_OP_ANA_BCAST_TYPE_CABLE)
> +		return FAIL;
> +	if (info.analog.ana_freq != 7668)
> +		return FAIL;
> +	if (info.analog.bcast_system != CEC_OP_BCAST_SYSTEM_PAL_BG)
> +		return FAIL;
> +

Why not combine these conditionals in to one. Why do you need 3 separate
blocks?

>   	return 0;
>   }
>   
> @@ -745,23 +763,24 @@ static int tuner_ctl_sel_analog_service(struct node *node, unsigned me, unsigned
>   	struct cec_msg msg = {};
>   
>   	node->remote[la].bcast_sys = ~0;
> -	for (unsigned sys = 0; sys <= 8; sys++) {
> -		cec_msg_init(&msg, me, la);
> -		cec_msg_select_analogue_service(&msg, CEC_OP_ANA_BCAST_TYPE_CABLE,
> -						7668, sys); // 479.25 MHz analog frequency
> -		fail_on_test(!transmit_timeout(node, &msg));
> -		if (unrecognized_op(&msg))
> -			return NOTSUPPORTED;
> -		if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
> -			info("Tuner supports %s, but cannot select that service.\n",
> -			     bcast_system2s(sys));
> +	for (unsigned type = 0; type < 3; type++) {
> +		for (unsigned sys = 0; sys < 9; sys++) {
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_select_analogue_service(&msg, type, 7668, sys); // 479.25 MHz analog frequency
> +			fail_on_test(!transmit_timeout(node, &msg));

Adding line here will help readability.

> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;

Same here.

> +			if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
> +				info("Tuner supports %s, but cannot select that service.\n",
> +				bcast_system2s(sys));
> +				node->remote[la].bcast_sys = sys;
> +				continue;
> +			}
same here.

> +			if (cec_msg_status_is_abort(&msg))
> +				continue;
> +			info("Tuner supports %s\n", bcast_system2s(sys));
>   			node->remote[la].bcast_sys = sys;
> -			continue;
>   		}
> -		if (cec_msg_status_is_abort(&msg))
> -			continue;
> -		info("Tuner supports %s\n", bcast_system2s(sys));
> -		node->remote[la].bcast_sys = sys;
>   	}
>   
>   	if (node->remote[la].bcast_sys == (__u8)~0)
> @@ -854,43 +873,123 @@ static int tuner_ctl_tuner_dev_status(struct node *node, unsigned me, unsigned l
>   	return 0;
>   }
>   
> -static int tuner_ctl_step_dec(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int tuner_ctl_analog_step_dec(struct node *node, unsigned me, unsigned la, bool interactive)
>   {
>   	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +	__u16 freq = 0;
> +
> +	info.is_analog = true;
> +	for (unsigned type = 0; type < 3; type++) {
> +		for (unsigned sys = 0; sys < 9; sys++) {
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_select_analogue_service(&msg, type, 16000, sys); // 1000 MHz analog frequency
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;

Add a goto NOTSUPPORTED; Makes it easier.
You can simplify this logic a lot.

> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			freq = info.analog.ana_freq;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_tuner_step_decrement(&msg);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			if (cec_msg_status_is_abort(&msg))
> +				return PRESUMED_OK;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			if (!(info.analog.ana_freq < freq))
> +				return FAIL;
> +		}
> +	}
>   
> -	cec_msg_init(&msg, me, la);
> -	cec_msg_tuner_step_decrement(&msg);
> -	fail_on_test(!transmit_timeout(node, &msg));
> -	if (unrecognized_op(&msg))
> -		return NOTSUPPORTED;
> -	if (refused(&msg))
> -		return REFUSED;
> -
> -	return PRESUMED_OK;
> +	return 0;
>   }
>   
> -static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int tuner_ctl_analog_step_inc(struct node *node, unsigned me, unsigned la, bool interactive)
>   {
>   	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +	__u16 freq = 0;
> +
> +	info.is_analog = true;
> +	for (unsigned type = 0; type < 3; type++) {
> +		for (unsigned sys = 0; sys < 9; sys++) {
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_select_analogue_service(&msg, type, 0, sys); // 0 MHz analog frequency
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;

Adding blank lines will improve readability.

> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			freq = info.analog.ana_freq;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_tuner_step_increment(&msg);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;

Same here.

> +			if (refused(&msg))
> +				return REFUSED;
> +			if (cec_msg_status_is_abort(&msg))
> +				return PRESUMED_OK;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			if (!(info.analog.ana_freq > freq))
> +				return FAIL;
> +		}
> +	}
>  
> -	cec_msg_init(&msg, me, la);
> -	cec_msg_tuner_step_increment(&msg);
> -	fail_on_test(!transmit_timeout(node, &msg));
> -	if (unrecognized_op(&msg))
> -		return NOTSUPPORTED;
> -	if (refused(&msg))
> -		return REFUSED;
> -
> -	return PRESUMED_OK;
> +	return 0;
>   }

tuner_ctl_analog_step_inc() and tuner_ctl_analog_step_dec() has lots of
common code. The only real difference is calls to 
cec_msg_tuner_step_increment() vs. cec_msg_tuner_step_decrement()

Also the error logic is very hard to read.

>   
>   static struct remote_subtest tuner_ctl_subtests[] = {
> -	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
> -	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
> -	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
> +	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_give_status },
> +	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_sel_analog_service },
> +	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_sel_digital_service },
>   	{ "Tuner Device Status", CEC_LOG_ADDR_MASK_ALL, tuner_ctl_tuner_dev_status },
> -	{ "Tuner Step Decrement", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_dec },
> -	{ "Tuner Step Increment", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_inc },
> +	{ "Tuner Analog Step Decrement", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_step_dec },
> +	{ "Tuner Analog Step Increment", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_step_inc },
>   };
>   
>   
> 

thanks,
-- Shuah
