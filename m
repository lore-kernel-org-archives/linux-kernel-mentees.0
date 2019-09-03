From: skhan at linuxfoundation.org (Shuah Khan)
Date: Tue, 3 Sep 2019 08:15:02 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] cec-compliance: system audio
 control tests
In-Reply-To: <20190902165920.17812-1-c0d1n61at3@gmail.com>
References: <20190902093346.20041-1-c0d1n61at3@gmail.com>
	<20190902165920.17812-1-c0d1n61at3@gmail.com>
Message-ID: <becde334-cc07-7ecd-3cc3-729b1af56af8@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 9/2/19 10:59 AM, Jiunn Chang wrote:
> Add user control press operands:
>   - Mute Function
>   - Restore Volume Function
> 

Please add more details to the commit message. It would be helpful
to know more about the features that are getting added.

> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
> 
> Changes made since v2:

I assume you meant since v1?

>   - change node->state.mute to boolean
> 
>> 8---------------------------------------------------------------------------8<
> 
>   utils/cec-compliance/cec-test-audio.cpp | 32 +++++++++++++++++++++++++
>   utils/cec-follower/cec-processing.cpp   |  6 +++++
>   2 files changed, 38 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 8611350e..872bb9ad 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -673,6 +673,32 @@ static int sac_user_control_press_mute(struct node *node, unsigned me, unsigned
>   	return 0;
>   }
>   
> +static int sac_user_control_press_mute_function(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	__u8 ret;
> +
> +	if ((ret = sac_util_send_user_control_press(node, me, la, 0x65)))

Would it help to add a define for 0x65 - same comment on other uses
such as 0x66

> +		return ret;
> +	fail_on_test_v2(node->remote[la].cec_version,
> +			la == CEC_LOG_ADDR_AUDIOSYSTEM &&
> +			node->remote[la].mute == CEC_OP_AUD_MUTE_STATUS_ON);
> +
> +	return 0;
> +}
> +
> +static int sac_user_control_press_restore_volume_function(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	__u8 ret;
> +
> +	if ((ret = sac_util_send_user_control_press(node, me, la, 0x66)))

Same here?

> +		return ret;
> +	fail_on_test_v2(node->remote[la].cec_version,
> +			la == CEC_LOG_ADDR_AUDIOSYSTEM &&
> +			node->remote[la].mute == CEC_OP_AUD_MUTE_STATUS_OFF);
> +
> +	return 0;
> +}
> +
>   static int sac_user_control_release(struct node *node, unsigned me, unsigned la, bool interactive)
>   {
>   	struct cec_msg msg = {};
> @@ -763,6 +789,12 @@ struct remote_subtest sac_subtests[] = {
>   	{ "User Control Pressed (Mute)",
>   	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>   	  sac_user_control_press_mute },
> +	{ "User Control Pressed (Restore Volume Function)",
> +	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +	  sac_user_control_press_restore_volume_function },
> +	{ "User Control Pressed (Mute Function)",
> +	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +	  sac_user_control_press_mute_function },
>   	{ "User Control Released",
>   	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>   	  sac_user_control_release },
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 27172560..a38f664b 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -516,6 +516,12 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>   		case 0x43:
>   			node->state.mute = !node->state.mute;
>   			break;

Looks like this is existing usage. Still it would make sense to add
a define for these as self documenting.

> +		case 0x65:
> +			node->state.mute = true;
> +			break;
> +		case 0x66:
> +			node->state.mute = false;
> +			break;
>   		case 0x6B:
>   			if (!enter_standby(node))
>   				exit_standby(node);
> 

thanks,
-- Shuah
