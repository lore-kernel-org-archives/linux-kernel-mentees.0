Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B404C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 12:46:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1BE2207E8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 12:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9aH34y8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1BE2207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 44DCC882FC;
	Fri, 16 Oct 2020 12:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDAHNX56pN+N; Fri, 16 Oct 2020 12:46:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9E2B68823D;
	Fri, 16 Oct 2020 12:46:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91300C07FF;
	Fri, 16 Oct 2020 12:46:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FC11C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 12:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 656CD8829D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 12:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNU6S6WQ4Dr7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 12:46:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 25DC38823D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 12:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602852363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wF22TtTg52My8GhCH0JEYZmjtj4vDtDc64Kh1Nwbn8=;
 b=Q9aH34y8gGbejbvleKT6vXY9lbBca1XGinD/2Us08zh/jfwmPlOZrmXr5LkYwaNYQIS/B9
 TYcfsN+gpT2Ox6+oqabvzbXvAYIzTiDR2nXo2PAZvyNYl9YkcSVAFmd2M/yfGCX/AKC/VZ
 b5uO4Ei3TjCAEi82TrE/vxiewJevxD4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-N5T2FGs3PhqOyPsXHt9vJA-1; Fri, 16 Oct 2020 08:46:01 -0400
X-MC-Unique: N5T2FGs3PhqOyPsXHt9vJA-1
Received: by mail-ej1-f69.google.com with SMTP id gh22so916920ejb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 05:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7wF22TtTg52My8GhCH0JEYZmjtj4vDtDc64Kh1Nwbn8=;
 b=cfIyQ9Mxv2+8R4r8liNPQsKreK8b2rSF0zZSQCGKx5oLJf8G8DO9Vo75GmODPPYgj0
 dkB5WQCEMmz7nb5hA5M80cWd5emQ/9M5D3IS4ITY+rQmVMrcmqJFWfzKZTm673aPIKWR
 NR+delDr5XvtSNiybD6zVsXaX/NVPu/3eEYzki2y57u1smRBPUeSo520JY3MQLHukf0E
 2urXwedQ7wk4hkQclTg5YTW5PXO/VXXILityFTflQvkWIYYcvBPMzYYDsN0fijp+Y6U4
 FcGBfO+HxHyMcj2JnloYODnZblHAopiEkR5Au29hE3WHEdBlCodvxSDKYvmTZu0n40LC
 zjbA==
X-Gm-Message-State: AOAM5322ito9aAIg4VNV1ZGLxvxcyN3Sw5fiSHNKif1/3eEbtymNBnkZ
 OdQh0+sp5/Wqg63s+iI5Evasf/ft3VN55i/NAp2mo3e9NX1vvhRXe2DNuNSEur7bxrmxxnouNbJ
 wQLX5NoEZwmaSWeiu7vSMV8CitLeXU6L59RkKhIokiJfVKv2s
X-Received: by 2002:a50:a452:: with SMTP id v18mr3558746edb.143.1602852360549; 
 Fri, 16 Oct 2020 05:46:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxugyAIP9+8mi74NlTjuPZGUD97J50mq+5lrgMH6SXx3HSGmqYhS1uys0MlOWVLz+5l4KUX+g==
X-Received: by 2002:a50:a452:: with SMTP id v18mr3558722edb.143.1602852360301; 
 Fri, 16 Oct 2020 05:46:00 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id t25sm1345815edt.24.2020.10.16.05.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 05:45:59 -0700 (PDT)
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
References: <20201007034803.7554-1-anant.thazhemadam@gmail.com>
 <2a79ece2-c63b-a881-bc19-65b59952344f@redhat.com>
 <dfa15c3a-6081-1072-8c73-ecebc983643d@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d07b1280-7b5f-f0fd-2892-a89a95712c9b@redhat.com>
Date: Fri, 16 Oct 2020 14:45:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <dfa15c3a-6081-1072-8c73-ecebc983643d@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] bluetooth: hci_h5: fix memory
	leak in h5_close
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

Hi,

On 10/16/20 1:55 PM, Anant Thazhemadam wrote:
> 
> Hi,
> 
> On 16/10/20 4:58 pm, Hans de Goede wrote:
>> Hi,
>>
>> On 10/7/20 5:48 AM, Anant Thazhemadam wrote:
>>> If h5_close is called when !hu->serdev, h5 is directly freed.
>>> However, h5->rx_skb is not freed, which causes a memory leak.
>>>
>>> Freeing h5->rx_skb fixes this memory leak.
>>>
>>> In case hu->serdev exists, h5->rx_skb is then set to NULL,
>>> since we do not want to risk a potential NULL pointer 
>>> dereference.
>>>
>>> Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
>>> Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
>>> Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
>>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>h5_close v4
>>> ---
>>> Changes in v4:
>>> 	* Free h5->rx_skb even when hu->serdev
>>> 	(Suggested by Hans de Goede <hdegoede@redhat.com>)
>>> 	* If hu->serdev, then assign h5->rx_skb = NULL
>>>
>>> Changes in v3:
>>> 	* Free h5->rx_skb when !hu->serdev, and fix the memory leak
>>> 	* Do not incorrectly and unnecessarily call serdev_device_close()
>>>
>>> Changes in v2:
>>> 	* Fixed the Fixes tag
>>>
>>>  drivers/bluetooth/hci_h5.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
>>> index e41854e0d79a..39f9553caa5c 100644
>>> --- a/drivers/bluetooth/hci_h5.c
>>> +++ b/drivers/bluetooth/hci_h5.c
>>> @@ -245,11 +245,15 @@ static int h5_close(struct hci_uart *hu)
>>>  	skb_queue_purge(&h5->rel);
>>>  	skb_queue_purge(&h5->unrel);
>>>  
>>> +	kfree_skb(h5->rx_skb);
>>> +
>>>  	if (h5->vnd && h5->vnd->close)
>>>  		h5->vnd->close(h5);
>>>  
>>>  	if (!hu->serdev)
>>>  		kfree(h5);
>>> +	else
>>> +		h5->rx_skb = NULL;
>> Please just do this unconditionally directly after
>> the kfree_skb()
> 
> Could you also please tell me why this might be necessary?
> The pointer value stored at h5->rx_skb would be freed anyways when we free h5 (since rx_skb is
> essentially a member of the structure that h5 points to).

It is necessary in the path where the struct h5 points to is not
free-ed and it is cleaner to just always do it then, as you
indicate yourself 

> Also since we're performing the *if* check, the *else* condition wouldn't exactly be taxing either,
> right?

For the computer it is not taxing, but for a human reading the code
and trying to understand the flow it makes things extra complicated
unnecessarily.

> Is there some performance metric that I'm missing where unconditionally setting it to NULL
> in this manner would be better? (I couldn't find any resources that had any similar analysis
> performed :/ )
> Or is this in interest of code readability?

Yes, it is in interest of code readability?

> Also, how about we introduce a h5 = NULL, after freeing h5 when !hu->serdev?

That is not necessary, there is no reason to have that in either code path.

Regards,

Hans

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
