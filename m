Return-Path: <SRS0=oG7b=AA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5493C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 03:42:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AFFA20890
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 03:42:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wos3wqRN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AFFA20890
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 514DE2740E;
	Fri, 19 Jun 2020 03:42:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1ykaXrFeHQb; Fri, 19 Jun 2020 03:42:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5CBF327408;
	Fri, 19 Jun 2020 03:42:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5059AC088C;
	Fri, 19 Jun 2020 03:42:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1004C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 03:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 99955898C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 03:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lX+xTVSg1hr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 03:42:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F2CA5898BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 03:42:03 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x22so3821913pfn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ylj+KbsOX76QNrUjj2VobkcpDWhDyawSP5wEBfqItRA=;
 b=Wos3wqRNr6giopwl7Ps797+D/UE+C34msegI+7bk+NOANm7xwlQgbmdMHILTzP/+Qh
 QxvdwZuO/nNW22FpNV799fSHpqJZvRbyVtXrOw+w56g23CVlW6VslBCgebkVcP9KQXX0
 i9JOA5DvM0E8m0JiwcLCXtTMI7/JNofOh+/rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ylj+KbsOX76QNrUjj2VobkcpDWhDyawSP5wEBfqItRA=;
 b=tANWeHUen59Yo+fLl/xCH+x6yzooZhXw7u1hz/hUeGEQK2l1LLpFDvrlKQDz7PE3Di
 gqSYRg5+q6AVZei7TzhvzNcW8bn9tk06GIS7l7NC2GVwTYpnYAgXV0FFVbGZtVkIm57x
 K4xQRMIvlru5+GTgpNNPMmeD3AEyLjy3dS2MMtw3U2R+Fnl1pdkLT/NvoTOz9RO4P63I
 SMXu1Xb+5LJGXPHoQhNxyiRzM0tnHNRNEr4UyBKjiUjYZOhq6eu6QGeJxjesqUqAUZMe
 a2dG4IZTmA4gRNKOsfjSqgECP2wHwcRfgNqZePhSkxSzFbG/JM/o3zjSnyBYO3JLCZ5r
 92Zw==
X-Gm-Message-State: AOAM532XZWsFtdpulZSuqlF5jG/tOC4h6kyZ+WZ9jg4TcsyJeVFn0M33
 Bsr3SUcOXtD90sg6jy3xd5v2wQ==
X-Google-Smtp-Source: ABdhPJzzGJYAhwVkP7J4IYD2kzImEk41O+zNGDOowEtJkbh+VyxQSFTwMHUCTD1U6pKjg40y7tCahA==
X-Received: by 2002:a62:be0b:: with SMTP id l11mr6651490pff.1.1592538123475;
 Thu, 18 Jun 2020 20:42:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j12sm4355572pfd.21.2020.06.18.20.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 20:42:02 -0700 (PDT)
Date: Thu, 18 Jun 2020 20:42:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Brendan Higgins <brendanhiggins@google.com>
Message-ID: <202006182016.C93BC8AB@keescook>
References: <20200611215501.213058-1-vitor@massaru.org>
 <202006121403.CF8D57C@keescook>
 <CABVgOSnofuJQ_fiCL-8KdKezg3Hnqk3A+X509c4YP_toKeBVBg@mail.gmail.com>
 <202006141005.BA19A9D3@keescook>
 <CABVgOSkPYBL8Qy9Fsr0owNhh2=tXZmdwCsWhnq+PshJLr06YKA@mail.gmail.com>
 <alpine.LRH.2.21.2006160956170.16027@localhost>
 <CABVgOS=-AHNABkAVV7p=pq67hwoVcXXJSEPvxNbp90Eh_RaxBg@mail.gmail.com>
 <CAFd5g44kZe7h+qKHmx029Qj15FdqxsFRFD3TEx_iEhPEt0jJmA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g44kZe7h+qKHmx029Qj15FdqxsFRFD3TEx_iEhPEt0jJmA@mail.gmail.com>
Cc: David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Alan Maguire <alan.maguire@oracle.com>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] common KUnit Kconfig and file naming
 (was: Re: [PATCH] lib: kunit_test_overflow: add KUnit test of
 check_*_overflow functions)
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

On Thu, Jun 18, 2020 at 01:27:55PM -0700, Brendan Higgins wrote:
> I am cool with changing *-test.c to *-kunit.c. The *-test.c was a hold

I am fine with basically any decision as long as there's a single naming
convention, *except* for this part. Dashes in source files creates
confusion for module naming. Separators should be underscores. This is
a standing pet-peeve of mine, and while I certainly can't fix it
universally in the kernel, we can at least avoid creating an entire
subsystem that gets this wrong for all modules. :)

To illustrate:

$ modinfo dvb-bt8xx
filename: .../kernel/drivers/media/pci/bt8xx/dvb-bt8xx.ko
...
name:           dvb_bt8xx
                   ^         does not match the .ko file, nor source.

Primarily my issue is the disconnect between "dmesg" output and finding
the source. It's not like, a huge deal, but it bugs me. :) As in:

$ strings drivers/media/pci/bt8xx/dvb-bt8xx.o | grep 'Init Error'
4dvb_bt8xx: or51211: Init Error - Can't Reset DVR (%i)


All this said, if there really is some good reason to use dashes, I will
get over it. :P

(And now that I've had to say all this "out loud", I wonder if maybe I
could actually fix this all at the root cause: KBUILD_MOD_NAME... it is
sometimes used for identifiers, which is why it does the underscore
replacement... I wonder if it could be split into "name" and
"identifier"...)

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
