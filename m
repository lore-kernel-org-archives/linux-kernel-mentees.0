Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE3EC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 13:49:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C9E208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 13:49:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFcJMu9y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09C9E208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 82D2E20343;
	Mon, 14 Sep 2020 13:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r449FtQrV4QN; Mon, 14 Sep 2020 13:49:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0CC1D2012F;
	Mon, 14 Sep 2020 13:49:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E97F3C088B;
	Mon, 14 Sep 2020 13:49:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBC99C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 13:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B38FB20335
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 13:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ztHy9S7xSPu9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 13:49:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by silver.osuosl.org (Postfix) with ESMTPS id 7ABD22012F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 13:49:08 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id o8so23360623ejb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 06:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=si34mStr7oXSWYl7tcrPfU4neEp4XSY7WT7jh9hN/AU=;
 b=fFcJMu9yFipO+8hw6+rdo2CRu2T6asf7wGOflpvA0GJL1IU+JAvCCMjG7N8UCIYMhw
 kLqiMaSm6SMQSrQk54bChbNrZGqxrxrBx+qCvDFINjD4HFBX/oZSHI5UclIirXeN8UwM
 jJZISyNbIoxoFfagOXJnXUm/iDC5PtuIxsMCqaQV7jLZrGvpRPcnLKAW/VitG/8zMZBN
 /Qq9xtiuqGD08Pz30Buh9q+9Ffwa7B9dfB/IChtKm4w/XPtrowtdLkn6+v3Nrj6ix7oA
 S96XlEVh1yl9JvIa5JLirkQzKKnhU5fDUX6bGcZLvNvtobOINpoAROxHUqNAFygw2emr
 IHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=si34mStr7oXSWYl7tcrPfU4neEp4XSY7WT7jh9hN/AU=;
 b=oCaWashGCRa3bLQ+R2kAcdajEp8I3sewUGTszJpL0kahByDdhpW9NRSN2oq/brCS30
 Sz+VQANXnqc1snD4xMwMMKUK7PwmkIxfEniNWo6q82coDwNrefXSEKpCG7JKRF+QwtvU
 aJkHjmlshezwFhlnNjuy/IlDmzpoK3knoffc0JfLr+yhZZ+VbzxtJvOAFd6s2kN3B1sr
 o5iGE3SAFHb/DoZgZe8L7PE7I+8zkIHB9f3Nl1ZUqM+5+yAENBakYNPxUazWd4UQYqOh
 d/OCi45ehnuYQ5U5TDHovboKQYn4m1Lng0KDzXnpOGcaE3FxlhViynaQREMFt0Qee5Yo
 WnTw==
X-Gm-Message-State: AOAM533gZFuHAxXo65YKoYRrshff+9gSOFhjIDd9ZFnNVaby+35Y73XB
 Z2dTtmdxkJFxG1AJL3IkP28=
X-Google-Smtp-Source: ABdhPJzNmpZdNK5zlzbv0jr4k/HAGnPaor+Xd4LrqxVr6WWnq+7/09G/s/w7EkfEWcG8lxZjCzR/2w==
X-Received: by 2002:a17:906:b7c1:: with SMTP id
 fy1mr14474285ejb.342.1600091346852; 
 Mon, 14 Sep 2020 06:49:06 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id h64sm3470556edd.50.2020.09.14.06.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 06:49:06 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 15:49:04 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5D87ZVTfZ4QHxp5vweTN16LQCy+rniq-uDVCvKkbYRDNg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009141535010.17999@felia>
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
 <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
 <alpine.DEB.2.21.2009140716420.7737@felia>
 <CABJPP5D87ZVTfZ4QHxp5vweTN16LQCy+rniq-uDVCvKkbYRDNg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-593608332-1600091346=:17999"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-593608332-1600091346=:17999
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 14 Sep 2020, Dwaipayan Ray wrote:

