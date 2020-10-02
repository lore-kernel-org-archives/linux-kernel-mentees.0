Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70587C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 10:22:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5E54206FA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 10:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W+RJ7mH2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5E54206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A0114204FB;
	Fri,  2 Oct 2020 10:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHCXmnAlwdO4; Fri,  2 Oct 2020 10:22:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EE300204F9;
	Fri,  2 Oct 2020 10:22:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5BFFC016F;
	Fri,  2 Oct 2020 10:22:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27C11C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0FBD387233
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sgp3eHmFIDmI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:22:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4829987232
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601634168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xq6PdAlFtb82Oyf/HTK7koITUOMihvvyNRrB1vT+OU=;
 b=W+RJ7mH26m789M8raXQLTJb7PGO2ZwkiGSbbHVeZkXmtR191G/rz66Exrx76Ea4rWvXhtP
 0gZz3AdHBydzvzpTDbPdU2uu6yyjvyWZpUog2D/64qMTFQZT4QXOth8rXb4Rj2sdzS091F
 7gYMUf0cuVXPtwZGf6GARRI0P7MuHkU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-9ABTtGzONj2oPaYUfagE9Q-1; Fri, 02 Oct 2020 06:22:46 -0400
X-MC-Unique: 9ABTtGzONj2oPaYUfagE9Q-1
Received: by mail-ej1-f71.google.com with SMTP id c20so494366ejs.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 03:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1xq6PdAlFtb82Oyf/HTK7koITUOMihvvyNRrB1vT+OU=;
 b=ioQoAxbN9jjDCg3Cj1ZV5KnJ6sFn9PiHWbf5GPxM3Ht6iF+FmKlvul881D94nHub1i
 pzyFfg9IAXEiX4VFww6HFTc/RZ8Ib0qAVT8wn1BOPecoIfVPII4NaDoG11cMkmeq4xs4
 sIIUZdzs1bYuH+Ja/8k7F8We4p0p41mBN7bbLSF21SCpvo79UhjoZMW0J83pAcnVNxY8
 EnRPRkK/OMKURXqGkceNa2ZvQeygPbaPKoW5cjSCen+dAGQs2nFFk05NeSij64/SNE50
 Gd4AJyudPtB2jY/ZO7S5aCgCMIK64Hlax/YkEBpVfAd6GVK/eSa7xR0Atn2uqfb6Zm/j
 Z2eQ==
X-Gm-Message-State: AOAM532YWxAbbv8u7bbMzfsIflbFK/4TV+GpIhz+CjOzrRec0LTdd8NC
 t6IU4Nsn4WHiei69k+0qFM1XS8/Q/mvWqWiKY1GYhCAPDDRk8si04dImpw/Mjnb5Jda1NAJBt3i
 JPKHh73by5VtwMceup+nWE/shkic+QeLdgK4CxInrkDgaQ8U4
X-Received: by 2002:a17:906:a841:: with SMTP id
 dx1mr1538940ejb.520.1601634165144; 
 Fri, 02 Oct 2020 03:22:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4HuvnOcBD6DICM9z/IMauYSG45w0g9vyVtyC7HcfWDB8Jdwd/2/aCDu1Kl4wl2RZzVHt+FA==
X-Received: by 2002:a17:906:a841:: with SMTP id
 dx1mr1538918ejb.520.1601634164922; 
 Fri, 02 Oct 2020 03:22:44 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id t4sm854790ejj.6.2020.10.02.03.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 03:22:44 -0700 (PDT)
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
References: <20201001194329.9328-1-anant.thazhemadam@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <33d8c103-0c24-3ad7-2a3c-ffeb625521ee@redhat.com>
Date: Fri, 2 Oct 2020 12:22:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001194329.9328-1-anant.thazhemadam@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] bluetooth: hci_h5: close
 serdev device and free hu in h5_close
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

