Return-Path: <SRS0=NG44=77=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4203FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 20:31:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F8D2207DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 20:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="jUQk5nqz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F8D2207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E13BB8881C;
	Thu, 18 Jun 2020 20:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pld1mLUaSvMo; Thu, 18 Jun 2020 20:31:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5BB69884D3;
	Thu, 18 Jun 2020 20:31:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52370C07FF;
	Thu, 18 Jun 2020 20:31:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11952C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 00E1F87AF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QC9bj_z9A4pu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:31:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6422F876C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:31:35 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v14so3456556pgl.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2vYguTxknGE8Dx16795P40n1hyMI+4rqo7SoKdZ0n4M=;
 b=jUQk5nqzrPWoyZry6OFj3XXe2iWiykd0oEPPhNsYguTw0jHnq0ttSeXC05Jbcj+aKH
 i2w49bRIQ5UXe4x22BDcgWgjawQPc1s94rGXML4EP3kzY94O7KzGbJmSf8A849v/UXa2
 oRf+0BFrbHWIBtEoBJdAikbWPgiYzu90FKcXuNY+ZRcgFcx+Wm8Nv9EGxMtm1b0LKXn3
 G5kB8nhaWvIOWj9+7918MeRleRN0sfuG6FyMC3ZIONGqNxWyBXVUr67HqJ+qoafWkLB7
 hCFfMmFjlUt/CmROnI8YhwVwYsILkkIJmZo5/IDHjO4Rsp9jrOOJozHQ13XkS+gRKeeM
 4BAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2vYguTxknGE8Dx16795P40n1hyMI+4rqo7SoKdZ0n4M=;
 b=daRRC3m9M16NiPRCfwJomoDTGvzdgRHanWxLP+IqaiGYsPXwek6i34ZqkxuyRnVlz7
 KmjqO91dPAyyvUKNe+I+aZjBsa+Q2WgUANmu0bzwvpuhsi66JgWTLaHplLTFxEMp/OZC
 nsu7REj8pdKX6P4WLGczzHzmRUMziUtSVsL/y+GM7/UaQuaLeRpg/OtWQ2NbajWZemSJ
 Cn0uK8MLrfQ1qBNaAUdLqAxFrG4BdZUKxqQInuJTzyHVxq+qQO947GI0DF18XKPv3rII
 NAxg6gAnFTHihsmx2gOSzZl137ig4gPGxR1kmVCywIJwCfey2CeDShcPPl/FvKWOsT72
 daeA==
X-Gm-Message-State: AOAM533wPh+iRwaQFKGGYjWB6FGC8Um6vrK2SnGZTDM+/Uns3W2tnxiV
 HaGMTQ41QQQFgE3ZBFa9zo6w2lfCxEJ89BRe8OLszQ==
X-Google-Smtp-Source: ABdhPJyg7+/EsMv/uILhnCx33cvfvyj/A5rdmlcYEhM69bT4X7pfCnqfldKiOJpntTlq+2IKO59hml9kLz5hSl5KpGY=
X-Received: by 2002:aa7:868f:: with SMTP id d15mr5402182pfo.166.1592512294729; 
 Thu, 18 Jun 2020 13:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200618123912.64762-1-vitor@massaru.org>
In-Reply-To: <20200618123912.64762-1-vitor@massaru.org>
Date: Thu, 18 Jun 2020 13:31:23 -0700
Message-ID: <CAFd5g47tWA=yqa2zN8f6d=dKDhutU_Dr3JLjAdu8+wRFq9iOyg@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kunit: fix KconfigParseError
	handling CC_VERSION_TEXT
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

On Thu, Jun 18, 2020 at 5:39 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> Commit 8b59cd81dc5 ("kbuild: ensure full rebuild when the compiler
> is updated") added the environment variable CC_VERSION_TEXT,
> parse_from_string() doesn't expect a string in value field and this
> causes the failure below:
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
