Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368F6E784BF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 15:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA863820C4;
	Mon,  2 Oct 2023 15:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA863820C4
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XjgXWuvZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gTLYVorkub46; Mon,  2 Oct 2023 15:40:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D006581D4F;
	Mon,  2 Oct 2023 15:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D006581D4F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABFA3C0071;
	Mon,  2 Oct 2023 15:40:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE4C6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6FCD6102D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6FCD6102D
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XjgXWuvZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNM9FSCA84Kd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:40:36 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 412DD6061B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 412DD6061B
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c723f1c80fso55177565ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Oct 2023 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696261235; x=1696866035;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/wiIjPxGS9I1xRfBewNetTUwkZeGUFLTkeOYKIQyLkg=;
 b=XjgXWuvZ3ngdjRfBXNhhkzvQnCgvilEdsZ2OvOT27IzqArWfjd5oExoBwP0q+5dkbA
 W22/vikRxoBOtu972TNXg5a+mTsuNCq9mxgEesaPb+13PDfGcJXcF/+06cr6OERkajFl
 tcykZyhKjIYevCPgleukjNqF9KhyaXU5ZmC12XfSDcg787MoOReFHC0CkT/1+RM1eFlh
 6BVUQZRh7WhXRsPMml6AJ6CAtXPBEqfg1+x8oibgE1TwtjUpNkfoCY+n+YNS62XXYhJZ
 urnckfLTVaOTapsziYh1hOZXfCaejmB8MPvVt4MaHLmRvYmzLu0cF+k3JrEz/oVivZZq
 IJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696261235; x=1696866035;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wiIjPxGS9I1xRfBewNetTUwkZeGUFLTkeOYKIQyLkg=;
 b=vcZFPVq0SQImrYjCCMJ/Db2h444S55/OztUjvm5mpIjp0Xlly8Gq3FzWIDKydHS/6q
 194XTx4KJDnKUJEYO2UbQf2AK1+EcqZmhCmaLP81WCJivf6fUfagRLSOGCheqMRKt+AX
 DxyCfscvRFrRgHqocrVgNAAB38PI7CQtg0yDdj7xgjzbBxxEiN4KSNGhkZwveTQ5f0hm
 Nk6i5V9wDhFw1wMHGGaZoQf/0POTAO4I5MBBxdI6MTos6VzRsHek5yrSdJSepKOiKaUo
 V8LER+ylNJ7eAs9c41DjZ1JymfvFfS06XleBuoLhiqFAiOyrAoiuGLoRcNF1lmZNZntP
 w2tg==
X-Gm-Message-State: AOJu0Yxb6/+3LiDzJgpqaCWyjhv2EOhIJkkpKXb7nl87Z8mWQtaL61V7
 /5cJVEKEh0ZRw3vvERsRVxk=
X-Google-Smtp-Source: AGHT+IEqZ3v/v//a1wYhJ9s8uuhb7EVgVzeNPvmzBmt8w0G6QXiks6v052V2OBcI6S1rLh8zi7i+rQ==
X-Received: by 2002:a17:902:ecc8:b0:1c7:41ed:199 with SMTP id
 a8-20020a170902ecc800b001c741ed0199mr10742839plh.66.1696261235536; 
 Mon, 02 Oct 2023 08:40:35 -0700 (PDT)
Received: from swarup-virtual-machine ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170902868200b001b54d064a4bsm3524178plo.259.2023.10.02.08.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 08:40:35 -0700 (PDT)
Date: Mon, 2 Oct 2023 21:10:30 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: fix kernel-doc warning
Message-ID: <ZRrkbkjoHgEnuy/m@swarup-virtual-machine>
References: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
 <2023100253-aide-authentic-5aa1@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023100253-aide-authentic-5aa1@gregkh>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Oct 02, 2023 at 04:42:03PM +0200, Greg KH wrote:
> On Tue, Sep 19, 2023 at 01:05:05AM +0530, Swarup Laxman Kotiaklapudi wrote:
> > Fix kernel-doc warnings discovered in usb driver.
> > Fixes this warning:
> > warning: Function parameter or member 'gfladj_refclk_lpm_sel'
> >          not described in 'dwc3'
> > 
> > Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> > ---
> >  drivers/usb/dwc3/core.h | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> What commit id does this fix?
> 
> thanks,
> 
> greg k-h

Hi Greg,
Please find the commit id as mentioned below,
next time onwards i will mention it:

Fixes: 5cd07f96c0c6 ("usb: fix kernel-doc warning")

Thanks,
Swarup

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
