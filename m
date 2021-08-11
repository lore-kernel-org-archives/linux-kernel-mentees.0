Return-Path: <SRS0=y1cr=NC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC080C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 21:51:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4066C60F11
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 21:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4066C60F11
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D857983AA2;
	Wed, 11 Aug 2021 21:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgYvNoMlTpJr; Wed, 11 Aug 2021 21:51:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2B6B183AA1;
	Wed, 11 Aug 2021 21:51:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 039DEC0010;
	Wed, 11 Aug 2021 21:51:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 119FBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 21:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E137740380
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 21:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5hIsqarkwtwz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 21:51:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41E9840343
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 21:51:31 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id e186so5549516iof.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 14:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NDY3e3hvMMuACrvyJvVS5tnQjqvXWCGs0aykP4KiZr0=;
 b=iZfzWcgiTCal7Yu0bEFP447h2yN6WRcbTDrrdtt4Dzlrf59ZpwDgEag0juTP4Gy85H
 XLKrjm5KTtLonpXyz/kKW+GYvc94ioyB3rpy8dYsziEwq/swAC+s7NFWUaKGAtjuwEkU
 f35M8KhWI9PFAFSP4jekGxiLmxeQRFagop7Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NDY3e3hvMMuACrvyJvVS5tnQjqvXWCGs0aykP4KiZr0=;
 b=dIeFwbbllmA5XQsh98DEVVW9P/S6dXPRleKj8OulT/uePdnQI9zvxKTdJWUMbGdUWM
 Zl6POmWK6qakDUpJNPkWExMtw8adiAh7xwo3NWiXXrLbb1xFGaSudHOHJTu7VOkTVasD
 txL2Ys80yP7IclAHsr+ofdNo/o0Mz5ZtSz5jBfA87RUk4ldWqAwsF8xiVqqISL+ibhCG
 ko4R/Bj6p5IzJTi6uFKNuj+Icl4bdABkYPUnOclOeHJ3ENf5N03bKimZy9b+KBMN7nFp
 udhDMTw0r1iNuZi7vfZ4tx4iVPH4HHAlaRpAeqz3R6YL+W7JXy9n6QK/qdFH6fiBekO5
 cgxw==
X-Gm-Message-State: AOAM533EnYN2Gsb7+BJbXG9+U1rgqnxhoCWVzDOUx/xE9mNRCx6veeID
 d68GsuXgcHSywkqTdqsjTuiRVANl
X-Google-Smtp-Source: ABdhPJyweaj8KxWG6YukyZ9RSua4HrYmFmG+Of0+/O01uqaZBEqoLmUWi67vphDUuR0PkkkZJ91dxA==
X-Received: by 2002:a02:a40f:: with SMTP id c15mr874383jal.38.1628718690324;
 Wed, 11 Aug 2021 14:51:30 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id a11sm284402ilf.79.2021.08.11.14.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 14:51:29 -0700 (PDT)
Subject: Re: [PATCH v2] usbip: give back URBs for unsent unlink requests
 during cleanup
To: Anirudh Rayabharam <mail@anirudhrb.com>
References: <20210806181335.2078-1-mail@anirudhrb.com>
 <4aaf420d-e85e-212e-3bc4-a70e016de610@linuxfoundation.org>
 <YRPXnzpyHETZ9bn2@anirudhrb.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4af0d8b6-c0c8-9e49-68ed-90bac5e16966@linuxfoundation.org>
Date: Wed, 11 Aug 2021 15:51:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YRPXnzpyHETZ9bn2@anirudhrb.com>
Content-Language: en-US
Cc: linux-usb@vger.kernel.org, Valentina Manea <valentina.manea.m@gmail.com>,
 linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 8/11/21 7:58 AM, Anirudh Rayabharam wrote:
