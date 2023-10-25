Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19B7C0032E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Oct 2023 12:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CEB640933;
	Wed, 25 Oct 2023 12:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CEB640933
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=iC5fz81z
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyeA-fPfAbTO; Wed, 25 Oct 2023 12:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3B51340860;
	Wed, 25 Oct 2023 12:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B51340860
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26CCCC0071;
	Wed, 25 Oct 2023 12:57:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82E2BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 12:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DD7640932
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 12:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD7640932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rrSf7OfY9sX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 12:57:31 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 25 Oct 2023 12:57:31 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8604540860
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8604540860
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 12:57:31 +0000 (UTC)
Received: from [192.168.1.110] (unknown [103.251.226.9])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43D8F669;
 Wed, 25 Oct 2023 14:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698238208;
 bh=oYH78xkq3rGNll3M+52mpCZCqakXLm41mfL1RQ7j0So=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iC5fz81zlp9L+pLFAUdNzs5GFrC8xQoLwHWFLKiEOkoU6qwk/wm8lXydDhNdCm0lZ
 KUHdjuLi46L2jyZTwFwBerKMZSgrq+oB7U3PWWQ8Wq0tC9Hv5aRwgbqUoDqkjrcGmB
 vcn3J2nACWElO97WmwkDyhOQfk9GjzKArdDp1EG0=
Message-ID: <92b54548-6276-29c3-01af-80136c28da0c@ideasonboard.com>
Date: Wed, 25 Oct 2023 18:20:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] staging: vc04_services: use snprintf instead of sprintf
Content-Language: en-US
To: "Ricardo B. Marliere" <ricardo@marliere.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Stefan Wahren <stefan.wahren@i2se.com>, Peter Zijlstra
 <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>
References: <20231025122632.307385-4-ricardo@marliere.net>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20231025122632.307385-4-ricardo@marliere.net>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Ricardo,

Thank you for the patch

On 10/25/23 5:56 PM, Ricardo B. Marliere wrote:
> All the occurrences of sprintf usage under vc04_services can be safely
> replaced by snprintf, so as to avoid any possible overflow.
>
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Suggested-by: Umang Jain <umang.jain@ideasonboard.com>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

LGTM,

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>   .../bcm2835-camera/bcm2835-camera.c              |  2 +-
>   .../interface/vchiq_arm/vchiq_arm.c              | 16 ++++++++--------
>   2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index e860fb89d42e..e6e89784d84b 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -855,7 +855,7 @@ static int vidioc_enum_input(struct file *file, void *priv,
>   		return -EINVAL;
>   
>   	inp->type = V4L2_INPUT_TYPE_CAMERA;
> -	sprintf((char *)inp->name, "Camera %u", inp->index);
> +	snprintf((char *)inp->name, sizeof(inp->name), "Camera %u", inp->index);
>   	return 0;
>   }
>   
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index de6a24304a4d..9fb8f657cc78 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1451,12 +1451,12 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>   	}
>   
>   	if (use_type == USE_TYPE_VCHIQ) {
> -		sprintf(entity, "VCHIQ:   ");
> +		snprintf(entity, sizeof(entity), "VCHIQ:   ");
>   		entity_uc = &arm_state->peer_use_count;
>   	} else if (service) {
> -		sprintf(entity, "%p4cc:%03d",
> -			&service->base.fourcc,
> -			service->client_id);
> +		snprintf(entity, sizeof(entity), "%p4cc:%03d",
> +			 &service->base.fourcc,
> +			 service->client_id);
>   		entity_uc = &service->service_use_count;
>   	} else {
>   		vchiq_log_error(state->dev, VCHIQ_SUSPEND, "%s null service ptr", __func__);
> @@ -1506,12 +1506,12 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
>   	}
>   
>   	if (service) {
> -		sprintf(entity, "%p4cc:%03d",
> -			&service->base.fourcc,
> -			service->client_id);
> +		snprintf(entity, sizeof(entity), "%p4cc:%03d",
> +			 &service->base.fourcc,
> +			 service->client_id);
>   		entity_uc = &service->service_use_count;
>   	} else {
> -		sprintf(entity, "PEER:   ");
> +		snprintf(entity, sizeof(entity), "PEER:   ");
>   		entity_uc = &arm_state->peer_use_count;
>   	}
>   

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
