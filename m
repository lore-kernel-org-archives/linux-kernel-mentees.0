Return-Path: <SRS0=NG44=77=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8BAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 20:30:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BDD7206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 20:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="RDbK89/D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BDD7206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 45AE6266DD;
	Thu, 18 Jun 2020 20:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKKyy3MXB3y3; Thu, 18 Jun 2020 20:30:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2AF9D20515;
	Thu, 18 Jun 2020 20:30:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 111BBC07FF;
	Thu, 18 Jun 2020 20:30:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C406CC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A1B9122744
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBLXY7+IXj1z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:29:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id C0BC320515
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:29:57 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id n2so2918332pld.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5/hCpa4EUzmgzyQWCDiDnoXra6cXP6DdcXvsMo077Gs=;
 b=RDbK89/DJFlPYBLi55AUzHik7hIPiAtrhNB3Qa2pdC8sq3oAKuRj+VhPo1gjJBe1GN
 pIusZmQqosz28RAPNaShZUmvRSvTZ4EzkJRinInfNnyR2OhGWhAIW7UagQLSbf8lTAKN
 KmPwknx0k7749KSqeRDXxoQZoh9ar4v/7B03lx02PuZFdeTdROniKhr+wLSEjik/enwI
 ihdjQVuWtYdfF+yQTXSerlGuocHTzvCp4gXjS8YmZne6mTxZIOWtwUp4HhH76bM5g8pQ
 /zR0EgeK5AgsprFpSFT4Wne7/sUVbgYXMvlO//r2X8YcgZr2pMj/0qoxF7dgOlNjLPZm
 b+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5/hCpa4EUzmgzyQWCDiDnoXra6cXP6DdcXvsMo077Gs=;
 b=l5LKnsO916y0B57nc/hPgVScktNHysIVP8M40MgA/XU6IoEDdDZo29K0B3Hdlqb9mI
 8Ap22RtoJ/NxJW27My938vgojdn9tKnhhlgl8zwABZlZ+IX2Ujpd4KEf568CdsmB9AqT
 fb0cK/nVEgCRSJf1n7I1b2b8XLGg6vKZSN9foibS+TEj1OJsNGAxdYK2r/Ahu4fdka25
 l/okSPgr2cGhAG05C3Mi5zfR9RlNK2/HzOneAMPgzxF8x8OxU/iM7Czr0RiwYtcM5Mev
 /6TpbswzH2dTwizlvsUL2wFXbo0AEsawdXdcvfYmnJdY+0mlg/dkiMzuRdMbmhcE1N9c
 oBug==
X-Gm-Message-State: AOAM533LlRjLjPj4kcBtGObrnk6JvOrR7Z0vjifhpMButFZOTywAxiPp
 k5o3jeZpFYOR0RLzOxIF/Xpj9e3aduCqs/SGyY/kcQ==
X-Google-Smtp-Source: ABdhPJzxU3pY06CWSm4LO7FME2n4fLBB6pVcJXHzNqN2LnUXllGbawGj0C6+Ydhb05A/tvBLq04fczMZ38da+qd63co=
X-Received: by 2002:a17:90a:df82:: with SMTP id p2mr74335pjv.217.1592512197024; 
 Thu, 18 Jun 2020 13:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200618035736.245566-1-vitor@massaru.org>
In-Reply-To: <20200618035736.245566-1-vitor@massaru.org>
Date: Thu, 18 Jun 2020 13:29:46 -0700
Message-ID: <CAFd5g45AB8K-p78GRmauRPbkXLU572D2tuMTc0pumL+EgDA52Q@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] kunit: fix KconfigParseError by
	ignoring CC_VERSION_TEXT
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Jun 17, 2020 at 8:57 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> Commit 8b59cd81dc5 ("kbuild: ensure full rebuild when the compiler
> is updated") added the environment variable CC_VERSION_TEXT,
> parse_from_string() doesn't expect a string and this causes the
> failure below:
>
> [iha@bbking linux]$ tools/testing/kunit/kunit.py run --timeout=60
> [00:20:12] Configuring KUnit Kernel ...
> Generating .config ...
> Traceback (most recent call last):
>   File "tools/testing/kunit/kunit.py", line 347, in <module>
>     main(sys.argv[1:])
>   File "tools/testing/kunit/kunit.py", line 257, in main
>     result = run_tests(linux, request)
>   File "tools/testing/kunit/kunit.py", line 134, in run_tests
>     config_result = config_tests(linux, config_request)
>   File "tools/testing/kunit/kunit.py", line 64, in config_tests
>     success = linux.build_reconfig(request.build_dir, request.make_options)
>   File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_kernel.py", line 161, in build_reconfig
>     return self.build_config(build_dir, make_options)
>   File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_kernel.py", line 145, in build_config
>     return self.validate_config(build_dir)
>   File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_kernel.py", line 124, in validate_config
>     validated_kconfig.read_from_file(kconfig_path)
>   File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_config.py", line 89, in read_from_file
>     self.parse_from_string(f.read())
>   File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_config.py", line 85, in parse_from_string
>     raise KconfigParseError('Failed to parse: ' + line)
> kunit_config.KconfigParseError: Failed to parse: CONFIG_CC_VERSION_TEXT="gcc (GCC) 10.1.1 20200507 (Red Hat 10.1.1-1)"

I am pretty there is already a fix out for this issue:

https://patchwork.kernel.org/patch/11592313/

Can you confirm?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
