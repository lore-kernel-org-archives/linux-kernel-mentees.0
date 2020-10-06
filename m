Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50CDC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 02:44:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1864F206F4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 02:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZKPVgcb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1864F206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 958B28547B;
	Tue,  6 Oct 2020 02:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98EObyh3m0E2; Tue,  6 Oct 2020 02:44:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C2A3854B3;
	Tue,  6 Oct 2020 02:44:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1D52C016F;
	Tue,  6 Oct 2020 02:44:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43377C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 02:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E745E2041A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 02:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n25Ho3rXBemO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 02:44:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 0A46C2034C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 02:44:52 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t18so490997plo.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 19:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=c/r3PEj0YRai5C3VqjNaYuwwDYS1p6JUQvyN0lvoAyM=;
 b=gZKPVgcb9eSWsRLOQDMDuEXhOqUdFypNE0jzBHtA4crYiiIlkgr3O7vxr/i6mlssBg
 +hkHeLWWlyBaKfQhyNbu/aGLbkPCOJzfcHHVa8ein8Qs5VUK7iG5UOEbzqPNifN7tIKQ
 Ex1AWgNGUtM/NkR19tiiBCtcTt821D3uZMQZoG02lCXH0BebKwUuNzGfKSx0JXRc+w97
 ZRG/tQ2JuJEgE8P+PaEMmptZAOpPf8ucw0As5q6K+dkTCqIOT8/Qzzk6bCfl46wtbQ4a
 8BGa75rHZG88KLuAXsBNX5UrQf6M2WNt7xcGng9gSJKqDp6dUugssXT6zsE03krYdrPu
 8jfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=c/r3PEj0YRai5C3VqjNaYuwwDYS1p6JUQvyN0lvoAyM=;
 b=NJ/6qYQVWkhSOk+ooYWjthqALfyvyi4suHO0jSQPIW3CYnjBsQeba2eNdQDGrZQrLz
 +ytSWpUaw3E2UT3i1pACwE8X2nJaHmRJb1Zl5NVYjFIiYLXz7t/65+ehaT1+O1wSkMkA
 tEfyFthXQp/KuMF0gE/2axzy3UR9MQoEnuEVE1Ku6v7ZP9UHESzRjlPatcwjoTZ6eDM4
 S2DhB7Pwfe1fHn6oW0NbichMtBrQHf/BM1ljcAwu4GqQkX+z6gL+XhRPUinEyxInqXcK
 Km9DjVD82YbYZUhCb49WZvT97UAGWRNTZBbR0g03zE8DLWTSMO/U868wZlwLPgOc0kvP
 FEkA==
X-Gm-Message-State: AOAM530LjoxKel8c35FXQOG443Ym510KF9k4V7DffHUBV/EzWB7L66Cv
 LQ2eVqrycG1JGDzVGI3J7Rk=
X-Google-Smtp-Source: ABdhPJy2nooYLBrQ5KLb9QiAVlVBANGc294nAeAdlos0bGJi0zn5KhComJuVTd3U0wSPeZ8/kFZkXg==
X-Received: by 2002:a17:90a:588b:: with SMTP id
 j11mr2164529pji.45.1601952291222; 
 Mon, 05 Oct 2020 19:44:51 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.207.135])
 by smtp.gmail.com with ESMTPSA id gi20sm940810pjb.28.2020.10.05.19.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 19:44:50 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
References: <20201001194329.9328-1-anant.thazhemadam@gmail.com>
 <20201004051708.21985-1-anant.thazhemadam@gmail.com>
 <407eed16-ba46-0ba6-544f-d5e820a1ced7@redhat.com>
Message-ID: <93ed51be-97b9-c5b4-8448-d06528a1d1af@gmail.com>
Date: Tue, 6 Oct 2020 08:14:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <407eed16-ba46-0ba6-544f-d5e820a1ced7@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 05-10-2020 14:48, Hans de Goede wrote:
> To fully fix the memleak you also need to add a kfree_skb(h5->rx_skb);
> call to the end of h5_serdev_remove(), because in the hu->serdev case
> that is where the h5 struct will be free-ed (it is free-ed after that
> function exits).

Hi Hans,

I'm not entirely convinced that it might be entirely the best idea to do
that.

* The bug detected by syzbot only provides us with reproducer and
information about this bug (which gets triggered when !hu->serdev).
Even if like you said, there might be a memory leak unattended to when
hu->serdev exists, then this might not necessarily be the right place to fix
it.

* From what I can see, all the drivers that have modified to provide serdev
support have different close() mechanisms.
However, one thing they do have in common (in this context) is that their
respective serdev_remove() function simply calls hci_uart_unregister_device()
to unregister the device.
It is primarily for this reason that I feel adding a kfree_skb() call at the end
of h5_serdev_remove() might not exactly be the best way we could solve this
(and since this hasn't been picked up by syzbot yet, there's no way to know if
this just fixes things or ends up causing unforeseen complications).

Alternatively, wouldn't freeing h5->rx_skb and assigning it to NULL, for both
hu->serdev and !hu->serdev cases within h5_close() itself be a better
approach? I've also taken the liberty of testing a patch that does this, and it
seems to work correctly too. :)

But then again, I'm not exactly an authority on how this works.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
