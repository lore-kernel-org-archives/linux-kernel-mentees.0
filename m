Return-Path: <SRS0=x3JG=A3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CE2C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 16:21:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6D320739
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 16:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="Sid+fUx7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC6D320739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 94F6E898CE;
	Thu, 16 Jul 2020 16:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-rFI5oPaIHB; Thu, 16 Jul 2020 16:21:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1324C89BD7;
	Thu, 16 Jul 2020 16:21:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F069DC07FF;
	Thu, 16 Jul 2020 16:21:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D79BDC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BDB258A0B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlZKFlWVSafa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:21:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EBC908AE60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:21:23 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c139so6025458qkg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 09:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=eVyKsGqcnTfmfgMXI8u61q0DyoLaoA7ADBPKDJXxDGI=;
 b=Sid+fUx7JJp9lDCQ/ip2Q7z8EKoEUuhmbS8Y/EAimMtaVJ5FieLYEELLhGMAMiQWkx
 HfDVTNkMwVvg4hvfQ19BuYQ2OQ4X71iMeVw0iyriGM/1aiedV1f0eyAzjNocWufgP6IY
 zOf8DiqwN/IyuOzMKXGuLMV626s18HFSUSVfCFIAdDfZ64NSz70wh8nAC6Hxt70bimg1
 LqZtmP+xzip5LMLtZgwigc9G5xSJMChtVzcFwfBHlwh3pJCcVx1HLOIqU3y8P9cwOcIq
 FtTwr6ur5rj8lGXOZ3cQEhSWkfcXHGn/00jmHeSrYG3iRX8SuQqU8W+bLmVya7t8kI9A
 CDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=eVyKsGqcnTfmfgMXI8u61q0DyoLaoA7ADBPKDJXxDGI=;
 b=fIgR9w2B++SWBAYLMf4oawDbSlD+WsUoMv94eSAdU9cO2yVUAWLkAGT1dIW3Fcc/HN
 gwJ1iG8KnSL+U6yBbCA1K3UWE7fC8/CtXV44B+QlCY/LpF65wRNushrYgkHWiXGyYuf7
 ZPh8V8t19abraYas3mm7S6kU4pqvqUeKSMJE1xaFPC69xYQRYJrZKKRdZwfiAFsqDxWd
 BbPua+onKmge8FuWdFJ9xC7E6R3gi1/GtHs45BLTNGRTaTNJFyC3Sa23m6GH3r5Zguwv
 sFA4e9sRMkqYSaiscoPY/TPS24b3i26bR0rQymizmSqTTyu0BwM3eg11JRQFf7S8pOaO
 dIcg==
X-Gm-Message-State: AOAM533U3RFb8PxVToZ7A0oSm6pawS599d3uh22cirWNe4rPdaD3u32k
 zDuRMas4NftKpo0TPK9EPlkJpQ==
X-Google-Smtp-Source: ABdhPJy6UOE3dKvVsKdH0AG9WQWTlh/rT4QaVC1wbblF8tnnqUsGB01aIihBqAVTYeBfYD8X663HVQ==
X-Received: by 2002:a37:bd84:: with SMTP id n126mr4883951qkf.310.1594916482698; 
 Thu, 16 Jul 2020 09:21:22 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id o184sm8118760qkd.41.2020.07.16.09.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 09:21:21 -0700 (PDT)
Message-ID: <b89947c3216d1e59374672931edc2b14763fd81f.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: David Gow <davidgow@google.com>
Date: Thu, 16 Jul 2020 13:21:17 -0300
In-Reply-To: <CABVgOSkBAiMSMzCx62_CRo_0e2SGdvRWZ0dSC4t628YJBw-3Aw@mail.gmail.com>
References: <20200715031120.1002016-1-vitor@massaru.org>
 <CABVgOSkBAiMSMzCx62_CRo_0e2SGdvRWZ0dSC4t628YJBw-3Aw@mail.gmail.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Cc: Kees Cook <keescook@chromium.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL
 SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RFC 0/3] kunit: add support to use
	modules
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

On Wed, 2020-07-15 at 11:47 +0800, David Gow wrote:
> On Wed, Jul 15, 2020 at 11:11 AM Vitor Massaru Iha <vitor@massaru.org
> > wrote:
> > Currently, KUnit does not allow the use of tests as a module.
> > This prevents the implementation of tests that require userspace.
> 
> If this is what I think it is, thanks! I'll hopefully get a chance to
> play with it over the next few days.
> 
> Can we clarify what this means: the current description is a little
> misleading, as KUnit tests can already be built and run as modules,
> and "tests that require userspace" is a bit broad.
> 
> As I understand it, this patchset does three things:
> - Let kunit_tool install modules to a root filesystem and boot UML
> with that filesystem.
> - Have tests inherit the mm of the process that started them, which
> (if the test is in a module), provides a user-space memory context so
> that copy_{from,to}_user() works.
> - Port the test_user_copy.c tests to KUnit, using this new feature.
> 
> A few comments from my quick glance over it:
> - The rootfs support is useful: I'm curious how it'll interact with
> non-UML architectures in [1]. It'd be nice for this to be extensible
> and to not explicitly state UML where possible.

Hm, I didn't think about other architectures. Which ones are you
thinking ?

> - The inheriting of the mm stuff still means that
> copy_{from,to}_user() will only work if loaded as a module. This
> really needs to be documented. (Ideally, we'd find a way of having
> this work even for built-in tests, but I don't have any real ideas as
> to how that could be done).

Sure, I'll write the documentation.

> - It'd be nice to split the test_user_copy.c test port into a
> separate
> commit. In fact, it may make sense to also split the kunit_tool
> changes and the mm changes into separate series, as they're both
> quite
> useful independently.
> 

I'll do it.

Thanks for the review.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
