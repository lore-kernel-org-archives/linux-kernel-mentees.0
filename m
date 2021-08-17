Return-Path: <SRS0=4CcE=NI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DE2C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 23:17:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB9561008
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 23:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FB9561008
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00631401E9;
	Tue, 17 Aug 2021 23:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fC7RwdO7g989; Tue, 17 Aug 2021 23:17:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 853DD40019;
	Tue, 17 Aug 2021 23:17:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6048DC0010;
	Tue, 17 Aug 2021 23:17:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4698EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 23:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 221CF60764
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 23:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQY5rZGvSLTj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 23:16:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A22CA60683
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 23:16:54 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id b7so273542iob.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 16:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KPiGFxgVvYUbWABlVl43nzVqjuIo6MdwTPCZgQTNlrY=;
 b=diWvOr0feVT+pBD+17kbknG8z4+nNaij0fI9QAcAJfayqyHUARSwxacULzfqTEmhyY
 /3y/xTXMiX/1zCwAUBH8IgkY8HMQE+GGdlxSFTubMUKo+pFrvWssUolP5i7LCZVaSBLo
 dhvpU8LgwVbyXgu7dmlPcUhubapa+1EloFapo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KPiGFxgVvYUbWABlVl43nzVqjuIo6MdwTPCZgQTNlrY=;
 b=eiP0g1UbvKw7Hv1Ae9XuTGA6DuiquZiNAIe/9UOiWxZW8lXYTY3I/DoFMvecSV4H9Q
 jYk4+1YHmlH6lP/d1NRu3m9nK4b1+xdo1VG6xNsNK6P8tjVq27AmYigy+gxwnD7/KJzx
 5yXf0+gaOn53o4wFuKXMES0kFX1G0NHhnzKLjutdf6I64kcgI9KC6EuqArVdVe53kDIn
 gN1ym/ZNkJpLM71nuh2wsk4FfI1/Az1K2cY8wxAjOhCBKZsL5luqva6VwgNTrfQfnn0c
 zVzfyiDdXL69z/6fEAJk3zLMVBuWrmcvanH7HzSH31jr9rv0ZcmGINOYtUp2rbxq9Mdc
 lcVw==
X-Gm-Message-State: AOAM533ddxPVluiqnAXXzX53esKR5fAe6vuPLZ9nw/tVxDVOEd7TYeFy
 Hge7QSqn/+yjM+8ikk+SqCtDaPei
X-Google-Smtp-Source: ABdhPJyUfXRVJnTRnqD4Y9708QJyzwk5eLnG8hTD687kbELpgq67QJZ7eQ21IosoiZshZ4q43y/QAg==
X-Received: by 2002:a5d:928c:: with SMTP id s12mr4727597iom.151.1629242213221; 
 Tue, 17 Aug 2021 16:16:53 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id k7sm1845089iok.22.2021.08.17.16.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 16:16:52 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] usbip: give back URBs for unsent unlink requests
 during cleanup
To: Anirudh Rayabharam <mail@anirudhrb.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, gregkh@linuxfoundation.org
References: <20210813182508.28127-1-mail@anirudhrb.com>
 <20210813182508.28127-2-mail@anirudhrb.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <13450a85-bbfe-09c5-d614-1a944c2600c2@linuxfoundation.org>
Date: Tue, 17 Aug 2021 17:16:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210813182508.28127-2-mail@anirudhrb.com>
Content-Language: en-US
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
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

On 8/13/21 12:25 PM, Anirudh Rayabharam wrote:
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
>   drivers/usb/usbip/vhci_hcd.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 4ba6bcdaa8e9..6f3f374d4bbc 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -957,8 +957,34 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
>   	spin_lock(&vdev->priv_lock);
>   
>   	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
> +		struct urb *urb;
> +
> +		/* give back URB of unsent unlink request */
>   		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);

I know this is an exiting one.
Let's make this pr_debug or remove it all together.

> +
> +		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
> +		if (!urb) {
> +			pr_info("the urb (seqnum %lu) was already given back\n",
> +				unlink->unlink_seqnum);

Let's make this pr_debug or remove it all together.

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

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
