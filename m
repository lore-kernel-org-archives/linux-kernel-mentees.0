Return-Path: <SRS0=8YXb=73=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496A0C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Jun 2020 17:48:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF585206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Jun 2020 17:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aIwjQl1s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF585206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 95EA0204CF;
	Sun, 14 Jun 2020 17:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGxQtjK1-hMJ; Sun, 14 Jun 2020 17:48:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DDA4C2046B;
	Sun, 14 Jun 2020 17:48:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE9F0C0888;
	Sun, 14 Jun 2020 17:48:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F696C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2020 17:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 45F3888F6C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2020 17:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4XQ06hZsqP3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2020 17:48:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 675E088F66
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2020 17:48:12 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id j6so2658921pgh.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2020 10:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iVzpsWsc+ucplBrjqeKrqJAgIWgN+U4AVWHu2CnNfCw=;
 b=aIwjQl1sUiDQ2w0UO6H5e+TIMjXcNjQhvZvthliLOZyfJEdErfxsx9txCoJekTR1hW
 NzbqMEA2ougHWqc3j9sPog4RX9IBSGvyEBS0Fg4w5wuU6pPuGNmKl5YaEItykcdgw0dl
 TwnrEKrubrUOYnfVYJoOsGWqnoHEpQ+GfCWYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iVzpsWsc+ucplBrjqeKrqJAgIWgN+U4AVWHu2CnNfCw=;
 b=kMOcDwxDPGvcPir4aQOiPb9lXgncR5W6Xt0p+CxpvRYNgoFCcHoX0dWwT2fBhIUpZQ
 STS8M2TlCbAT2J3vLC3Tah5yGY14dE4pHG79WiQlA3Pg4zuuKAhRHkuGdsItX1qtVxsz
 RU42kKhrxD0HPocr3J68Hvd2uZUooebj/GuxP399WwEtAmwhMz6/UWrQt1XOKtn66GZK
 i8BKJ2grAVjm3M7CVWltooEGgTMOuIrRHnmL8XqrG8GvpFCP95EIUrYpEWhprISvkNa4
 gZXU4QVzKvBvvwN7KDemse2WiRiZd17mxuYlmZ/Gxv9xPt13j+UgJJCZlMGmTrUWerBI
 TKyQ==
X-Gm-Message-State: AOAM533D17RJlJsspBHCaP/KpaXagl7ZOPpfGKhPPMQ2b30L0PRWaku+
 wGSJyWsNffKN60CrYrXcG71A+A==
X-Google-Smtp-Source: ABdhPJz0NFGLAM2yH1jkaSAar+jnewZ2I8xuCgJU32vfOT0pkbbbCkbDUG8eaxV2MohCGeOtVouAlg==
X-Received: by 2002:a63:4f1b:: with SMTP id d27mr18066209pgb.389.1592156891996; 
 Sun, 14 Jun 2020 10:48:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id ca6sm10154511pjb.46.2020.06.14.10.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 10:48:11 -0700 (PDT)
Date: Sun, 14 Jun 2020 10:48:09 -0700
From: Kees Cook <keescook@chromium.org>
To: David Gow <davidgow@google.com>
Message-ID: <202006141005.BA19A9D3@keescook>
References: <20200611215501.213058-1-vitor@massaru.org>
 <202006121403.CF8D57C@keescook>
 <CABVgOSnofuJQ_fiCL-8KdKezg3Hnqk3A+X509c4YP_toKeBVBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSnofuJQ_fiCL-8KdKezg3Hnqk3A+X509c4YP_toKeBVBg@mail.gmail.com>
Cc: linux@rasmusvillemoes.dk, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: [Linux-kernel-mentees] common KUnit Kconfig and file naming (was:
 Re: [PATCH] lib: kunit_test_overflow: add KUnit test of check_*_overflow
 functions)
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

On Sat, Jun 13, 2020 at 02:51:17PM +0800, David Gow wrote:
> Yeah, _KUNIT_TEST was what we've sort-of implicitly decided on for
> config names, but the documentation does need to happen.

That works for me. It still feels redundant, but all I really want is a
standard name. :)

> We haven't put as much thought into standardising the filenames much, though.

I actually find this to be much more important because it is more
end-user-facing (i.e. in module naming, in build logs, in scripts, on
filesystem, etc -- CONFIG is basically only present during kernel build).
Trying to do any sorting or greping really needs a way to find all the
kunit pieces.

> Both of these are slightly complicated by cases like this where tests
> are being ported from a non-KUnit test to KUnit. There's a small
> argument there for trying to keep the name the same, though personally
> I suspect consistency is more important.

Understood. I think consistency is preferred too, especially since the
driving reason to make this conversions is to gain consistency with the
actual tests themselves.

> Alas, the plans to document test coding style / conventions kept
> getting pre-empted: I'll drag it back up to the top of the to-do list,
> and see if we can't prioritise it. I think we'd hoped to be able to
> catch these in review, but between a bit of forgetfulness and a few
> tests going upstream without our seeing them has made it obvious that
> doesn't work.
> 
> Once something's documented (and the suitable bikeshedding has
> subsided), we can consider renaming existing tests if that seems
> worthwhile.

Yes please! :)

> My feeling is we'll go for:
> - Kconfig name: ~_KUNIT_TEST

As mentioned, I'm fine with this, but prefer ~_KUNIT

> - filename: ~-test.c

I really don't like this. Several reasons reasons:

- it does not distinguish it from other tests -- there is no way to
  identify kunit tests from non-kunit tests from directory listings,
  build log greps, etc.

- the current "common" naming has been with a leading "test", ignoring
  kunit, tools/, and samples/:

	53 test_*.c
	27 *_test.c
	19 *[a-z0-9]test.c
	19 selftest*.c
	16 test-*.c
	11 *-test.c
	11 test[a-z0-9]*.c
	 8 *-tests.c
	 5 *-selftest.c
	 4 *_test_*.c
	 1 *_selftest_*.c
	 1 *_selftests.c

(these counts might be a bit off -- my eyes started to cross while
constructing regexes)

- dashes are converted to _ in module names, leading to some confusion
  between .c file and .ko file.

I'd strongly prefer ~_kunit.c, but could live with _kunit_test.c (even
though it's redundant).

> At least for the initial draft documentation, as those seem to be most
> common, but I think a thread on that would probably be the best place
> to add it.

I'm ready! :) (Subject updated)

> This would also be a good opportunity to document the "standard" KUnit
> boilerplate help text in the Kconfig options.

Ah yeah, good idea.

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
