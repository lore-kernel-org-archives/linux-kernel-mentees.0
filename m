Return-Path: <SRS0=yLM5=NK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B21C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 18:49:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 673AE610A0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 18:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 673AE610A0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28B3040001;
	Thu, 19 Aug 2021 18:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-oRazc6DkNs; Thu, 19 Aug 2021 18:49:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C2DAA404E2;
	Thu, 19 Aug 2021 18:49:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D651C001A;
	Thu, 19 Aug 2021 18:49:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78F15C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 18:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E82940208
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 18:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZ5XWUdtetAZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 18:49:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB4FA401E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 18:49:45 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so1441698otg.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 11:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wZO4IQUBhF+zViy7c/z72TEVhnsnazrJSkCDX3RnSfk=;
 b=XpvoNNqO5fpuLndPvyQDsbEKlf2t6TEbmSz5IGx0TKWxhXZRUYokx4QLVTmy79isMR
 AYkGMmjxwPxTX2I24mKJy+ji+7uZcQe7FKdIUFB/lAcu5YhQ6jlW0g04fIWxsWcnJuRd
 EJcKLz+fiEeVZ3uzKkVTyhn3pBEy4EdTeoB7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wZO4IQUBhF+zViy7c/z72TEVhnsnazrJSkCDX3RnSfk=;
 b=LUlbDHUeM7DeeSCG8luEh2UObMXTNIkE5uM1800ya1X18AppCuk8L5pvD88NCVfw7q
 xzSf3/kMtnQAcfmIgAWeeXHebC+GqGXIRwRcIQQy1uqG3jyvHAtIODAjXE8YFpsfl2hn
 ldGwKR0nX/NaNhyvZZ9XcDH3irytpjnnaVXLKQAd4b/ffVlYjhybE1qbfRWlFkS4QJwC
 458qWZwQynAEYlQausbQjJBSuzepZche9rguLbLTIhV/B+T1NWRwu4JJPT/x9/skY9RF
 KRXDDRElJ6dy0ap1yU1UaoR2Vh+hkABfnMLNYEaUev0/Z45NvLoxNVVK6d5bL6Y5dQQr
 y7sQ==
X-Gm-Message-State: AOAM530zjAktkfWctIRoP0g0Hs/AM3MF0SYHuxez0RC19+FFBOvQWhjj
 p7vNeYP5FrEkFKTdnZrLHRjTjfAy
X-Google-Smtp-Source: ABdhPJwGWMs9CmtUV/fPZRUmX0o0GPrIgHbgo+fXSJ6pj+cipfWWEk/8/hpw0qy/D12H3XqGTR47pw==
X-Received: by 2002:a05:6830:40b4:: with SMTP id
 x52mr13230648ott.163.1629398984755; 
 Thu, 19 Aug 2021 11:49:44 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id h14sm888563otm.5.2021.08.19.11.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 11:49:44 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] usbip: give back URBs for unsent unlink requests
 during cleanup
To: Anirudh Rayabharam <mail@anirudhrb.com>
References: <20210813182508.28127-1-mail@anirudhrb.com>
 <20210813182508.28127-2-mail@anirudhrb.com>
 <13450a85-bbfe-09c5-d614-1a944c2600c2@linuxfoundation.org>
 <YRydGRdPmOaiMWaY@kroah.com>
 <cb36604b-37f1-c12e-3ebb-cdafd7798dc1@linuxfoundation.org>
 <YR6eQUpoe9cORXGu@anirudhrb.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <78a30ac4-8e18-50cd-cd18-02d8f9868383@linuxfoundation.org>
Date: Thu, 19 Aug 2021 12:49:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YR6eQUpoe9cORXGu@anirudhrb.com>
Content-Language: en-US
Cc: linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
 syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On 8/19/21 12:09 PM, Anirudh Rayabharam wrote:
> On Wed, Aug 18, 2021 at 12:36:11PM -0600, Shuah Khan wrote:
>> On 8/17/21 11:39 PM, Greg KH wrote:
>>> On Tue, Aug 17, 2021 at 05:16:51PM -0600, Shuah Khan wrote:
>>>> On 8/13/21 12:25 PM, Anirudh Rayabharam wrote:
>>>>> In vhci_device_unlink_cleanup(), the URBs for unsent unlink requests are
>>>>> not given back. This sometimes causes usb_kill_urb to wait indefinitely
>>>>> for that urb to be given back. syzbot has reported a hung task issue [1]
>>>>> for this.
>>>>>
>>>>> To fix this, give back the urbs corresponding to unsent unlink requests
>>>>> (unlink_tx list) similar to how urbs corresponding to unanswered unlink
>>>>> requests (unlink_rx list) are given back.
>>>>>
>>>>> [1]: https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76
>>>>>
>>>>> Reported-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
>>>>> Tested-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
>>>>> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
>>>>> ---
>>>>>     drivers/usb/usbip/vhci_hcd.c | 26 ++++++++++++++++++++++++++
>>>>>     1 file changed, 26 insertions(+)
>>>>>
>>>>> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
>>>>> index 4ba6bcdaa8e9..6f3f374d4bbc 100644
>>>>> --- a/drivers/usb/usbip/vhci_hcd.c
>>>>> +++ b/drivers/usb/usbip/vhci_hcd.c
>>>>> @@ -957,8 +957,34 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
>>>>>     	spin_lock(&vdev->priv_lock);
>>>>>     	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
>>>>> +		struct urb *urb;
>>>>> +
>>>>> +		/* give back URB of unsent unlink request */
>>>>>     		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);
>>>>
>>>> I know this is an exiting one.
>>>> Let's make this pr_debug or remove it all together.
>>>>
>>>>> +
>>>>> +		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
>>>>> +		if (!urb) {
>>>>> +			pr_info("the urb (seqnum %lu) was already given back\n",
>>>>> +				unlink->unlink_seqnum);
>>>>
>>>> Let's make this pr_debug or remove it all together.
>>>
>>> As you have a struct device for all of these, please use dev_dbg() and
>>> friends, not pr_*(), for all of these.
>>>
>>
>> Yes. Makes perfect sense.
> 
> Perhaps we should use usbip_dbg_vhci_hc() instead of dev_dbg()? It is
> one of the custom macros defined by the usbip driver for printing debug
> logs.
> 

Yes that macro could be used. However, let's just get rid of the messages.
I don't see much use for them.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
