Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A29CDB473
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Oct 2023 18:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F54041E84;
	Wed, 11 Oct 2023 18:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F54041E84
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hMICm8iY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJESSskvwxjP; Wed, 11 Oct 2023 18:03:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3017541E59;
	Wed, 11 Oct 2023 18:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3017541E59
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04538C0039;
	Wed, 11 Oct 2023 18:03:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBFA2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 18:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93ADC41E68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 18:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93ADC41E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7OR1WSkvYi1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 18:02:57 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1385A41E59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 18:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1385A41E59
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-27d129e2e7cso39046a91.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 11:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697047376; x=1697652176;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IhrDqt6wT+HBPU0WXsWFtClOPq+53ObuSHJOrsqvDGI=;
 b=hMICm8iY1fftIqBlHjkjX3ptvkrhlLnjCL+Xpd+d9OuBK5bdz+oFC1BC5dPHzZZY13
 QvruRLzdy1dSBV1bl1drsP6Qi4omQhx4NVjsinTw1SBSJsg0H4t5vBV3CeP3ygYraKt1
 hjnIvPBb0n6UYktiBo6QNctEYHbj/ohJwvjsA/oUkoMDL501dX6LUoUekTshY6eH2vTp
 6scbcRK6YMdn+5GasDlr/+rOmxqKjgro47ghd4k2u7yegpdpxoKQ4P/oGZfD7082DiOM
 G+thdonFVY2mphYvdUDM0JEkUGda2MY7c39U8WmnnAi/3Ddv+72+10r209hTYWi256WX
 7O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697047376; x=1697652176;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IhrDqt6wT+HBPU0WXsWFtClOPq+53ObuSHJOrsqvDGI=;
 b=BrqOp/tOReLB2y1mdpaSSKT7T9NHYM8YrRunsXRvPYINqlQAFdzvRSgMHnCsIJobaN
 /xdUgaMLxSV3RIx4fxceuc+j87m7KZUXCtAgVWhb3srnQRbH9OPydxPfcGuynq/mpfqK
 aWkK+YMoYmLHwo3wEtCB45NEbGCuxiLgGy08/F7M8QQB2YIPlgLNmkLuY7J6QGNE02kk
 2n8N6fSETbIOzkk6z91skiYpPOTW4QSuPvNTE6EWVWthd53JadTy0fE1J2frZrH5MZ6k
 iqlnXdWCDS5t7bmtuV895dC3yGYxGtNtYQLdi9xGxkRUcgMbH2VYuXKVhqJn0CVGRFre
 ABCA==
X-Gm-Message-State: AOJu0Yxcmo14Jwvo3uerAeL1v5SHmcXQquIIvG0R7FrZGSFOP7diFJJd
 QlBCZHwl0JpV8I+xxh57feY=
X-Google-Smtp-Source: AGHT+IG/ziOao/lKdC5T4mQ05hUhMzyts3NQzjrRBzke7glqqWrfDqejAnL3KiRfOQg5siWisUwPoA==
X-Received: by 2002:a17:90a:fd8e:b0:27c:fc09:401d with SMTP id
 cx14-20020a17090afd8e00b0027cfc09401dmr3995106pjb.38.1697047376352; 
 Wed, 11 Oct 2023 11:02:56 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:52e1:23ff:45f1:c6fe:e28c])
 by smtp.gmail.com with ESMTPSA id
 f64-20020a17090a704600b0027ce7ee8859sm239240pjk.13.2023.10.11.11.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 11:02:55 -0700 (PDT)
Date: Wed, 11 Oct 2023 23:32:48 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1] samples: kprobes: Fixes a typo
Message-ID: <20231011180248.GA51067@atom0118>
References: <20230817170819.77857-1-atulpant.linux@gmail.com>
 <20230923173040.GA159038@atom0118>
 <20231007153900.GA20160@atom0118>
 <20231009095103.6d08e72a@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009095103.6d08e72a@gandalf.local.home>
Cc: shuah@kernel.org, linux-kernel@vger.kernel.org,
 anil.s.keshavamurthy@intel.com, mhiramat@kernel.org,
 naveen.n.rao@linux.ibm.com, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, linux-trace-kernel@vger.kernel.org
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

On Mon, Oct 09, 2023 at 09:51:03AM -0400, Steven Rostedt wrote:
> On Sat, 7 Oct 2023 21:09:00 +0530
> Atul Kumar Pant <atulpant.linux@gmail.com> wrote:
> 
> > On Sat, Sep 23, 2023 at 11:00:46PM +0530, Atul Kumar Pant wrote:
> > > On Thu, Aug 17, 2023 at 10:38:19PM +0530, Atul Kumar Pant wrote:  
> > > > Fixes typo in a function name.
> > > > 
> > > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > > > ---
> > > >  samples/kprobes/kretprobe_example.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/samples/kprobes/kretprobe_example.c b/samples/kprobes/kretprobe_example.c
> > > > index cbf16542d84e..ed79fd3d48fb 100644
> > > > --- a/samples/kprobes/kretprobe_example.c
> > > > +++ b/samples/kprobes/kretprobe_example.c
> > > > @@ -35,7 +35,7 @@ struct my_data {
> > > >  	ktime_t entry_stamp;
> > > >  };
> > > >  
> > > > -/* Here we use the entry_hanlder to timestamp function entry */
> > > > +/* Here we use the entry_handler to timestamp function entry */
> > > >  static int entry_handler(struct kretprobe_instance *ri, struct pt_regs *regs)
> > > >  {
> > > >  	struct my_data *data;
> > > > -- 
> > > > 2.25.1
> > > >   
> > > 
> > > 	Hi all, can someone provide comments on this change.  
> > 
> > 			Hi all, can someone please review this change. It has been not
> > 			reviewed for quite some time.
> 
> That's because trivial typos in comments are considered very low priority,
> and are usually only added (if they are ever added) if the maintainer has
> extra time, which may not be for a while.
> 
> -- Steve

	Thank you Steve for the response. I wasn't aware of this.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
