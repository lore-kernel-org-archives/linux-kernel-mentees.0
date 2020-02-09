Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23F3C35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 07:58:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 978212080C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 07:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTNRzJZW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 978212080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6052287B4A;
	Sun,  9 Feb 2020 07:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHf4CaC0jbDm; Sun,  9 Feb 2020 07:58:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 513C687B41;
	Sun,  9 Feb 2020 07:58:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43CBEC07FE;
	Sun,  9 Feb 2020 07:58:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4754C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 07:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 98BEF85C90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 07:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hS0WRvBawnbj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 07:58:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F40408493F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 07:58:54 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p11so1523692plq.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 08 Feb 2020 23:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ZpZfmzGs4r1Dp/eldBJTZ7WssIJu2WG1En28LoOksKA=;
 b=UTNRzJZWLImZhLBgUmVlirc4cNhtpXalSf4ekj5rtnXPabXgQcK0kG3n0uvdzFvEi4
 ydFW9h8TDrlsZywV5lrN0WvE81ywMySaqxC3Vy0/f8vWoq+0Mi6BZoDHflvSondlxHX3
 idY0YQPobVkxS2BKKcTmBqKBC2rg0aG51zcDFcGEKJCzJcPpWfaIyzymdE+v6e5h8h7E
 voCdCS4QRoLCK8LwuImH2oBxfKONDmlCbQOa9nOQ6BdJIA4qXRu5kZqZgjk6Qi0UUQOf
 qPiFxOk0nK7IRkE3iM/qv8qGNF/lXMY/YbjnlDpxzbr4AoR+5IR66jZkpyg8ioYc4NrU
 RdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ZpZfmzGs4r1Dp/eldBJTZ7WssIJu2WG1En28LoOksKA=;
 b=hdfAkdwF2oPhGJcPVNkGNScOwB/xF8dNG9WsLDb4OmaGD5PlLOtvrrQec5+3ZijTtN
 wYDj8lQ8Vniau9kIhW5xAA8KsZqc842crtTWv1jki0dRIMR31S64NTA/Vgin+QHIq8sW
 Qz3vbpx7bYp9tBjQ/bQvkue2TKjqmdKl1SU4IyzxuHkUUwH5f3rwJhwOHysC7lDTaFJF
 X25foKpGcieXcTrqPTi+Vr96JdZjkNNBsVzcFh3GTCCNLjGlJ25ceKlxX0UWC1VwAY6A
 cUqNHc5JHojGuP1W79KLPXxYfCx4++Lye80nC//DhAeyEBi5MhmYnxAi5TnC0twuJF2P
 Gztg==
X-Gm-Message-State: APjAAAXLwWKhElPIIRiUEtz3TLUU30iTrZoyWGcJVU0JEplhWUbv+PJb
 laU+fLsih0rmpS/CrQSabYA=
X-Google-Smtp-Source: APXvYqwmqqvMGvawpvU3dieaQjBeXEB+6c6mbhN2A5Ocn5kunxP2vN8yTeexzgJRf/i7u/Z/Ui3HBg==
X-Received: by 2002:a17:90a:3603:: with SMTP id
 s3mr14261282pjb.61.1581235134319; 
 Sat, 08 Feb 2020 23:58:54 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:166e:dca2:8d98:ad42:3c3b:8544])
 by smtp.gmail.com with ESMTPSA id l10sm7822973pjy.5.2020.02.08.23.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 23:58:53 -0800 (PST)
Message-ID: <c97f4e5641f8c68e35ae6f0e00940762c84dc2ac.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 09 Feb 2020 13:28:49 +0530
In-Reply-To: <alpine.DEB.2.21.2002090817580.3430@hadrien>
References: <20200205130327.6812-1-jaskaransingh7654321@gmail.com>
 <20200207060938.9531-1-jaskaransingh7654321@gmail.com>
 <20200207060938.9531-3-jaskaransingh7654321@gmail.com>
 <alpine.DEB.2.21.2002090817580.3430@hadrien>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] tests: Add test case to
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

On Sun, 2020-02-09 at 08:20 +0100, Julia Lawall wrote:
> On Fri, 7 Feb 2020, Jaskaran Singh wrote:
> 
> > Pointer to const pointer and its variants would not match
> > previously.
> > Add a test case for matching these types.
> 
> I don't get any matches for this test.  If I split the semantic patch
> into
> four separate rules, then I get the change for id2 and id4, but not
> for
> the other two.
> 

That's weird, it works fine for me. I get this on both bytecode and
native builds.

--- tests/constptr.c
+++ /tmp/cocci-output-31326-084eed-constptr.c
@@ -1,7 +1,7 @@
 int main()
 {
-	const char * const * id;
-	const char * * const * id;
-	const char * const * * id;
-	const char * const id;
+	const char * const * id1;
+	const char * * const * id2;
+	const char * const * * id3;
+	const char * const id4;
 }


On the other hand, I get the id2 and id4 result with upstream.

--- tests/constptr.c
+++ /tmp/cocci-output-5387-a9b63b-constptr.c
@@ -1,7 +1,7 @@
 int main()
 {
 	const char * const * id;
-	const char * * const * id;
+	const char * * const * id2;
 	const char * const * * id;
-	const char * const id;
+	const char * const id4;
 }

Could you check if you've applied 1/2 first?

Cheers,
Jaskaran.

> julia
> 
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
