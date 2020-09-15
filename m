Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B2CC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 05:51:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB070206C9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 05:51:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhxHBDPq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB070206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9901920474;
	Tue, 15 Sep 2020 05:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgO2Mg+-3KC7; Tue, 15 Sep 2020 05:51:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 70AE620472;
	Tue, 15 Sep 2020 05:51:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AB24C0859;
	Tue, 15 Sep 2020 05:51:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FB2FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E471520472
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ti+szCbKElxw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:51:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 4D41F20466
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:51:20 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t14so1374718pgl.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 22:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TMg87JRx8eEsPjAPTRFHhCmta+gxJvIx+r8SoSGKiIE=;
 b=hhxHBDPq0a1er3XaVMT8g3XaDu7cF8LCJoHGBV5OERrgfgKPcLi7dV1BawwOCNfepa
 kptrqst9Q20XL4kPjWsK0GNcZu7Bhjr47XhynxZQf5O4Wn93CapKQe37DI3xVKBaYs/5
 Ngl/pAfBdLAPW1Euf7AUwHxUiA8nOVq3EDPbMeOH/VqCaOOWDbBgVrhP7VSLVIlZDUYS
 XWh/YyoRJTmWBuF36A2j1lGKsoZ7EOh7o4bbNNHaUiavDy4NUHqBKkdz4rHwurSLQMtZ
 Jm2BwG8pjiuNKyyqq7ZpkH9GtiJ5/kDSnlobvanoGFdndULtSEqpYRYdPviSjwLX567j
 OLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TMg87JRx8eEsPjAPTRFHhCmta+gxJvIx+r8SoSGKiIE=;
 b=P4GbfU7WcHutu7i2m3/DvHPfCKzuqBz62Wji6jv3wi7cGtVEXJThA3MbMosCNnnacx
 1nGryhS7WiTxGEN/F/n6auA/mqJx+aLXmdg5xN/CS1OEbcbrei5f5ux+tym+oE4tytR6
 pBUFHFfKTJDKMUGcFhUMGqTzlICpnhQE8BUMwfN9NrnB3fvj4dapF9vhfnNIvsdeL8hA
 iq6zQOCChy9LXEPHY6E+xX5QtpJrBa3S/rYAOqSgabZTBZMRFDWKyMSZJkFml+eZyMqY
 lahFJAlu6byl6xpcYqG0lis+JD7uSBDI2ZudIvopXZMqrHfkR2oivt4Tmn9ByqgeSlJc
 P8iw==
X-Gm-Message-State: AOAM531qoMpZ3YvOsMLc9HVyl56nFcl8rEowph3IMZlHwnuCPcsYEFYc
 3/bUeqd4eA5bl/UP1/xkI2k=
X-Google-Smtp-Source: ABdhPJylSfFDoid3x9u/XfZidYVeaQfza7R0zyjgFVOKz9yfY7lZZutMsFMCZaPk2NlfC86Lt8zLqQ==
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr418631pfn.73.1600149079587; 
 Mon, 14 Sep 2020 22:51:19 -0700 (PDT)
Received: from Thinkpad ([45.118.167.197])
 by smtp.gmail.com with ESMTPSA id ms16sm10847414pjb.55.2020.09.14.22.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 22:51:18 -0700 (PDT)
Date: Tue, 15 Sep 2020 11:21:10 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200915055110.GB7980@Thinkpad>
References: <20200914071724.202365-1-anmol.karan123@gmail.com>
 <20200914110803.GL6583@casper.infradead.org>
 <20200914184755.GB213347@Thinkpad>
 <20200914192655.GW6583@casper.infradead.org>
 <20200915051331.GA7980@Thinkpad>
 <20200915052642.GO899@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915052642.GO899@sol.localdomain>
Cc: Necip Fazil Yildiran <necip@google.com>,
 Eric Dumazet <eric.dumazet@gmail.com>, netdev <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-fsdevel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] idr: remove WARN_ON_ONCE() when
	trying to check id
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

Hello sir,

> > I hope the patch will get merged soon.
> 
> No need to "hope"; you could split up Matthew's patch yourself, and test and
> send the resulting patches.  From the above thread, it looks like the networking
> developers want one patch to fix the improper use of GFP_ATOMIC (which is the
> bug reported by syzbot), and a separate patch to convert qrtr to use the XArray.
>

Sure sir I will look into it.

> 
> > also, i have tried a patch for this bug
> > 
> > Link: https://syzkaller.appspot.com/bug?extid=3b14b2ed9b3d06dcaa07
> > 
> > can you please guide me little how should i proceede with it, and 
> > also syzbot tested it.  
> 
> Looks like something timer-related.  You'll need to investigate more, write and
> test a fix, and send it to the appropriate kernel mailing lists and developers
> (which will probably be different from the ones receiving this current thread).
> 

My bad sir, will send it to the appropriate list.

Thanks  
Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
