Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2B8C33CAA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 06:28:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C24522522
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 06:28:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaMItUg1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C24522522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D5982878ED;
	Tue, 21 Jan 2020 06:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kI954F-5jE71; Tue, 21 Jan 2020 06:28:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0CBA2878E3;
	Tue, 21 Jan 2020 06:28:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E88ECC0178;
	Tue, 21 Jan 2020 06:28:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8FDFC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 06:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B025A878E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 06:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hGZB5orU2vCe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 06:28:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2481C87368
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 06:28:03 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id a6so891362plm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jan 2020 22:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=p5yJ8Z8XAUEesX2qNHrk5cjCYwtFfYQhAcgOhIYm1/k=;
 b=kaMItUg1jSXqkWXE9RYXG6GdZQyT6NTlBish9gNPhKcYj5apQnRU92WloscPYSDbI5
 rB8WDSCAtvGMMsq84BI2LXNL+bzkhyrKXlt7inNPl5rsS208jX3UFjU34P50trOSFhfD
 ddng7jLawCEi4cZr8s9OSfVxI0iDflag1xwN/vsHVWTLj9Ic40uXRDItMCN9LliPynj/
 Gt89uy8QtE9pWP2fyYhcMaGzW2ciOJGkxWfnQkPvdnTc8RLlgnI8Txjdr2ngOB5eG2hq
 C2W9Gg12Be7wTnl32PPir9STGYVAlxCwnwk1PCQb9AjmRTHz6yQ45w9H2Hu6+EOUTfz+
 4pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=p5yJ8Z8XAUEesX2qNHrk5cjCYwtFfYQhAcgOhIYm1/k=;
 b=Iue53HRo+VE7SFjDT+kMcFA4OzKwCyuOVENF9EJZKMGQPpVIMtTCSoFpHY49RvTBjC
 haV7uaBPpjKlh7/hjq7Bm3vWk2uLTh015zXPVtnNkXGDWeGva86qfu/1S3a8qyoW64Ng
 Pjh86p9ZOolFB4EF4/BBmlfBWEJB7aHpd+Dhtq92DyzHx56AluH8wGW6u2cMWYJVvRoG
 FNu9ySNcpo+O075TQC1w5SFMmJDw00iSrTXXMq5sboYcJl1M9lwg8ZxvQX7h2xt9o5jc
 uui/FEht1ZMiWFnBCjPUq7PMimGBF/Kj8LTJQqZRYwdmQ11chPGSZpv+xiM6sdU/rJki
 ZAWQ==
X-Gm-Message-State: APjAAAURS0HnTF8R79GoWcjDh2UinH7XHkgZ9z8Zs7LYBGqrTDTBpgOH
 yME+Kw+GNt6D2vX+YEva/z8=
X-Google-Smtp-Source: APXvYqxUo2eZAP7BfSuJrH/h2gf4KGmT5THy6BzIwYWwUXRzTlc3mKlC5lkS7j28g6NAEW4nwZ1JMQ==
X-Received: by 2002:a17:90b:4398:: with SMTP id
 in24mr3573540pjb.29.1579588082547; 
 Mon, 20 Jan 2020 22:28:02 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:da7:fcf8:ab67:c0bb:e29])
 by smtp.gmail.com with ESMTPSA id
 c17sm40774161pfi.104.2020.01.20.22.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 22:28:02 -0800 (PST)
Message-ID: <7fc95d036dbda26e6540839ef25c5c09c21ca747.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 21 Jan 2020 11:57:58 +0530
In-Reply-To: <alpine.DEB.2.21.2001210619100.2301@hadrien>
References: <20200119134812.32748-1-jaskaransingh7654321@gmail.com>
 <alpine.DEB.2.21.2001210619100.2301@hadrien>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [PATCH] parsing_hacks: Add bool to list
	of known typedefs
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

On Tue, 2020-01-21 at 06:20 +0000, Julia Lawall wrote:
> 
> On Sun, 19 Jan 2020, Jaskaran Singh wrote:
> 
> > bool is widely used in the Linux kernel. Certain cases of
> > parsing_hacks.ml would mislabel bool.
> > 
> > Add bool to the list of known typedefs.
> > 
> > Stats of --parse-c on Linux v5.5-rc4 are as follows:
> > 
> > Before:
> > 
> >   nb good = 18956150,  nb passed = 134062 =========> 0.70% passed
> > 
> > After:
> > 
> >   nb good = 18956150,  nb passed = 134073 =========> 0.70% passed
> 
> Why did nb passed increase?  These are tokens that will not be able
> to be
> transformed by a semantic patch.
> 

I suspect it's instances of nokprobe_inline in
linux/kernel/trace/trace_kprobe.c. They're marked as CppMacro.

Here's results from my diff:

20402,20406c20288,20294
< passed:bool 
< passed:bool 
< passed:bool 
< passed:bool 
< passed:bool 
---
> passed:nokprobe_inline 
> passed:nokprobe_inline 
> passed:nokprobe_inline 
> passed:nokprobe_inline 
> passed:nokprobe_inline 
> passed:nokprobe_inline 
> passed:nokprobe_inline 
20407a20296,20297
> passed:nokprobe_inline 
> passed:nokprobe_inline 
20408a20299,20300
> passed:nokprobe_inline 
> passed:nokprobe_inline 
20409a20302,20303
> passed:nokprobe_inline 
> passed:nokprobe_inline 
20410a20305,20306
> passed:nokprobe_inline 
> passed:nokprobe_inline 

Cheers,
Jaskaran.

> julia
> 
> > Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> > ---
> > The above diff has been obtained after applying
> > https://www.mail-archive.com/cocci@systeme.lip6.fr/msg06706.html
> > 
> >  parsing_c/parsing_hacks.ml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/parsing_c/parsing_hacks.ml
> > b/parsing_c/parsing_hacks.ml
> > index 685a4908..5e3301a0 100644
> > --- a/parsing_c/parsing_hacks.ml
> > +++ b/parsing_c/parsing_hacks.ml
> > @@ -61,7 +61,7 @@ let is_known_typdef =
> >        | "u_char"   | "u_short"  | "u_int"  | "u_long"
> >        | "u8" | "u16" | "u32" | "u64"
> >        | "s8"  | "s16" | "s32" | "s64"
> > -      | "__u8" | "__u16" | "__u32"  | "__u64"
> > +      | "__u8" | "__u16" | "__u32"  | "__u64" | "bool"
> >          -> true
> > 
> >        | "acpi_handle"
> > --
> > 2.21.1
> > 
> > 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