> On Tue, Aug 10, 2021 at 05:25:51PM -0600, Shuah Khan wrote:
>> On 8/6/21 12:13 PM, Anirudh Rayabharam wrote:
>>> In vhci_device_unlink_cleanup(), the URBs for unsent unlink requests are
>>> not given back. This sometimes causes usb_kill_urb to wait indefinitely
>>> for that urb to be given back. syzbot has reported a hung task issue [1]
>>> for this.
>>>
>>> To fix this, give back the urbs corresponding to unsent unlink requests
>>> (unlink_tx list) similar to how urbs corresponding to unanswered unlink
>>> requests (unlink_rx list) are given back. Since the code is almost the
>>> same, extract it into a new function and call it for both unlink_rx and
>>> unlink_tx lists.
>>>
>>
>> Let's not do the refactor - let's first fix the problem and then the refactor.
> 
> Sure, I will make it a two patch series where the first one fixes the
> problem and the second one does the refactor.
> 
>>
>>> [1]: https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76
>>>
>>> Reported-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
>>> Tested-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
>>> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
>>> ---
>>>
>>> Changes in v2:
>>> Use WARN_ON() instead of BUG() when unlink_list is neither unlink_tx nor
>>> unlink_rx.
>>>
>>> v1: https://lore.kernel.org/lkml/20210806164015.25263-1-mail@anirudhrb.com/
>>>
>>> ---
>>>    drivers/usb/usbip/vhci_hcd.c | 45 +++++++++++++++++++++++++-----------
>>>    1 file changed, 32 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
>>> index 4ba6bcdaa8e9..67e638f4c455 100644
>>> --- a/drivers/usb/usbip/vhci_hcd.c
>>> +++ b/drivers/usb/usbip/vhci_hcd.c
>>> @@ -945,7 +945,8 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
>>>    	return 0;
>>>    }
>>> -static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
>>> +static void __vhci_cleanup_unlink_list(struct vhci_device *vdev,
>>> +		struct list_head *unlink_list)
>>>    {
>>>    	struct vhci_hcd *vhci_hcd = vdev_to_vhci_hcd(vdev);
>>>    	struct usb_hcd *hcd = vhci_hcd_to_hcd(vhci_hcd);
>>> @@ -953,23 +954,23 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
>>>    	struct vhci_unlink *unlink, *tmp;
>>>    	unsigned long flags;
>>> +	if (WARN(unlink_list != &vdev->unlink_tx
>>> +				&& unlink_list != &vdev->unlink_rx,
>>> +			"Invalid list passed to __vhci_cleanup_unlink_list\n"))
>>> +		return;
>>> +
>>
>> With this change, this will be only place unlink_rx is used without
>> vdev->priv_lock hold? Please explain why this is safe.
> 
> Well, this doesn't read or modify the contents of unlink_rx and unlink_tx.
> So, it looks safe to me. Let me know if I'm missing something here.
> 
>>
>>>    	spin_lock_irqsave(&vhci->lock, flags);
>>>    	spin_lock(&vdev->priv_lock);
>>> -	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
>>> -		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);
>>> -		list_del(&unlink->list);
>>> -		kfree(unlink);
>>> -	}
>>> -
>>> -	while (!list_empty(&vdev->unlink_rx)) {
>>> +	list_for_each_entry_safe(unlink, tmp, unlink_list, list) {
>>>    		struct urb *urb;
>>> -		unlink = list_first_entry(&vdev->unlink_rx, struct vhci_unlink,
>>> -			list);
>>> -
>>> -		/* give back URB of unanswered unlink request */
>>> -		pr_info("unlink cleanup rx %lu\n", unlink->unlink_seqnum);
>>> +		if (unlink_list == &vdev->unlink_tx)
>>> +			pr_info("unlink cleanup tx %lu\n",
>>> +					unlink->unlink_seqnum);
>>> +		else
>>> +			pr_info("unlink cleanup rx %lu\n",
>>> +					unlink->unlink_seqnum);
>>>    		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
>>>    		if (!urb) {
>>> @@ -1001,6 +1002,24 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
>>>    	spin_unlock_irqrestore(&vhci->lock, flags);
>>>    }
>>> +static inline void vhci_cleanup_unlink_tx(struct vhci_device *vdev)
>>> +{
>>> +	__vhci_cleanup_unlink_list(vdev, &vdev->unlink_tx);
>>
>> With this change, this will be only place unlink_rx is used without
>> vdev->priv_lock hold? Please explain why this is safe.
>>
>>> +}
>>> +
>>
>> Is there a need for this layer?
>>
>>> +static inline void vhci_cleanup_unlink_rx(struct vhci_device *vdev)
>>> +{
>>> +	__vhci_cleanup_unlink_list(vdev, &vdev->unlink_rx);
>>
>> With this change, this will be only place unlink_rx is used without
>> vdev->priv_lock hold? Please explain why this is safe.
>>
>>> +}
>>> +
>> Is there a need for this layer?
> 
> I added these wrappers purely for convenience. There is no other purpose.
> Would you prefer this patch without the wrappers?
> 

Yes. Prefer it without the wrappers. When you take the wrappers
out, I think the unlink_rx could be within spinlock hold easily.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