On 10/1/20 9:43 PM, Anant Thazhemadam wrote:
> When h5_close() gets called, the memory allocated for the hu gets
> freed only if hu->serdev doesn't exist. This leads to a memory leak.
> So when h5_close() is requested, close the serdev device instance and
> free the memory allocated to the hu entirely instead.
> 
> Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
> Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
> Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>

So 2 comments to this:

1. You claim this change fixes a memory-leak, but in the serdev case
the memory is allocated in h5_serdev_probe() like this:

        h5 = devm_kzalloc(dev, sizeof(*h5), GFP_KERNEL);

So its lifetime is tied to the lifetime of the driver being bound
to the serdev and it is automatically freed when the driver gets
unbound. If you had looked at where the h5 struct gets allocated
in h5_close()-s counterpart, h5_open() then you could have seen
this there:

         if (hu->serdev) {
                 h5 = serdev_device_get_drvdata(hu->serdev);
         } else {
                 h5 = kzalloc(sizeof(*h5), GFP_KERNEL);
                 if (!h5)
                         return -ENOMEM;
         }

So it is very clear here, that the kzalloc only happens in the
if (!hu->serdev) which clearly makes the kfree() have the same
condition the right thing todo. In the hu->serdev the data which
was allocated by h5_serdev_probe() is used instead and no alloc
happens inside h5_open()

In general when looking at resource teardown you should also look
at where they are allocated in the mirror function
and the teardown should mirror the alloc code.

So the main change of your commit is wrong:

NACK.


2. You are making multiple changes in a single commit here, I count at
least 3. When ever you are making multiple changes like this, you should really
split the commit up in 1 commit per change and explain in each commit
message why that change is being made (why it is necessary). Writing
commit messages like this also leads to you double-checking your own
work by carefully considering why you are making the changes.

So about the 3 different changes:

2a) Make the kfree(h5) call unconditionally, which as mentioned above
is wrong.

2b) Introduce a call to kfree_skb(h5->rx_skb); which is not mentioned in
the commit message at all.  This looks like it would actually be a sensible
change, at least in the "if (!hu->serdev)" case.  When using the serdev
interface then just freeing it will leave a dangling pointer, so it
would be better (for both the hu->serdev and the !hu->serdev cases)
to call h5_reset_rx() on close instead which does:

         if (h5->rx_skb) {
                 kfree_skb(h5->rx_skb);
                 h5->rx_skb = NULL;
         }

2c) Introduce a call to serdev_device_close(), without really explaining
why in the commit message. Again if you would have looked at the mirror
h5_close() function then you see no serdev_device_open() there.
Actually serdev_device_open() is not called anywhere in the hci_h5.c code.

Digging a little deeper (using grep) shows that hci_uart_register_device()
calls serdev_device_open() and hci_uart_register_device() gets called from:
h5_serdev_probe(), likewise hci_uart_unregister_device() calls
serdev_device_close() for us and that gets called from h5_serdev_remove(),
so there is no need to call serdev_device_close() from h5_close() and doing
so will actually break things, because then the serdev will be left closed
on a subsequent h5_open() call.

Regards,

Hans



> ---
> Changes in v2:
> 	* Fixed the Fixes tag
> 
>   drivers/bluetooth/hci_h5.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
> index e41854e0d79a..3d1585add572 100644
> --- a/drivers/bluetooth/hci_h5.c
> +++ b/drivers/bluetooth/hci_h5.c
> @@ -248,8 +248,12 @@ static int h5_close(struct hci_uart *hu)
>   	if (h5->vnd && h5->vnd->close)
>   		h5->vnd->close(h5);
>   
> -	if (!hu->serdev)
> -		kfree(h5);
> +	if (hu->serdev)
> +		serdev_device_close(hu->serdev);
> +
> +	kfree_skb(h5->rx_skb);
> +	kfree(h5);
> +	h5 = NULL;
>   
>   	return 0;
>   }
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
