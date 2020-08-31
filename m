Return-Path: <SRS0=Gq3P=CJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4383C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 19:20:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E8B520EDD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 19:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oK07dzDK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E8B520EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4944C2049F;
	Mon, 31 Aug 2020 19:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utrMbZVNspgq; Mon, 31 Aug 2020 19:20:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6B3682036E;
	Mon, 31 Aug 2020 19:20:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5ACA1C0052;
	Mon, 31 Aug 2020 19:20:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA23BC0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 19:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B823B85F71
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 19:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LeSvmiU4QFR4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 19:20:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 94307854D0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 19:20:48 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id s2so346322pjr.4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aa6aqn9122tGXBIpDI/AOlNftMS4Am5GJG39E8WwFfA=;
 b=oK07dzDKLtkSju8l9ALxgilzzB6XyF7O11Ve5INwmv9RKxq6X36t3jepvEa5q8CNqs
 TnmOG3KimNaMU/2QJZZ1ZseeeftJzZhBJRYVE+X+h8r2dD+PpN55WEfZtkgxQEzKKi2P
 GRBwmyN3gz8I1f9OM5aPxOXu8hnJ7LGKCdWDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aa6aqn9122tGXBIpDI/AOlNftMS4Am5GJG39E8WwFfA=;
 b=fEbvkltoe3stixQjKX4gnpxPPJ+5v7dKplniREWFcLnXZNH6oi03ZaAOxvC/qD/usx
 vX3hhzwarQKquottP2UtMlKdDW+l7uMp7oh7p8UR1GvnoxJGtddqNdR7fHHTcfbf7klA
 oFknCas8CDepKdfB1jpTAIMmgpcJbxSxrYAYCVJOuhhJmGL2IrAnQ43/7q8POKvZb+hB
 btERjDV2xUp2wfZ1cry1z4C0tebHUrqcNBlKKmP19LJLHFi/Ig0josZaIT8l2T19AeSQ
 kNwoNk4eNSQuscNGGUTgmDThluDVJdQ7VLbUr9f4zpPY5rxw9tJMQffwxooPiILBF5Tx
 h9mw==
X-Gm-Message-State: AOAM531Vt4RSpHzySzmFWSenfuUeIe+mcJZxXk5/GdKv9axe8H2ZbILW
 HaTBQWyC6iDMOkPw25RN+EE+Pg==
X-Google-Smtp-Source: ABdhPJznehFObRR7Lqvf/9fzo6cME8RmsOZeOGJe7GmzGTye7ow0uvkdJkEz07x9Bk2sjUXZ2j/2bg==
X-Received: by 2002:a17:90b:4a51:: with SMTP id
 lb17mr692847pjb.235.1598901648253; 
 Mon, 31 Aug 2020 12:20:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v4sm338603pjh.38.2020.08.31.12.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 12:20:46 -0700 (PDT)
Date: Mon, 31 Aug 2020 12:20:45 -0700
From: Kees Cook <keescook@chromium.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Message-ID: <202008311219.8ECE17B6B@keescook>
References: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
 <20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org>
 <alpine.DEB.2.21.2008310714560.8556@felia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2008310714560.8556@felia>
Cc: kernel-hardening@lists.openwall.com, maennich@google.com,
 linux-kernel@vger.kernel.org, re.emese@gmail.com, linux-spdx@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux-kernel-mentees@lists.linuxfoundation.org, tglx@linutronix.de
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: Add intended executable
	mode and SPDX license
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

On Mon, Aug 31, 2020 at 07:45:25AM +0200, Lukas Bulwahn wrote:
> 
> 
> On Sun, 30 Aug 2020, Andrew Morton wrote:
> 
> > On Thu, 27 Aug 2020 14:54:05 +0530 Mrinal Pandey <mrinalmni@gmail.com> wrote:
> > 
> > > commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
> > > spdxcheck-test.sh to the repository without the executable flag and license
> > > information.
> > 
> > The x bit shouldn't matter.
> > 
> > If someone downloads and applies patch-5.9.xz (which is a supported way
> > of obtaining a kernel) then patch(1) will erase the x bit anyway.
> >
> 
> Andrew, Kees,
> 
> thanks for the feedback.
> 
> As his mentor, I see two valuable tasks for Mrinal to work on:
> 
> 1. Document this knowledge how scripts should be called, not relying on 
> the executable bit, probably best somewhere here:
> ./Documentation/kbuild/makefiles.rst, a new section on using dedicated 
> scripts in chapter 3 ("The  kbuild files").
> 
> https://www.kernel.org/doc/html/latest/kbuild/makefiles.html#the-kbuild-files

Yes, that would be excellent.

> 2. Determine if there are places in the build Makefiles that do rely on 
> the executable bit and fix those script invocations. (Kees' idea of remove 
> all executable bits and see...)

I think this has value, yes. I don't think patches to remove the x bits
are needed, but any cases where they are depended on need to be fixed.

And I think "3" could be "wire up or remove spdx shell script"

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
