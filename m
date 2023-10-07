Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C608E95A61
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 15:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C6E61040;
	Sat,  7 Oct 2023 15:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80C6E61040
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tl7YHJfH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtzA47BXbFac; Sat,  7 Oct 2023 15:41:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 838B560FC2;
	Sat,  7 Oct 2023 15:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 838B560FC2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B784C0039;
	Sat,  7 Oct 2023 15:41:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 871DDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55BC66101F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55BC66101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THcE_QfVIpgw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:41:41 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9B0160FC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9B0160FC2
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-690d8c05784so2571242b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Oct 2023 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696693301; x=1697298101;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rk+ZMtU5f7x0KSV6yTAKp1YLFSinobCi/p1pfUDzEYU=;
 b=Tl7YHJfH88qVBsuhuJqDafl8kTAGt1nb0jXGWts9eLlQutEu7KgVNy0TUvUthGLxMQ
 6ZKAGSsAVtuV490CNjG9qMZ3CW41x4BorW1Yn2vT0l4OzVHeId6MjxMuLXzq7X/PefZj
 lSITx6Syl/GpGx2s7yh5edH6MuCGfF8usqe+fdcX2NZya2p/4SCZpl6Fck291dQmmsTg
 CrJ0J592FSQN+DPFupH9a2gYNUFxks3aSbtIa8iK7i+POHSNyAezq0o7uk+RqwKUPsfI
 yqbUvFXIBT2evPFOjqSuB20RmvL457nlwirhZl/wfcjeEzii9nC1dqd1Z3zsaXcAUWSA
 VORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696693301; x=1697298101;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rk+ZMtU5f7x0KSV6yTAKp1YLFSinobCi/p1pfUDzEYU=;
 b=h/tqhMPPufa/Rvv+mllLCLsyukFvhkQImmxGXPmvzfpDyJwutJBfpmb0XCHWY8Vk3U
 TUbTz4xAGH7qO5fAL5mAn6l4KtmTBNeeGU1rNzu0VbCOdwA8VZtVY1NpL1t0xMVjZdwd
 Y0PvJLZKvE5kx2/7tBpO212xP1CqmGUXKfMfP92iU9ak5XsSydJaxONA9/4EjyoVuq7d
 sJY1LWs3gUMy8oFHDhXXKyQJGB/zZiQUHBMz4FmODVmE64m89T2AXQ/5TTRcg6JUFo3C
 ntbprA1CfQkjH7od4eo176kGMLSeTdaIEnqbzsjCuUmsMs5Yqvsp50ySE83aH/c6fn+p
 i4cA==
X-Gm-Message-State: AOJu0YyjbsYK2HWV7zunRbQIZenzyUtukkOY4gW0gvHk/bx37jBKJJhg
 oi/qlifKfLDrZ7xtCeij9heSt9K5/nE=
X-Google-Smtp-Source: AGHT+IHJFW8TpttB1Nmg7aTMpG7TEprqJ+S1YH3qz0mFr/JyLM2htqKpbbzfc5TVpWtDLhb7sfbMwg==
X-Received: by 2002:a05:6a20:9146:b0:15e:dc75:66af with SMTP id
 x6-20020a056a20914600b0015edc7566afmr12462033pzc.59.1696693300913; 
 Sat, 07 Oct 2023 08:41:40 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:52e1:f940:d30d:8b60:5b64])
 by smtp.gmail.com with ESMTPSA id
 e18-20020aa78c52000000b00686b649cdd0sm3317539pfd.86.2023.10.07.08.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 08:41:40 -0700 (PDT)
Date: Sat, 7 Oct 2023 21:11:35 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: stefani@seibold.net
Subject: Re: [PATCH v1] samples: kfifo: Fixes a typo
Message-ID: <20231007154135.GB20160@atom0118>
References: <20230817173636.78757-1-atulpant.linux@gmail.com>
 <20230923173157.GB159038@atom0118>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923173157.GB159038@atom0118>
Cc: shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

On Sat, Sep 23, 2023 at 11:02:02PM +0530, Atul Kumar Pant wrote:
> On Thu, Aug 17, 2023 at 11:06:36PM +0530, Atul Kumar Pant wrote:
> > Fixes a typo in a comment.
> > 
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> >  samples/kfifo/dma-example.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/samples/kfifo/dma-example.c b/samples/kfifo/dma-example.c
> > index 0cf27483cb36..112b0e427199 100644
> > --- a/samples/kfifo/dma-example.c
> > +++ b/samples/kfifo/dma-example.c
> > @@ -80,7 +80,7 @@ static int __init example_init(void)
> >  			break;
> >  	}
> >  
> > -	/* put here your code to setup and exectute the dma operation */
> > +	/* put here your code to setup and execute the dma operation */
> >  	/* ... */
> >  
> >  	/* example: zero bytes received */
> > @@ -109,7 +109,7 @@ static int __init example_init(void)
> >  			break;
> >  	}
> >  
> > -	/* put here your code to setup and exectute the dma operation */
> > +	/* put here your code to setup and execute the dma operation */
> >  	/* ... */
> >  
> >  	/* example: 5 bytes transmitted */
> > -- 
> > 2.25.1
> > 
> 
> 	Hi all, can someone review this change ?

			Hi all can someone please review this change ?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
