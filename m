From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Tue, 17 Sep 2019 14:48:16 +0200
Subject: [Linux-kernel-mentees] [PATCH] cec-follower: add tuner analog
	service emulation
In-Reply-To: <20190917094327.51804-1-c0d1n61at3@gmail.com>
References: <20190917094327.51804-1-c0d1n61at3@gmail.com>
Message-ID: <e0e16d91-eae1-0f43-8d40-c0a1f8ea1536@xs4all.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190917124816.SpwRmJ_gMaugUPWj7YcjAyOyEEEY8IAV-0AS3S8CndI@z>

On 9/17/19 11:43 AM, Jiunn Chang wrote:
> Implement the following tuner control features:
>  - <Select Analogue Service>
>  - <Give Tuner Device Status> and reply <Tuner Device Status>
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  utils/cec-follower/cec-tuner.cpp | 51 ++++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index 912adcb9..ed198ac8 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -87,6 +87,28 @@ static unsigned int analog_freqs_khz[3][9][3] =
>  	}
>  };
>  
> +static struct cec_op_tuner_device_info tuner_dev_info = {};

This shouldn't be a global, instead add it to struct state (cec-follower.h).
That way the complete state of the follower is in a single place.

> +
> +static void set_analog_channel_freq(const unsigned int ana_freq_khz) {

It is never needed to add const to an int argument.

And { should be on the next line.

> +	tuner_dev_info.analog.ana_freq = (ana_freq_khz * 10) / 625;
> +}
> +
> +static bool set_analog_tuner_dev_info(const struct cec_msg *msg)
> +{
> +	tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
> +	tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
> +	tuner_dev_info.is_analog = true;
> +	cec_ops_select_analogue_service(msg,
> +					&tuner_dev_info.analog.ana_bcast_type,
> +					&tuner_dev_info.analog.ana_freq,
> +					&tuner_dev_info.analog.bcast_system);
> +	if (tuner_dev_info.analog.ana_bcast_type > 2 ||
> +	    tuner_dev_info.analog.bcast_system > 8)
> +		return false;
> +	set_analog_channel_freq(analog_freqs_khz[1][tuner_dev_info.analog.bcast_system][tuner_dev_info.analog.ana_bcast_type]);

Shouldn't this be

set_analog_channel_freq(analog_freqs_khz[tuner_dev_info.analog.bcast_type][tuner_dev_info.analog.ana_bcast_type][1]);

Rather than using the middle frequency, find the frequency that's closest to
the requested frequency.

Update tuner_dev_info.analog.ana_freq with that new frequency so that this is stored
in the state.

> +	return true;
> +}
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>  {
>  	switch (msg.msg[1]) {
> @@ -101,29 +123,34 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		*/
>  
>  	case CEC_MSG_GIVE_TUNER_DEVICE_STATUS: {
> -		if (!cec_has_tuner(1 << me))
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
>  			break;
>  
> -		struct cec_op_tuner_device_info tuner_dev_info = {};
> -
>  		cec_msg_set_reply_to(&msg, &msg);
> -		tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
> -		tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_NONE;
> -		tuner_dev_info.is_analog = false;
> -		tuner_dev_info.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
> -		tuner_dev_info.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C;
> -		tuner_dev_info.digital.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
> -		tuner_dev_info.digital.channel.minor = 1;
> -
>  		cec_msg_tuner_device_status(&msg, &tuner_dev_info);
>  		transmit(node, &msg);
>  		return;
>  	}
> -

Spurious line deletion.

>  	case CEC_MSG_TUNER_DEVICE_STATUS:
>  		return;
>  
>  	case CEC_MSG_SELECT_ANALOGUE_SERVICE:
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
> +			break;
> +
> +		if (tuner_dev_info.rec_flag == CEC_OP_REC_FLAG_USED) {
> +			msg.msg[1] = CEC_MSG_FEATURE_ABORT;
> +			msg.msg[2] = CEC_OP_ABORT_REFUSED;
> +			transmit(node, &msg);

Use the reply_feature_abort() function from cec-processing.cpp for this.

> +			return;
> +		}
> +		if (!set_analog_tuner_dev_info(&msg)) {
> +			msg.msg[1] = CEC_MSG_FEATURE_ABORT;
> +			msg.msg[2] = CEC_OP_ABORT_INVALID_OP;
> +			transmit(node, &msg);
> +			return;
> +		}
> +		return;

Add a newline here.

>  	case CEC_MSG_SELECT_DIGITAL_SERVICE:
>  	case CEC_MSG_TUNER_STEP_DECREMENT:
>  	case CEC_MSG_TUNER_STEP_INCREMENT:
> 

Regards,

	Hans