> 
> 
> 
> On Mon, Sep 14, 2020 at 10:47 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> >
> >
> > On Mon, 14 Sep 2020, Dwaipayan Ray wrote:
> >
> > >
> > >
> > > > You should also try to find a case where checkpatch.pl can be improved:
> > > >
> > > > - It is best if you look at the checkpatch.pl error/warning reports and
> > > > check if you can find a class of typical false positives in the reported
> > > > data. Then, think about how to make the pattern in checkpatch and propose
> > > > a patch to checkpatch.pl on this mailing list; with the evaluation data
> > > > backing that your patch really improves the situation. We will then test
> > > > and check your patch as well.
> > > >
> > > > - If you really cannot find a typical false positive, maybe you can take
> > > > the task from Ayush to fix checkpatch with git ranges?
> > > >
> > > Hi,I will try to find and evaluate the possibiltiy of such a case, and report my finding
> > > as soon as I find something substantial.
> > >
> > > I may also require some advice from you on the patch submission process.
> > >
> >
> > That is what a mentor is there for, but try hard to understand the
> > warnings yourself first. This is a mentorship, not a tutorial.
> >
> > Lukas
> Hi,
> I looked into the checkpatch.pl 's output I collected. And I have found some possible candidates
> but I would like your opinion on them.
> 
> The first one is double warnings for the same kind of coding style error.
> If an SPDX tag is in the following format: "// SPDX-License-Identifier: GPL-2.0",
> then checkpatch.pl generates two warnings:
> 
> 1) Improper SPDX comment style for ... , please use '/*' instead.
> 2) Missing or malformed SPDX-License-Identifier tag in line 1.
> 
> Example: commit 726721a51838
> Warnings generated:
> 
> WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'kernel/trace/trace_synth.h', please use '/*' instead
> #4041: FILE: kernel/trace/trace_synth.h:1:
> +// SPDX-License-Identifier: GPL-2.0
> 
> WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
> #4041: FILE: kernel/trace/trace_synth.h:1:
> +// SPDX-License-Identifier: GPL-2.0
> 
> In my opinion, only one warning should suffice if a '//' comment style is used in spdx tag. 
> But I would like to know your view on it.
> 
> ----------------------------------------------------------------------------------------------
> The second candidate is related to the following warning:
>

I do not think that this is a good candidate.
 
> WARNING:SPDX_LICENSE_TAG: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Clause)
> #110: FILE: Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml:1:
> +# SPDX-License-Identifier: GPL-2.0-only
> 
> In checkpath.pl line 3209:
>  $fixed[$fixlinenr] =~ s/SPDX-License-Identifier: .*/SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)/;
> 
> The desired fix is "(GPL-2.0-only OR BSD-2-Clause)" . Shouldn't the identifier be "GPL-2.0-only" 
> or "BSD-2-Clause", that is either of them? Or was the former the decided one?
>

Hmm, I do not think so. It is supposed to be dual-licensed with 
GPL-2.0-only and BSD-2-Clause. In SPDX, this is written exactly as 
described in the provided warning of checkpatch.pl.
  
> ----------------------------------------------------------------------------------------------
> The third candidate is related to the warning:
> 
> WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author ...
> 
> I found several such commits in which the author had used different mail addresses in the 
> signed-off -by section, due to which this warning is generated.
> 
> An example is Commit dc5bdb68b5b3 .
> Git log show:
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> ....,.
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> This is infact a common scenario. I easily found another commit 207324a321a8.
> Git log shows:
> Author: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
> ...
> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
> 
> This warning could be avoided or at least handled better.
> 
> 
> I would like to know if any of them can be worked on.
> 

This last one might be good to look into.

But what is your specific solution you have in mind?

There is a file .mailmap in the repository that allows some kind of 
mapping. Maybe that is helpful.

I suggest that you describe your proposed change in a clear way.
Then, we can discuss if that change is reasonable or not.


Maybe you can continue to look at further potential candidates, just to 
see if there is another type for improvement.

Best regards,

Lukas
--8323329-593608332-1600091346=:17999
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-593608332-1600091346=:17999--
