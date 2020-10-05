Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C9BC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 09:18:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 439262074F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 09:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WuJGn+hJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 439262074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E0B36834EE;
	Mon,  5 Oct 2020 09:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KS9nRjhXQO_p; Mon,  5 Oct 2020 09:18:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E9CF82DDF;
	Mon,  5 Oct 2020 09:18:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B8F2C07FF;
	Mon,  5 Oct 2020 09:18:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E9C0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 09:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8788C20470
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 09:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ny5x2d+sduFp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 09:18:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 2D87A203B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601889531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3XcxoXhY4tkNoJfwZZRV7A+yw9a/CNVKalRc3OmXs8=;
 b=WuJGn+hJibX4zg9eJLtuelyn/fMJjFqTOvwM2ajLYAlnBgNCqoKIhbO/DeGl2F/vHVuZNm
 ji4zu510tltzqxDP2l343NY7KX2NMzn6lrsFxgymbeYP+3N63NiaF359HpQZiweW9OTMHa
 lx6hxLAGkAg5keZ1q7dxtnvPKTtcjuE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-ZOAht-dGMLKoLWzzjlGJ7Q-1; Mon, 05 Oct 2020 05:18:47 -0400
X-MC-Unique: ZOAht-dGMLKoLWzzjlGJ7Q-1
Received: by mail-ed1-f72.google.com with SMTP id e14so711458edk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 02:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q3XcxoXhY4tkNoJfwZZRV7A+yw9a/CNVKalRc3OmXs8=;
 b=tW5vcrOuaWqBlC9YzNMRmX4Gzb7CMZaXDypB8sz+NDCpoIzgyXibqHjEPL/7jS3vHt
 9mIsIBJzS0stkR4lfd0rIrPrJYo8y/DFWAlfy2Wn/52qlyHPARv7aRH4YRKJRMQ/HFkr
 lm7HnNuubY106hQufIi3Vwg0FhCBcgjh0utHTq2ZSetWptSGDeiCVUWbK2+ivlKBFfrO
 6Rcokhgrd2c1+drXrkj6rUQPIyJPQtRJT2XyfRla/9vxG8oj6GjmVeY9AP3mm9dMiPgv
 0OYCeP80eNqu0V7GDiFeXhsQK8dYsOQGIc4nMz6hGNWo7Sq5fn6KmzUH7yCnQFn6iGfj
 TTgA==
X-Gm-Message-State: AOAM530izjtmzW16YAjvHm10Nc4NufCUIu8Qf8WU6U0APhWh9IgNnnbC
 Gwy7XhbskM+OVmLbEQvMkfVEkZQKcysbC1k7UfsHwNpcau2dK5kow5Du7iiTS/0pKNGRTvanA5n
 oH3rV8caPVeZMUbvZm432W06zlwZ/dNoss1ijXbv6JDaM8dN9
X-Received: by 2002:a17:906:515:: with SMTP id
 j21mr14332823eja.105.1601889525712; 
 Mon, 05 Oct 2020 02:18:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk35PxolVpg9uR0Lvf99rilKe3o7bOBze0DPf4z50pe1DzStwj49LCJfw/NK55ktPt8VURDA==
X-Received: by 2002:a17:906:515:: with SMTP id
 j21mr14332813eja.105.1601889525536; 
 Mon, 05 Oct 2020 02:18:45 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id b25sm37579eds.66.2020.10.05.02.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 02:18:44 -0700 (PDT)
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
References: <20201001194329.9328-1-anant.thazhemadam@gmail.com>
 <20201004051708.21985-1-anant.thazhemadam@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <407eed16-ba46-0ba6-544f-d5e820a1ced7@redhat.com>
Date: Mon, 5 Oct 2020 11:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201004051708.21985-1-anant.thazhemadam@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] bluetooth: hci_h5: fix memory
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

On 10/4/20 7:17 AM, Anant Thazhemadam wrote:
> When h5_close() is called and !hu->serdev, h5 is directly freed.
> However, h5->rx_skb is not freed before h5 is freed, which causes
> a memory leak.
> Freeing h5->rx_skb (when !hu->serdev) fixes this memory leak before
> freeing h5.
> 
> Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
> Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
> Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
> Changes in v3:
> 	* Free h5->rx_skb when !hu->serdev, and fix the memory leak
> 	* Do not incorrectly and unnecessarily call serdev_device_close()
> 
> Changes in v2:
> 	* Fixed the Fixes tag
> 
> Hans de Goede also suggested calling h5_reset_rx() on close (for both, !hu->serdev
> and hu->serdev cases).
> However, doing so seems to lead to a null-ptr-dereference error,
>          https://syzkaller.appspot.com/text?tag=CrashReport&x=136a9a5d900000,
> and for this reason, it has not been implemented.
> 
> Instead, directly freeing h5->rx_skb seems to suffice in preventing the memory leak
> reported.
> And since h5 is freed immediately after freeing h5->rx_skb, assigning h5->rx_skb to
> be NULL isn't necessary.
> 
>   drivers/bluetooth/hci_h5.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
> index e41854e0d79a..171e55c080ce 100644
> --- a/drivers/bluetooth/hci_h5.c
> +++ b/drivers/bluetooth/hci_h5.c
> @@ -248,8 +248,10 @@ static int h5_close(struct hci_uart *hu)
>   	if (h5->vnd && h5->vnd->close)
>   		h5->vnd->close(h5);
>   
> -	if (!hu->serdev)
> +	if (!hu->serdev){
> +		kfree_skb(h5->rx_skb);
>   		kfree(h5);
> +	}
>   
>   	return 0;
>   }
> 

To fully fix the memleak you also need to add a kfree_skb(h5->rx_skb);
call to the end of h5_serdev_remove(), because in the hu->serdev case
that is where the h5 struct will be free-ed (it is free-ed after that
function exits).

Regards,

Hans

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
