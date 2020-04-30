Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08290C47258
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 21:22:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C180E2166E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 21:22:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="DrKIrrdW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C180E2166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9DBDA8892E;
	Thu, 30 Apr 2020 21:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnVHyi2OFghw; Thu, 30 Apr 2020 21:22:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1630488928;
	Thu, 30 Apr 2020 21:22:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09863C0889;
	Thu, 30 Apr 2020 21:22:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC25BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 21:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D821886FD8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 21:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wg0RfaXqCc6Y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 21:22:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2DFBF86EA2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 21:22:12 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e17so6360634qtp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 14:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=mv1U7YozJfnchal4lfvuT60duHRfjYBO+uZmYOeQypI=;
 b=DrKIrrdWt/QtIh54BbVwtdHACJ3lbs49nTlxebUUCaoR+47bYBQ/s4uvEGAbiFkB6F
 HmBMPXuWqqmCaHaEmtaRIxDRWhX0BWsQmUHAheQJfy/SeKcRSWvjuo6yRfkpwDUeZC6I
 Yh7rMhslY9sgpTbAPiOvZwi+w1gfYzvSMUay3JD/oFNp9QM2PMzRKAsc5/E1UivG/8KK
 74HbMo5ZgYHw3sN3kdxKHXJ3Xx/bh98ylG3my/XBpO6msDvM0vNYN3yeQfQiGw/obTYH
 9cKsSuw+10PZADEHyF2QMdAoaH9DNcM2/MSInKc+JIxZUz29BbUwT4Lp2sQ1hVRY/9Rv
 fBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=mv1U7YozJfnchal4lfvuT60duHRfjYBO+uZmYOeQypI=;
 b=KEnXhFQGNOcFiuMxbcDeb7+gU1JU3Xlm3dmTZlQMzNylCtNLThfY0L9pvIiRUYjZCr
 dVZEiePqO3pRsjqLpTphLR7PqBMPW3cYSHjSYjGGyw5ZKmTWDkJrlEqXsbAgOz1HRcSP
 adOuucC6L/PC703oa/kcv3N3Ae4KF7LXZDbJk7JEJoI0grZybvoMw56GGYgjqPRVZ+/N
 GkfsrGFOfk+YPcnnRKsdXOyJvgziwCmtAiRHknJpxDys2BMDnH0bJPv9SMc6AOpgLs6R
 bBTWX9J6+TvjG75nFJsTn7bcx6VD3wdSH5FVEhc4nxVzWdp2ZxYZ/d4dWO3IOUVxxHCB
 5YFw==
X-Gm-Message-State: AGi0PubDEf1nF9OnsNptVHWIguXopH3e8veLFbYlG4JSVgfpVqGqcj84
 QX1Ul1Qr0FR5Gks9NLl8TiK4FA==
X-Google-Smtp-Source: APiQypIQSsVNMioIQvXaPh5z2c/PTy/NnMZw0fklX9quel/4zViXOJ0hWUDelyHRVpwkeeL3yeIAJA==
X-Received: by 2002:ac8:7552:: with SMTP id b18mr532486qtr.312.1588281730917; 
 Thu, 30 Apr 2020 14:22:10 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id m12sm829008qtu.42.2020.04.30.14.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 14:22:10 -0700 (PDT)
Message-ID: <e8a65498cfad063b011c342ae2a6b81bfd470e93.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 30 Apr 2020 18:22:07 -0300
In-Reply-To: <20200430150501.033bfa20@lwn.net>
References: <20200430205447.93458-1-vitor@massaru.org>
 <20200430150501.033bfa20@lwn.net>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, pbonzini@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: fix `make
	htmldocs ` warning
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

On Thu, 2020-04-30 at 15:05 -0600, Jonathan Corbet wrote:
> On Thu, 30 Apr 2020 17:54:47 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > Fix 'make htmldocs' warning:
> > Documentation/virt/kvm/amd-memory-encryption.rst:76: WARNING:
> > Inline literal start-string without end-string.
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  Documentation/virt/kvm/amd-memory-encryption.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/virt/kvm/amd-memory-encryption.rst
> > b/Documentation/virt/kvm/amd-memory-encryption.rst
> > index c3129b9ba5cb..57c01f531e61 100644
> > --- a/Documentation/virt/kvm/amd-memory-encryption.rst
> > +++ b/Documentation/virt/kvm/amd-memory-encryption.rst
> > @@ -74,7 +74,7 @@ should point to a file descriptor that is opened
> > on the ``/dev/sev``
> >  device, if needed (see individual commands).
> >  
> >  On output, ``error`` is zero on success, or an error code.  Error
> > codes
> > -are defined in ``<linux/psp-dev.h>`.
> > +are defined in ``<linux/psp-dev.h>``.
> 
> This one, too, is already fixed in docs-next.  If you're doing
> documentation work, please work against that tree.
> 
> Also, "fix a warning" is almost never an appropriate subject line for
> any
> kernel patch.  You're not fixing a warning, you're fixing some broken
> RST
> in the file.  The subject line on the patch I merged fixing this
> problem
> reads:
> 
> 	docs: virt/kvm: close inline string literal
> 
> ...which describes what is really going on.

Sorry. Thanks by the review.

> 
> Thanks,
> 
> jon

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
