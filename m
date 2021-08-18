Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F3AC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 18:36:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC73060F39
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 18:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC73060F39
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86AA840293;
	Wed, 18 Aug 2021 18:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0H-mgXR8K0q; Wed, 18 Aug 2021 18:36:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AF31F40271;
	Wed, 18 Aug 2021 18:36:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 853DFC0010;
	Wed, 18 Aug 2021 18:36:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFA54C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 18:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C772A40271
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 18:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tm7RuHy8HwMs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 18:36:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 477C940027
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 18:36:14 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id w6so4650437oiv.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 11:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B0HrW3j8Fnyw72AqWx3TFUtOK4uhUpvaY9gIMxzxuIU=;
 b=hfBxFw/TnfJ8Q74TdotNtucJRO5iThq4zbBYJNQvrSt9UJbNIvSi7KPr3ZLBoVcvTf
 Ja2MQggiRk+lmcrQjPrvC/gqgcGl2hziLZToc5mYMndIs0TWkfxteNRYponSEg3o/4Qj
 U3x1CN3O0z+4mO/ehfurr3u2f17gcc6uAVMQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B0HrW3j8Fnyw72AqWx3TFUtOK4uhUpvaY9gIMxzxuIU=;
 b=eHztu3nQG64lUzzt6G+Ee9eyu9M+izMnpEZxyLM0xoTkRagLDQG231jSpJlhNdj/Oj
 zk1MPaU42bfvhiBV/LZfHa/W+y1ht7jScCHkdiMbcwEtRJZ2bLpFPXmYeq+Ojak1WWDW
 VKgAqayfl6kVl8R065h9XxrCWpQkykXxGgKQJHa75R7porZ1dzkDi+4R9PRqso/29+e9
 ObfmT5akCp5VAS85ay0Yp6Bi3NZCHfS60dHy/W5rxdU0kIq6uADAb0FquueODrOdrkni
 eEEbcc05UT/aCSk+ucNX+1W6aovRIhiP8QlsITXTcXc+wF/wAhIZRZHpHVVeWSWwLbP8
 M8lA==
X-Gm-Message-State: AOAM532EMdguwqqjUq34Fmm5gDI+zxeQ0rUBVp2nfs++TW/0eXdh4OMC
 dB1Ipq2A7lvKpI33IoZ3WuMmB+Q4
X-Google-Smtp-Source: ABdhPJzv/vbVL6GJH4+87n+W0NlAqUCmVyKVjAYZEem9rXkxFaZSyPC2dgpiXaHDSbcM9qFY7BsluQ==
X-Received: by 2002:aca:1703:: with SMTP id j3mr8277516oii.116.1629311773372; 
 Wed, 18 Aug 2021 11:36:13 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id j6sm113586ooj.11.2021.08.18.11.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 11:36:12 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] usbip: give back URBs for unsent unlink requests
 during cleanup
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210813182508.28127-1-mail@anirudhrb.com>
 <20210813182508.28127-2-mail@anirudhrb.com>
 <13450a85-bbfe-09c5-d614-1a944c2600c2@linuxfoundation.org>
 <YRydGRdPmOaiMWaY@kroah.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <cb36604b-37f1-c12e-3ebb-cdafd7798dc1@linuxfoundation.org>
Date: Wed, 18 Aug 2021 12:36:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YRydGRdPmOaiMWaY@kroah.com>
Content-Language: en-US
Cc: shuah@kernel.org, linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
 syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On 8/17/21 11:39 PM, Greg KH wrote:
> On Tue, Aug 17, 2021 at 05:16:51PM -0600, Shuah Khan wrote:
>> On 8/13/21 12:25 PM, Anirudh Rayabharam wrote:
>>> In vhci_device_unlink_cleanup(), the URBs for unsent unlink requests are
>>> not given back. This sometimes causes usb_kill_urb to wait indefinitely
>>> for that urb to be given back. syzbot has reported a hung task issue [1]
>>> for this.
>>>
>>> To fix this, give back the urbs corresponding to unsent unlink requests
>>> (unlink_tx list) similar to how urbs corresponding to unanswered unlink
>>> requests (unlink_rx list) are given back.
>>>
>>> [1]: https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76
>>>
>>> Reported-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
>>> Tested-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
>>> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
>>> ---
>>>    drivers/usb/usbip/vhci_hcd.c | 26 ++++++++++++++++++++++++++
>>>    1 file changed, 26 insertions(+)
>>>
>>> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
>>> index 4ba6bcdaa8e9..6f3f374d4bbc 100644
>>> --- a/drivers/usb/usbip/vhci_hcd.c
>>> +++ b/drivers/usb/usbip/vhci_hcd.c
>>> @@ -957,8 +957,34 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
>>>    	spin_lock(&vdev->priv_lock);
>>>    	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
>>> +		struct urb *urb;
>>> +
>>> +		/* give back URB of unsent unlink request */
>>>    		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);
>>
>> I know this is an exiting one.
>> Let's make this pr_debug or remove it all together.
>>
>>> +
>>> +		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
>>> +		if (!urb) {
>>> +			pr_info("the urb (seqnum %lu) was already given back\n",
>>> +				unlink->unlink_seqnum);
>>
>> Let's make this pr_debug or remove it all together.
> 
> As you have a struct device for all of these, please use dev_dbg() and
> friends, not pr_*(), for all of these.
> 

Yes. Makes perfect sense.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
