Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA852EB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Jul 2023 09:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 293778145D;
	Mon, 10 Jul 2023 09:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 293778145D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ld7hoDal
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-dq8Id9EGFx; Mon, 10 Jul 2023 09:24:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 27E1781458;
	Mon, 10 Jul 2023 09:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27E1781458
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 108EDC0071;
	Mon, 10 Jul 2023 09:24:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FD03C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 09:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73EBD4053E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 09:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73EBD4053E
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=ld7hoDal
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kPRLzQBg5O-i
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 09:24:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C066440517
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C066440517
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 09:24:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A736260F1B;
 Mon, 10 Jul 2023 09:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F498C433C8;
 Mon, 10 Jul 2023 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688981095;
 bh=gDgDXrT4xu+oFlxoLyT5AijUEFQkMSQUcGHG6LfEkic=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ld7hoDalsbVCM8DI84dvv+pcpsXfZKexstGKRhORmWf8/xJnpFJUBTQZm411qzdGt
 sDRMHVjJz12WY2LyM4dOmnzBN/doR/5OmNeVCVcb0PEuBNPXIcnZ9HDfHGORHW/RoN
 tyv7Z2tNpdFr8s5ynynt6oc1Iu9i9+tMKLhcV+vzX8cbWpLKFDIsoGBRjkUtTi0O94
 DwxetsNWTnIEZ3qbieuVOqzOFEfFWPp+xg3O9loHwbDbUtrvpwlzl5F/3tTk/kOLFj
 V1uAEymafXpfI1wFQE/bRTbETBAPhc0m2FYPF33VknaUPV6JLiZDp7K1GES2DXDNTW
 uL+oFPSiHOjXA==
Message-ID: <1dcd6d8f-f15b-4f71-52a2-3ff48bff7575@kernel.org>
Date: Mon, 10 Jul 2023 11:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] Style error/warning fixes: replacing space with tabs
Content-Language: en-US
To: Prince Kumar Maurya <princekumarmaurya06@gmail.com>,
 gregkh@linuxfoundation.org, raychi@google.com, skhan@linuxfoundation.org
References: <20230709005133.2439465-1-princekumarmaurya06@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230709005133.2439465-1-princekumarmaurya06@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 09/07/2023 02:51, Prince Kumar Maurya wrote:
> Style fixes for warning found using checkpatch.pl script 
> 
> Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
> ---
>  drivers/usb/core/hub.c | 58 +++++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index a739403a9e45..82a7b127a340 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1777,7 +1777,7 @@ static bool hub_descriptor_is_sane(struct usb_host_interface *desc)
>  	if (!usb_endpoint_is_int_in(&desc->endpoint[0].desc))
>  		return false;
>  
> -        return true;
> +		return true;

This does not look like correctly indented.

>  }
>  
>  static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
> @@ -5854,37 +5854,37 @@ static void hub_event(struct work_struct *work)
>  }
>  
>  static const struct usb_device_id hub_id_table[] = {
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> -                   | USB_DEVICE_ID_MATCH_PRODUCT
> -                   | USB_DEVICE_ID_MATCH_INT_CLASS,
> -      .idVendor = USB_VENDOR_SMSC,
> -      .idProduct = USB_PRODUCT_USB5534B,
> -      .bInterfaceClass = USB_CLASS_HUB,
> -      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> -                   | USB_DEVICE_ID_MATCH_PRODUCT,
> -      .idVendor = USB_VENDOR_CYPRESS,
> -      .idProduct = USB_PRODUCT_CY7C65632,
> -      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +			| USB_DEVICE_ID_MATCH_PRODUCT
> +			| USB_DEVICE_ID_MATCH_INT_CLASS,
> +	  .idVendor = USB_VENDOR_SMSC,

Spaces after the tab. Are you sure this does not cause checkpatch
--strict errors?



Best regards,
Krzysztof

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
