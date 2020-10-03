Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4CAC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 06:27:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C60132068D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 06:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWOKAlnO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C60132068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6E096274FC;
	Sat,  3 Oct 2020 06:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMhbjKmyLVHg; Sat,  3 Oct 2020 06:27:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 27E2220420;
	Sat,  3 Oct 2020 06:27:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B96CC016F;
	Sat,  3 Oct 2020 06:27:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E636C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 06:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3529386521
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 06:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URRPfc5Uh_tc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 06:27:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 64F5786276
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 06:27:13 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id p15so4689413ejm.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 23:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=nEXIDgZjSTNMjwm5lIGW28x/2k6P1nArTHXawvJnbQw=;
 b=AWOKAlnOVyjlKmzqn7/Qz+uTBYNG6buI8MxZTLcOggdyFX/65miZIkvZWVJKCzr2/D
 +y0Ji54edhq5yJQFvbomleYtw5DOf08z2RBLa4Ru52vfekYaD3kjwnQ8YOZhLOUcvuug
 TP1IHM3Hw/Cgd4EjfZ8y4OklcvgoS9R16ITRlukmAuNCaZOnZ2LH50RIGwvsIS8ZTNsM
 TqXY2NYP0AmhiBTWGNIGnoUcBMUXv1iL/8RKFJftyg14Dtp/DB9fvFW+ejT8a2QFCouj
 uIZtWlp2aNIoC7b+Qj3gN5yfH7G7RLnbJGtW1EUYdTqGCNEvZREzhZOmcrkFJR8vbKiQ
 Qmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=nEXIDgZjSTNMjwm5lIGW28x/2k6P1nArTHXawvJnbQw=;
 b=cIA5VeZkwI6FexWJ6qNDbOZZwZt2yexjaMwXuDS+ciqO7MLiOFwfTEb6llfWsDHfTO
 g6624uIRjTiZN/weQii6JGHOUE75Y4HTMLZFwIQfujC+CulyRgC0A6YXpgJNm1lLgPYO
 hliLa84zvHgiWiUoR4GnP/6EDoq7jtXocPTRGpKEDm67wK3eNfiIxTO5kdGgbNQC3j+d
 VEDzkULXLuHoMtAbC5euiD8NYxZFSDTw5JiFeQxTPlKj6ua1xvUObJ5Oz06il8oCgLlv
 TGJuVQhKgQR+vjdkvMgc4tzi53SAen40+xsfI3P+2A8RMQlofJznmnvWprQm1kjZxIKj
 xhgA==
X-Gm-Message-State: AOAM530GUR522pjROrdTvSU0z14kmTFznMKWEkn9tkWU2PlhxS6ERMWK
 Ip6oHG5fmo2U9K//LiOv7b0=
X-Google-Smtp-Source: ABdhPJxaVOYNz1/yaH7XOoc5WN6iOPGlmYEUClqAt78CQTZQKBS1nCg2bx1ec7qtxl1rl8+e7taYNw==
X-Received: by 2002:a17:906:2752:: with SMTP id
 a18mr5277503ejd.350.1601706431901; 
 Fri, 02 Oct 2020 23:27:11 -0700 (PDT)
Received: from felia ([2001:16b8:2d0f:200:5c8a:6672:a0e2:bacb])
 by smtp.gmail.com with ESMTPSA id p3sm3291809edp.28.2020.10.02.23.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 23:27:11 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 3 Oct 2020 08:27:10 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <0226bf70-611d-c12b-cbf2-2c2b70bbb2d9@gmail.com>
Message-ID: <alpine.DEB.2.21.2010030826310.7503@felia>
References: <06b25639-0d7d-e635-706c-19b950c5ff2e@gmail.com>
 <0226bf70-611d-c12b-cbf2-2c2b70bbb2d9@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 0/2] use interpreters to
	invoke scripts
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



On Sat, 3 Oct 2020, Ujjwal Kumar wrote:

> On 02/10/20 4:08 pm, Ujjwal Kumar wrote:
> > This patch series aims at removing the dependency on execute 
> > bit of the scripts in the kbuild system.
> > 
> > If not working with fresh clone of linux-next, clean the srctree:
> > make distclean
> > make tools/clean
> > 
> > To test the dependency on execute bits, I tried building the 
> > kernel after removing x-bits for all files in the repository.
> > Removing execute bits:
> > for i in $(find -executable -type f); do chmod -x $i; done
> > 
> > Any attempts to configure (or build) the kernel fail because of 
> > 'Permission denied' on scripts with the following error:
> > $ make allmodconfig
> > sh: ./scripts/gcc-version.sh: Permission denied
> > init/Kconfig:34: syntax error
> > init/Kconfig:33: invalid statement
> > init/Kconfig:34: invalid statement
> > sh: ./scripts/ld-version.sh: Permission denied
> > init/Kconfig:39: syntax error
> > init/Kconfig:38: invalid statement
> > sh: ./scripts/clang-version.sh: Permission denied
> > init/Kconfig:49: syntax error
> > init/Kconfig:48: invalid statement
> > make[1]: *** [scripts/kconfig/Makefile:71: allmodconfig] Error 1
> > make: *** [Makefile:606: allmodconfig] Error 2
> > 
> > Changes:
> > 1. Adds specific interpreters (in Kconfig) to invoke 
> > scripts.
> > 
> > After this patch I could successfully do a kernel build 
> > without any errors.
> > 
> > 2. Again adds specific interpreters to other parts of 
> > kbuild system.
> > 
> > I could successfully perform the following make targets after 
> > applying the second patch:
> > make headerdep
> > make kselftest-merge
> 
> I could further test the changes as follows-
> scripts/Makefile.package:
> make rpm-pkg
> make perf-tar-src-pkg
> 
> arch/ia64/Makefile:
> make ARCH=ia64 defconfig
> 
> arch/arm64/kernel/vdso/Makefile:
> ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare
>

Add that to your next cover letter.

Lukas

> > 
> > Following changes in the patch 2/2 are not yet tested:
> > arch/*
> > scripts/*
> > 
> > Ujjwal Kumar (2):
> >   kconfig: use interpreters to invoke scripts
> >   kbuild: use interpreters to invoke scripts
> > 
> >  Makefile                          |  4 ++--
> >  arch/arm64/kernel/vdso/Makefile   |  2 +-
> >  arch/arm64/kernel/vdso32/Makefile |  2 +-
> >  arch/ia64/Makefile                |  4 ++--
> >  arch/nds32/kernel/vdso/Makefile   |  2 +-
> >  init/Kconfig                      | 16 ++++++++--------
> >  scripts/Makefile.build            |  2 +-
> >  scripts/Makefile.package          |  4 ++--
> >  8 files changed, 18 insertions(+), 18 deletions(-)
> > 
> 
> Ujjwal Kumar
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
