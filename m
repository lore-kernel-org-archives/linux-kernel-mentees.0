Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF79C46466
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 06:30:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8411720796
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 06:30:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K0XF6FIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8411720796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 163A086C1D;
	Tue,  6 Oct 2020 06:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mw40pq0dVfXS; Tue,  6 Oct 2020 06:30:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8D28286CB6;
	Tue,  6 Oct 2020 06:30:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 794BAC016F;
	Tue,  6 Oct 2020 06:30:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AE93C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 06:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 79F4784EA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 06:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shiKwhRvCKtz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 06:30:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9315084EA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 06:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601965809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vwyAgepOoBCoYxOhMcz2TzI9xFjcG6ujhGRXpaPdzg=;
 b=K0XF6FIe3rL7XjUlYuCIgNFS0OWd9Dy0Mmis/S9e/Lh6QJuHzH2Y+/f7CRocWFJJxezBqf
 sS8NkyGcDsVOzLJQejVcJRHJ1Y560CnxKDrW17BllrqtqltAAFED1o3BeRQllF1pIrC4Kz
 hU9YrHzlAuEzh5S+gHojw488y3FKPhw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-qSFFI62GPF-5KPdpWT_Apw-1; Tue, 06 Oct 2020 02:30:07 -0400
X-MC-Unique: qSFFI62GPF-5KPdpWT_Apw-1
Received: by mail-ed1-f72.google.com with SMTP id o24so5664871edz.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 23:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7vwyAgepOoBCoYxOhMcz2TzI9xFjcG6ujhGRXpaPdzg=;
 b=pK/dTUkXAgfEArCy5Nh+YUy/68cMwUmXVi8hmlx9Z4+nsnPn1EWvjGvDVM3PEdlzXz
 SRPzuVUdoTitPezf+Cc1WVNNZkbH7hoEoOcBrXjczXHmj/ffAt/YTIgpPsY5bhHFQ28J
 QObClpuKYdAdLC8SgqAo0ddbHedr+yQYA+MG5IZTm78KxIp4ngKh/fvksll+LXeQ0rJX
 AQxj16vJE90zOAXaTYk6P2qr0pZOmlPjh7/KLEU7+ZWlZdy1MIW2AcSbMSl0Yo/a3yky
 RgwbzHqjVylQCao56/EtNb1sBrJvXEQSBdLo3OjcOUB5tid8nE2W8YlHBk37KvAWsrch
 Zhxw==
X-Gm-Message-State: AOAM530L9dG3bXcvJOUR3dDXL59bpqv0hR2wpf7bYIWmb1+Mn8m/ZUjO
 PDwu9k18zU4NG2c2UZwa8imk1f9cUz822jw3cjIHdOZVaND5HUwnramD84TTEKf+r4Aeuc+tpZ7
 T9IixrP7X/dGKbgUUC5t3ZCcK8CO43QhfqLB6hnhPD51ldaR7
X-Received: by 2002:a50:e3c4:: with SMTP id c4mr3830704edm.90.1601965806572;
 Mon, 05 Oct 2020 23:30:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhkqyrg+DyKKwlFvUJxqKcNDl3H/dazO0Z2xeNbQHL8lAxXSWRnze8VoStOqhtN3tIDvWSMw==
X-Received: by 2002:a50:e3c4:: with SMTP id c4mr3830687edm.90.1601965806375;
 Mon, 05 Oct 2020 23:30:06 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id b6sm1625489edu.21.2020.10.05.23.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 23:30:05 -0700 (PDT)
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
References: <20201001194329.9328-1-anant.thazhemadam@gmail.com>
 <20201004051708.21985-1-anant.thazhemadam@gmail.com>
 <407eed16-ba46-0ba6-544f-d5e820a1ced7@redhat.com>
 <93ed51be-97b9-c5b4-8448-d06528a1d1af@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <9761cf0c-e2bf-38ea-e1d1-59b481736186@redhat.com>
Date: Tue, 6 Oct 2020 08:30:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <93ed51be-97b9-c5b4-8448-d06528a1d1af@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0.002
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

On 10/6/20 4:44 AM, Anant Thazhemadam wrote:
> On 05-10-2020 14:48, Hans de Goede wrote:
>> To fully fix the memleak you also need to add a kfree_skb(h5->rx_skb);
>> call to the end of h5_serdev_remove(), because in the hu->serdev case
>> that is where the h5 struct will be free-ed (it is free-ed after that
>> function exits).
> 
> Hi Hans,
> 
> I'm not entirely convinced that it might be entirely the best idea to do
> that.
> 
> * The bug detected by syzbot only provides us with reproducer and
> information about this bug (which gets triggered when !hu->serdev).
> Even if like you said, there might be a memory leak unattended to when
> hu->serdev exists, then this might not necessarily be the right place to fix
> it.
> 
> * From what I can see, all the drivers that have modified to provide serdev
> support have different close() mechanisms.
> However, one thing they do have in common (in this context) is that their
> respective serdev_remove() function simply calls hci_uart_unregister_device()
> to unregister the device.
> It is primarily for this reason that I feel adding a kfree_skb() call at the end
> of h5_serdev_remove() might not exactly be the best way we could solve this
> (and since this hasn't been picked up by syzbot yet, there's no way to know if
> this just fixes things or ends up causing unforeseen complications).
> 
> Alternatively, wouldn't freeing h5->rx_skb and assigning it to NULL, for both
> hu->serdev and !hu->serdev cases within h5_close() itself be a better
> approach?

That will indeed also fix the leak in both cases and is more consistent
wrt when the free_skb happens. So this sounds good to me, go for it.

Regards,

Hans



> I've also taken the liberty of testing a patch that does this, and it
> seems to work correctly too. :)
> 
> But then again, I'm not exactly an authority on how this works.
> 
> Thanks,
> Anant
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
