Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8709BC2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 17:32:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A64F20714
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 17:32:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEqTCp/g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A64F20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB99084F2B;
	Sun,  9 Feb 2020 17:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0QJIcLvGhmYe; Sun,  9 Feb 2020 17:32:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5B55984EEB;
	Sun,  9 Feb 2020 17:32:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EBEBC07FE;
	Sun,  9 Feb 2020 17:32:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 900C8C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 17:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7BEEF878EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 17:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMUuHC3soYr5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 17:32:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DC2EE878B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 17:32:33 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p11so1835794plq.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Feb 2020 09:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=muhOcDUhhtnzARl4eJAvkNMAOOJ2WwTjwza3/x00Fkk=;
 b=oEqTCp/g/OQIlRmBXusWmJecD/S413NQ5zaNsXivUdkDqWHkr+UExoBupjpeSCN5Tj
 47fCXdNfRlJS+vkHt6FFSlN1ne28ir+D4Ywx/vxCeNZWz5F77YktPKM9PoC23jwj6/aI
 dVUaCdT59uyRo3Bu1rOVDCnPc7l0AgrXFPIiuLzaCSnBPMT/S8wDunHKtftqeunx3QRn
 tPYKr4DTjAXOHLfLLBIh7i8RFkjTxQawpBbXWYWKO4VgDK1Ngb12D/l6Q0YNifEQ4oYR
 whM6Loaf6jjw1kYO3EooPMlEe/3aUsSUIc2eLFFXrRoXnZ4xRNRpNMUUw+dGk3K72znW
 bVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=muhOcDUhhtnzARl4eJAvkNMAOOJ2WwTjwza3/x00Fkk=;
 b=dYUVqOvz7jl0HRlsLoqskJIY8XseG0/bw8UBlgXOv3PTwkG0uAOQpnDFrhY04qaiwH
 dGKrFurVsaqgiF+0qLIv180lnpGIXYkDKfAyM0D+121VaTvLrWYHv6pXVNB7zYjdwOfx
 RHpX48B+T/in0mzvVfhaQjjG9oG5q4Of21908W73JTjgPBgEmfjVNOPy6QuKC3ujJfrp
 no0+97cAzGxg1x5x52tjJSGc0Frinikt5swG0peLmlK4GC7Di4VqGIUUtAdewIkrwE2h
 bnzzNh2ncMKIqOkTcYs2Nz2xel7gFJ4s4JTCeu0NHrnOGTtnmY0iPOvawL4NU7v4VzFq
 R1/g==
X-Gm-Message-State: APjAAAVlCVRfr8EPXztdt9sEpHpvrG2NGY12BFQC6jamA1WfBwoKnJo8
 rrlZgtyj++Sd6pGDO+fkqa4=
X-Google-Smtp-Source: APXvYqxUr+G8d913mnxkwX+GpkXa0MPq7T3JGKVu0EC76j5pA/aRcqWxrIqXKBQrVX+QOdNwEIxcQg==
X-Received: by 2002:a17:902:d705:: with SMTP id
 w5mr9148165ply.68.1581269553308; 
 Sun, 09 Feb 2020 09:32:33 -0800 (PST)
Received: from localhost.localdomain ([2405:204:22ac:7250:d1c8:6411:2f12:731d])
 by smtp.gmail.com with ESMTPSA id 64sm9674169pfd.48.2020.02.09.09.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 09:32:32 -0800 (PST)
Message-ID: <beb17020cc87be2d0e63edc0a897a4c0c2975b27.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 09 Feb 2020 23:02:25 +0530
In-Reply-To: <alpine.DEB.2.21.2002091747430.3430@hadrien>
References: <20200209153452.11837-1-jaskaransingh7654321@gmail.com>
 <20200209153452.11837-4-jaskaransingh7654321@gmail.com>
 <alpine.DEB.2.21.2002091747430.3430@hadrien>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH v4 3/3] tests: Add test case to
 match const pointer variants
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

On Sun, 2020-02-09 at 17:48 +0100, Julia Lawall wrote:
> On Sun, 9 Feb 2020, Jaskaran Singh wrote:
> 
> > Pointer to const pointer and its variants would not match
> > previously.
> > Add a test case for matching these types.
> > 
> > Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> > ---
> >  tests/constptr.c     |  7 +++++++
> >  tests/constptr.cocci | 19 +++++++++++++++++++
> >  tests/constptr.res   |  7 +++++++
> >  3 files changed, 33 insertions(+)
> >  create mode 100644 tests/constptr.c
> >  create mode 100644 tests/constptr.cocci
> >  create mode 100644 tests/constptr.res
> > 
> > diff --git a/tests/constptr.c b/tests/constptr.c
> > new file mode 100644
> > index 00000000..13fe064c
> > --- /dev/null
> > +++ b/tests/constptr.c
> > @@ -0,0 +1,7 @@
> > +int main()
> > +{
> > +	const char * const * id;
> > +	const char * * const * id;
> > +	const char * const * * id;
> > +	const char * const id;
> 
> As far as I can see in the Linux kernel, there is no space between
> two *s,
> and there is no space before an identifier.
> 

Well, the test isn't replacing the type here. It's just replacing the
ident as per the matches. So I guess the spaces are preserved as in the
C file.
When replacing the type like say
-t x;
+t y;
Spaces are not added between the stars or the ident.

Sorry if I'm missing something. Do you mean that the C file/res file
should conform to the Linux style?

Cheers,
Jaskaran.

> julia
> 
> > +}
> > diff --git a/tests/constptr.cocci b/tests/constptr.cocci
> > new file mode 100644
> > index 00000000..29f0aa96
> > --- /dev/null
> > +++ b/tests/constptr.cocci
> > @@ -0,0 +1,19 @@
> > +@ r0 @
> > +identifier id;
> > +@@
> > +const char * const *
> > +- id
> > ++ id1
> > +;
> > +const char * * const *
> > +- id
> > ++ id2
> > +;
> > +const char * const * *
> > +- id
> > ++ id3
> > +;
> > +const char * const
> > +- id
> > ++ id4
> > +;
> > diff --git a/tests/constptr.res b/tests/constptr.res
> > new file mode 100644
> > index 00000000..0af4de9a
> > --- /dev/null
> > +++ b/tests/constptr.res
> > @@ -0,0 +1,7 @@
> > +int main()
> > +{
> > +	const char * const * id1;
> > +	const char * * const * id2;
> > +	const char * const * * id3;
> > +	const char * const id4;
> > +}
> > --
> > 2.21.1
> > 
> > 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
