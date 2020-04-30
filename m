Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBC3C47247
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 19:57:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18AED20774
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 19:57:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="XqTNUK6O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18AED20774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D66F788164;
	Thu, 30 Apr 2020 19:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phoViZS4v-A4; Thu, 30 Apr 2020 19:57:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB87988162;
	Thu, 30 Apr 2020 19:57:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFB09C0889;
	Thu, 30 Apr 2020 19:57:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 276DDC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0F32B87053
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68iKxzQyR0g7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:57:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7F38487051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:57:29 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z90so6111210qtd.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 12:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=LQzvuTiDzxPg8UH93cWpbzSYrqHmgu+qFCbwAwEqzrw=;
 b=XqTNUK6OjR2wnrjL1ekQ59FruO/L9hC7avESb1TAex4GM8KYVyffZ4+yeO3rgDBoUD
 2JM7qmOtjmkqyIbqGgDTxKdj5aKTTJrwcU2x+hGF68kCCaX1o+7t6EjfKZLsbCSKeyi/
 dQ37o9HIVVPZfBhMBhSOAOf3H+zo6qz7bd/Bkc8SWtEUNLvc8F8e6AQAX5CaQouOqCU+
 W1at4ORGUGKKdS6YPURLv15trAp09e+ejrSOJV3YzgCUzRS0zVOUOGVjXAk1yqsJ5q8O
 8OAtOt19hNTrv9zqMmpE7gQlUN9IC7CQpFeBjFDh661QROIIOSonPON3ipKsxtySNr/F
 2IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=LQzvuTiDzxPg8UH93cWpbzSYrqHmgu+qFCbwAwEqzrw=;
 b=eUxAgmbHn7DHs5r5kNBMG0u3JB88F9W7lhMOWb0l/7jvYLSj0sD+EwIw63voPqhv+O
 2NTjIHWqSt2I2sQ0gNv1grcUXoydce1OtIKt8xdUSW/A7CNR23R0auC5cc15KnfALRzl
 GTDULr5q7nOi3ba7B17jEZXptBBJottrckN5bhsyBft1R5AOiZ+B0EvXFlXAuIJoIRke
 4owxmdUpg1PVCxkdwa63LmhFGZk6mssw2q/0ezzt15qqxEAjm3UF6h0Qkmo17sIj9nK2
 VHK2u5hQbzXuE4GCqvm12s7JxhGW8s+ys4Bv7W0zmmzmHrmMABspLI/hKT/jjdJ3+f51
 U02Q==
X-Gm-Message-State: AGi0PuZLNELr4ybrZANPa+PS45SLdcxjya4rMdJUIyv0zwH2dcHefEH4
 cnzojiVqaUHCgqzMx0eyOEbk+A==
X-Google-Smtp-Source: APiQypLeHtVRo31TWgHmb+0zDjdx4VCsPKzmGa+gDrrI/ELs5FpHmKX0AdnqBHMTMiWGBPap150b5Q==
X-Received: by 2002:ac8:470e:: with SMTP id f14mr151315qtp.87.1588276648462;
 Thu, 30 Apr 2020 12:57:28 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id b19sm861386qkg.72.2020.04.30.12.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:57:28 -0700 (PDT)
Message-ID: <07d33cf9937c89519bafc9210a98dab42579e681.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 30 Apr 2020 16:57:24 -0300
In-Reply-To: <20200430134704.236c612b@lwn.net>
References: <20200430190737.80950-1-vitor@massaru.org>
 <20200430134704.236c612b@lwn.net>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: martin@omnibond.com, linux-doc@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 devel@lists.orangefs.org, hubcap@omnibond.com
Subject: Re: [Linux-kernel-mentees] [PATCH] docs: filesystems: fix `make
	htmldocs` warning
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

Hi Jon,

On Thu, 2020-04-30 at 13:47 -0600, Jonathan Corbet wrote:
> On Thu, 30 Apr 2020 16:07:37 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > make htmldocs
> > Documentation/filesystems/orangefs.rst:124: WARNING: Literal block
> > expected; none found.
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  Documentation/filesystems/orangefs.rst | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/filesystems/orangefs.rst
> > b/Documentation/filesystems/orangefs.rst
> > index e41369709c5b..628dc220567e 100644
> > --- a/Documentation/filesystems/orangefs.rst
> > +++ b/Documentation/filesystems/orangefs.rst
> > @@ -119,9 +119,7 @@ it comes to that question::
> >  
> >      /opt/ofs/bin/pvfs2-genconfig /etc/pvfs2.conf
> >  
> > -Create an /etc/pvfs2tab file::
> > -
> > -Localhost is fine for your pvfs2tab file:
> > +Create an /etc/pvfs2tab file. Localhost is fine for your pvfs2tab
> > file::
> >  
> >      echo tcp://localhost:3334/orangefs /pvfsmnt pvfs2
> > defaults,noauto 0 0 > \
> >  	/etc/pvfs2tab
> 
> Thanks, but this has already been fixed in docs-next.

Sorry about that. I searched but I didn't find the documentation tree.
Could you point me to the git url?

Thanks,
Vitor

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
