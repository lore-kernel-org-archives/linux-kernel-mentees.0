Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72D9C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 Jul 2022 09:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30BB760804;
	Sat,  2 Jul 2022 09:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30BB760804
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GkNnWxBN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfT4U2iyLELT; Sat,  2 Jul 2022 09:37:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3F8DD60757;
	Sat,  2 Jul 2022 09:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F8DD60757
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE0D6C0032;
	Sat,  2 Jul 2022 09:37:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CC0DC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Jul 2022 09:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32FC160757
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Jul 2022 09:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32FC160757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O3ppzzffDpGL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Jul 2022 09:37:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B92B606E6
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B92B606E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Jul 2022 09:37:39 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 9so4526945pgd.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 02 Jul 2022 02:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KziEB9cT1XcdWrK8SlCN94Y+V1t5gEx6xZeBcAcwjrQ=;
 b=GkNnWxBNyvD7NfVWf71wj0qPZQHF5Cz849SIL0CUeRtiytraHup5EJThnMcVn1F/7j
 sxPACwemV4bW6KvThxVmBSXvBV1/g+GdbD3YUr5/cCYLmGqv58UZMp/0aeGav6nqVsdj
 QTUNtD1gnVT1hwijOLLaiXHGO7paoTT0uXSE550xfQcBPNWsHr3017xFxMWBwaHKEMP0
 Dlh+vr8qQ4kYU8tnrvS5CgI7kf5B/Ue4xuJaJ0H76aCwCNHMqUhVTqgNdKvO1dm7mUn0
 sz1vmeGDQcodEkchiBJabpgVI1NNFAs5Fwgd8+xfSlN9l3YeWqgJifFnfxEuCn/pAbg3
 2I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KziEB9cT1XcdWrK8SlCN94Y+V1t5gEx6xZeBcAcwjrQ=;
 b=SYw1OOxZTKdaJz1iV+yUeS5MJ1zKwEIPuQWbT5Y6+0ZtRVBAIl7jNsrP6B+FOhQE8n
 ZnH1OmWeiX9/Su+36rnjoh4Jn7yDl/C0MU8JRA4DCpd/e/YXoCqdsLq15zh6x3eLoeSg
 HUNMcC1QoWBuNULlxPd3IXPpKi8KjEG72PgyxuoWU9sEl+9SjIqg8fr4DWMNGbX/8ZOx
 awckdNCF2RbqSt4mrVVVYwxDf+dN2w5Q5NEZJhJBPxH9/3r2MolZfe5RKIGvqxCWEKrK
 2WBlYfNs5UNOrzoksVAtm+CZ6ijIJNKm6layMg/qJZHRUSM/YiW1ScStt3LaLLZZWG+h
 Ixnw==
X-Gm-Message-State: AJIora//4aEjY5T8lPfiEycmdY8n9PEpNbVkTGXt6CDPboCPDbFd3k4v
 XJM5Ikswb3XMD8CDNLkmzm3J2a7xUC1lFw==
X-Google-Smtp-Source: AGRyM1ugAHe+9ZCzXRBnnXe27bSmgN424F9L2BoVUlgCpwrNNSCJRKjrrA8BkTx2ikN7+I2AdjPxyw==
X-Received: by 2002:a05:6a00:84d:b0:525:3ce6:9c33 with SMTP id
 q13-20020a056a00084d00b005253ce69c33mr24215589pfk.47.1656754658327; 
 Sat, 02 Jul 2022 02:37:38 -0700 (PDT)
Received: from Negi ([68.181.16.243]) by smtp.gmail.com with ESMTPSA id
 x9-20020a634849000000b0040d75537824sm16814650pgk.86.2022.07.02.02.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 02:37:36 -0700 (PDT)
Date: Sat, 2 Jul 2022 02:37:35 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [RFT PATCH] isdn: capi: Add check for controller count in
 detach_capi_ctr()
Message-ID: <20220702093734.GA24575@Negi>
References: <20220701235014.13025-1-soumya.negi97@gmail.com>
 <ee159745-07d2-dca3-6be3-bef823090088@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee159745-07d2-dca3-6be3-bef823090088@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Jul 02, 2022 at 11:14:06AM +0300, Pavel Skripkin wrote:
> Hi Soumya,
> 
> Soumya Negi <soumya.negi97@gmail.com> says:
> > Fixes Syzbot bug:
> > https://syzkaller.appspot.com/bug?id=14f4820fbd379105a71fdee357b0759b90587a4e
> > 
> > This patch checks whether any ISDN devices are registered before unregistering
> > a CAPI controller(device). Without the check, the controller struct capi_str
> > results in out-of-bounds access bugs to other CAPI data strucures in
> > detach_capri_ctr() as seen in the bug report.
> > 
> > Reported-by: syzbot+9d567e08d3970bfd8271@syzkaller.appspotmail.com
> > 
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > ---
> >   drivers/isdn/capi/kcapi.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/isdn/capi/kcapi.c b/drivers/isdn/capi/kcapi.c
> > index 18de41a266eb..6175ff7ec749 100644
> > --- a/drivers/isdn/capi/kcapi.c
> > +++ b/drivers/isdn/capi/kcapi.c
> > @@ -563,6 +563,9 @@ int detach_capi_ctr(struct capi_ctr *ctr)
> >   	mutex_lock(&capi_controller_lock);
> > +	if (ncontrollers == 0)
> > +		goto unlock_out;
> > +
> 
> It seems like to fix the problem. Did you mean to return 0 in case of
> ncontrollers == 0? Maybe it's better to return an error to indicate that
> function was called wrongly.

Yes, I let detach_capi_ctr() exit without an error code since I figured the
issue is caused by another subsystem in the first place.
But your logic sounds right. It is still an error and should be reflected
on return. I'll do that.
 
> On the other hand it means there are suspicious callers of that function.
> Maybe they should be fixed too.

It is being wrongly called without a controller count check from an external
function in the bluetooth stack's CMTP module. Should I fix the calling 
function in the same patch or go for a patchset?

> I'd put a warning in case of `ncontrollers == 0`, to indicate that something
> is going completely wrong.
 
Thanks for the quick reply,
Soumya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
