Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C768EE95A61
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 15:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5122460F89;
	Sat,  7 Oct 2023 15:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5122460F89
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gCEXlBJt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L97c0cCNZcv1; Sat,  7 Oct 2023 15:39:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 331B560BEB;
	Sat,  7 Oct 2023 15:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 331B560BEB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BDA4C0039;
	Sat,  7 Oct 2023 15:39:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF786C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 951A641E71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951A641E71
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gCEXlBJt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GkTDsEr9XPa6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:39:08 +0000 (UTC)
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F48741C54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F48741C54
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1dd1714b9b6so2072279fac.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Oct 2023 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696693147; x=1697297947;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0lJN7RuCz9ZjltjJkr63VcR1vl5+W7ycDgx1Cg/Hr84=;
 b=gCEXlBJtkOetYrSYELBbcPS8NIaAHTwtP9EPxf2LXYvp5KEZtJxTTfEONHFm1jniAW
 65tc5Cd0u6S5RCSZklRuUaOxn1Bqmk2YjM67eIAIsSPA+van32aZV+xlExD+1ekphZIR
 G5b33M6KlsQqWd+baIH34YbYbi3VdnSJsVwH/8tYe60z+6L3Eo8TJXjOfcP1/eTM7rGF
 GAFu/yQtq3t/EceI99N0BIsuukG1t6u5UnnIB2D1Gz0ySdPebvM8WsshFWBQw9tCmAsV
 4/qhUJCytPWQ/KFJ5ke7CDNiL1iy+eHA5KGzBr69NGP+GX0nmkvXEjhjZbZJnIkER9r0
 AJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696693147; x=1697297947;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lJN7RuCz9ZjltjJkr63VcR1vl5+W7ycDgx1Cg/Hr84=;
 b=fbs2FgJ87JG84GjLdbHnlVrU0OmCg2VJ4q0mg4HcngCVQ7YRN+XZy/cTJ+mOOGK/Ob
 HW9Cs9OyTEgT72emIyHhcfjVt9ysLRKtBiOD+iLB+PgLkQ+0W1uu8l+wniwuUiBmM8F5
 1dxc1BY/tbcmUSMH4NmWav+KM+A0yHbooSpyJIfmpA7/ImLl2zcn8YFt44gGG7OzN7nQ
 h8JKsWoS2W50NYQO6c+UDDlYDxVyumHj9oZtUkP418tseKgJtsILImyAJtqSJ9PCLreN
 Idsp/w6ZCvItU2ST/Po/tVh3hNKhWGY96YSQgE3E4SCCFAgFwR/wA6Klr7VXBsXPcBsp
 GMTA==
X-Gm-Message-State: AOJu0YzpOt1sJ9p3eqjBgJJYOZ+GBY38Lv5WiHbJ0m4bjLEDR7JB4iAp
 L9hjsam0vV+hWshazyis3uw=
X-Google-Smtp-Source: AGHT+IFCF+7ptEknYG3uxPPktuAFWsMzDhdeQdX0H5Xy/UH2i3owgjFXHpdjxFEMJ3W1E/Emi9KBcg==
X-Received: by 2002:a05:6870:d689:b0:1c8:bbd0:2fc9 with SMTP id
 z9-20020a056870d68900b001c8bbd02fc9mr12466971oap.49.1696693147062; 
 Sat, 07 Oct 2023 08:39:07 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:52e1:f940:d30d:8b60:5b64])
 by smtp.gmail.com with ESMTPSA id
 j5-20020aa78d05000000b0068842ebfd10sm3300016pfe.160.2023.10.07.08.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 08:39:06 -0700 (PDT)
Date: Sat, 7 Oct 2023 21:09:00 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
 davem@davemloft.net, mhiramat@kernel.org
Subject: Re: [PATCH v1] samples: kprobes: Fixes a typo
Message-ID: <20231007153900.GA20160@atom0118>
References: <20230817170819.77857-1-atulpant.linux@gmail.com>
 <20230923173040.GA159038@atom0118>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923173040.GA159038@atom0118>
Cc: shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
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

On Sat, Sep 23, 2023 at 11:00:46PM +0530, Atul Kumar Pant wrote:
> On Thu, Aug 17, 2023 at 10:38:19PM +0530, Atul Kumar Pant wrote:
> > Fixes typo in a function name.
> > 
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> >  samples/kprobes/kretprobe_example.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/samples/kprobes/kretprobe_example.c b/samples/kprobes/kretprobe_example.c
> > index cbf16542d84e..ed79fd3d48fb 100644
> > --- a/samples/kprobes/kretprobe_example.c
> > +++ b/samples/kprobes/kretprobe_example.c
> > @@ -35,7 +35,7 @@ struct my_data {
> >  	ktime_t entry_stamp;
> >  };
> >  
> > -/* Here we use the entry_hanlder to timestamp function entry */
> > +/* Here we use the entry_handler to timestamp function entry */
> >  static int entry_handler(struct kretprobe_instance *ri, struct pt_regs *regs)
> >  {
> >  	struct my_data *data;
> > -- 
> > 2.25.1
> > 
> 
> 	Hi all, can someone provide comments on this change.

			Hi all, can someone please review this change. It has been not
			reviewed for quite some time.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
