Return-Path: <SRS0=WoZ7=NO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC631C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 22:20:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5263361371
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 22:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5263361371
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13F216073D;
	Mon, 23 Aug 2021 22:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zobYfDjrLPa; Mon, 23 Aug 2021 22:20:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 83A8F60692;
	Mon, 23 Aug 2021 22:20:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57B04C0010;
	Mon, 23 Aug 2021 22:20:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 579F1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 22:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41BE980CFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 22:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IplvlIshfwYc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 22:20:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9D3680D20
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 22:20:36 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so40512298otk.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 15:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XLNuiyO0cubs0wSKnZ64iacT0nPi9HeH2VX3WhJVa9s=;
 b=f38ETai0cYaZBAw/rO1nnWwVuz1CF2Mw/JxK05NrCh4O2GFc29TLhLU4Ahk+H6bqGS
 2pluz27ZfIM9HU/aYJ8/j45EAioAumLCfjBVfKGSpBJnibI5ijNqEqbQ0aYTAautEgLv
 N9gUTf7sKYP0D2tYjQkQJLcem6RIpxONBPnyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XLNuiyO0cubs0wSKnZ64iacT0nPi9HeH2VX3WhJVa9s=;
 b=QhKUbTcCO7xeYeQjkh+3PbkB21RUPvHB0WbY1sJFNN5DmWHyr2Eie+sclgXfjGjUbS
 SknIuxjuQmkSC4ir/lx7AeiWaE4dSsQrT8LQL8g9llSAoQks373qksQ10whzCGuOoAPX
 bkTvVOA5wigPtnb/3XLyg0s0nrH6Cn+72xY5I5IRg+uZkiicpEFehoZLb/SpAyjeBbUS
 L3Du/yHGc4VcBhqOAnO4nhCOqwBLuMAOCBdQSGzUWLFV024t/AbBqMFfsRI5kV5Cy9bz
 1lJmx6ORZUYWEj2XPZ3hPQ9ZXgwUTsrIbZfVy+u293MnsKivdX5cz6QU4sP3z3L9sFRD
 j90g==
X-Gm-Message-State: AOAM533KGz6IvojqgM41rfSkQJy0ujXlPtvtdfigEBhSwaAlfksWLZrr
 6LF2IuPNrR8qtu87dlbzR6yeXbsp
X-Google-Smtp-Source: ABdhPJwJf/JH/tr1Fw7ldmEMxlsLySn+Dxg0fP7oLl6RJ/A1LoqNzHobZpsRhUS2MTX3LT4GBKdVJw==
X-Received: by 2002:a05:6808:d53:: with SMTP id
 w19mr605807oik.135.1629757235777; 
 Mon, 23 Aug 2021 15:20:35 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id e11sm1288720oiw.18.2021.08.23.15.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 15:20:35 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] usbip: give back URBs for unsent unlink requests
 during cleanup
To: Anirudh Rayabharam <mail@anirudhrb.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210820190122.16379-1-mail@anirudhrb.com>
 <20210820190122.16379-2-mail@anirudhrb.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8fe11b13-58b4-e696-1727-6bd8226b67f9@linuxfoundation.org>
Date: Mon, 23 Aug 2021 16:20:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210820190122.16379-2-mail@anirudhrb.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On 8/20/21 1:01 PM, Anirudh Rayabharam wrote:
> In vhci_device_unlink_cleanup(), the URBs for unsent unlink requests are
> not given back. This sometimes causes usb_kill_urb to wait indefinitely
> for that urb to be given back. syzbot has reported a hung task issue [1]
> for this.
> 
> To fix this, give back the urbs corresponding to unsent unlink requests
> (unlink_tx list) similar to how urbs corresponding to unanswered unlink
> requests (unlink_rx list) are given back.
> 
> [1]: https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76
> 
> Reported-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
> Tested-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>   drivers/usb/usbip/vhci_hcd.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 4ba6bcdaa8e9..190bd3d1c1f0 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -957,8 +957,32 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
>   	spin_lock(&vdev->priv_lock);
>   
>   	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
> +		struct urb *urb;
> +
> +		/* give back urb of unsent unlink request */
>   		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);
> +
> +		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
> +		if (!urb) {
> +			list_del(&unlink->list);
> +			kfree(unlink);
> +			continue;
> +		}
> +
> +		urb->status = -ENODEV;
> +
> +		usb_hcd_unlink_urb_from_ep(hcd, urb);
> +
>   		list_del(&unlink->list);
> +
> +		spin_unlock(&vdev->priv_lock);
> +		spin_unlock_irqrestore(&vhci->lock, flags);
> +
> +		usb_hcd_giveback_urb(hcd, urb, urb->status);
> +
> +		spin_lock_irqsave(&vhci->lock, flags);
> +		spin_lock(&vdev->priv_lock);
> +
>   		kfree(unlink);
>   	}
>   
> 

Looks good.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
