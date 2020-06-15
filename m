Return-Path: <SRS0=vsPk=74=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53131C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 18:37:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDC5820768
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 18:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dpaWrqr3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDC5820768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D23E88093;
	Mon, 15 Jun 2020 18:37:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WFTyCHT8jm9y; Mon, 15 Jun 2020 18:37:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EA5B87FBE;
	Mon, 15 Jun 2020 18:37:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F499C0888;
	Mon, 15 Jun 2020 18:37:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6670C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 18:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8469C24F76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 18:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPQ5Wz1mOwiO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 18:37:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 852F124E4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 18:37:50 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id u8so200224pje.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 11:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BXOExHlseDR5lyHBcXzOZz/wvry3WqelFft9LO6SFUk=;
 b=dpaWrqr3z78F+xpH0gnmbE6vvjL2dNQiiHQAgD5yKHAMh27qX8+aCvXaXKOUToLdIQ
 sh6A1RfFFvXRlslq5iAHx0a6Zv8quHnCskDIV9U6gjU/arpkc0c7br21WbGk78B6ho1g
 7YcMndA5241LA3xc2qlIfpxX1dol0YzIPnDHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BXOExHlseDR5lyHBcXzOZz/wvry3WqelFft9LO6SFUk=;
 b=fNIeUBV+pHmOcsMlKCNT/9R70DpRIjiDxBhQV2Uy+t959joVbeSiRKw3/1MMb966ZX
 TlyRLs34695ZzDgmcJiAsYbej9HgNACpyVIAfG1xdPFI2EvloQ+go7H2Cxu98JD62Uoy
 oKYogS57P6vMEK80u0DkQrxVH9rZxIIYgcDG/rOtF8VYWr0ocFT1UKoYprG2thCQVTrQ
 dAcf7YUnmEn2avSP3kZQEPdHINS4oMgIcSN5vZamdjg6KyWIOEz5680lvoMWFIGKuRwI
 wBHBjlHNHq34MQriyN6eDyQgHJmz8eX5xJzgDiAj+l5+nueaPYJEzCHE2z4XgF9RDmS9
 d1lg==
X-Gm-Message-State: AOAM533mo/UXTfNe5NrzojKUkAraw1fIaa/w7wOqzoPp5qscajmicZYV
 1UtXTD7EUbwosDHzpONAoRtM0g==
X-Google-Smtp-Source: ABdhPJzOmBD8Hz6oTM7AnVhELxZHQ6n3SqTyEwjfJ4bmPUbdCEr5ZOSF2osjWYz/O569gQqlA9YE7A==
X-Received: by 2002:a17:902:710e:: with SMTP id
 a14mr23411950pll.199.1592246270133; 
 Mon, 15 Jun 2020 11:37:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i22sm14427227pfo.92.2020.06.15.11.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 11:37:49 -0700 (PDT)
Date: Mon, 15 Jun 2020 11:37:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <202006151134.36BAA57@keescook>
References: <20200611215501.213058-1-vitor@massaru.org>
 <202006121403.CF8D57C@keescook>
 <0c9d09065dca0b71466600e68b64142402a98d24.camel@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c9d09065dca0b71466600e68b64142402a98d24.camel@massaru.org>
Cc: linux@rasmusvillemoes.dk, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit_test_overflow: add
 KUnit test of check_*_overflow functions
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

On Mon, Jun 15, 2020 at 01:30:42PM -0300, Vitor Massaru Iha wrote:
> On Fri, 2020-06-12 at 15:36 -0700, Kees Cook wrote:
> > Why drop the __initconst?
> 
> I removed __initconst because of these warnings below, as it is used
> for the kernel during the module initialization, and I do not use the
> module initialization in this tests. Does this have any side effects in
> these tests?
> 
> WARNING: modpost: vmlinux.o(.text.unlikely+0x131b7): Section mismatch
> in reference from the function test_s8_overflow() to the variable
> .init.rodata:s8_tests
> The function test_s8_overflow() references
> the variable __initconst s8_tests.
> This is often because test_s8_overflow lacks a __initconst 
> annotation or the annotation of s8_tests is wrong.

Ah, right. I assume there are build modes where the tests don't only
live in the __init section any more due to how Kunit does its runtime?
(Before all the tests ran from __init via module_init(), IIRC.)

> > So, yes! I like it. :) Most of my comments here have nothing to do with
> > specifically this patch (sorry)! But I'd love to see a v2.
> > 
> > Thanks for doing this! I'm glad to see more TAP output. :)
> 
> Thanks Kees, I'm learning a lot from you, and as I said privately with
> Brendan, I've never seen so much macro in a code. I learned a lot from
> it.

Heh, yes, for that I must beg forgiveness. ;) The macros are rather
wild, but it seemed the best way to avoid a ton of cut/paste code
duplication.

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
