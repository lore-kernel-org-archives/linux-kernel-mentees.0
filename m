Return-Path: <SRS0=/QZw=DF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7550FC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 11:40:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA81206FC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 11:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="2EtzaCpQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCA81206FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 838FE87041;
	Mon, 28 Sep 2020 11:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WNew5u-wOl-T; Mon, 28 Sep 2020 11:40:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED84186FB7;
	Mon, 28 Sep 2020 11:40:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF51BC0891;
	Mon, 28 Sep 2020 11:40:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC86DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 11:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CF67686FFA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 11:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6SqhRsjBQwqU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 11:40:41 +0000 (UTC)
X-Greylist: delayed 00:08:16 by SQLgrey-1.7.6
Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5746786FB7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 11:40:41 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-10.nifty.com
 with ESMTP id 08SBTWiG005735
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 20:29:33 +0900
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 08SBTIxe019114
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 20:29:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 08SBTIxe019114
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1601292558;
 bh=dAHDBKnRo5H4VGCubh2JayTblFUcU7x9zWqqFA0TefA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2EtzaCpQrm1yeFzUFwHnLucZZxcz645G+8YEnqQefxrjPkswsiBZwGiJdLjpC7DXW
 BU/GlUyc0zpFaQRKXKXd4cVkGpChF36vvwjMlGB4pWYlinLacBwvhJce5RJNI5EqFq
 SDKKr/A56jAz47X7YCBKp35hMJ4h3ivsLokkgDGE7lfy2IlhoZ8EYYB4NfwuMrYE7s
 XdrT0DRG2C1VM+vglc+L4blA45K6iAXjJNRcmDkbw/aFfxnc3OQ5dNpIjRIqIPudtB
 djv6wjf7F1nMEvwZU5hbSRRzALRp8dMSIiAEkuSvFVcVibjJbEx1hCBlLCrxTtdgx2
 zExuVYr/sccHw==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id md22so2099361pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 04:29:18 -0700 (PDT)
X-Gm-Message-State: AOAM530dW8BrX37B8cKETjXtVIGLNRHFY+O87rVjDoFcTxfMFdeRq9Hu
 ZP+m4hbJ+Nnw+zVuJJnyNVBIrrbHwFyWzVMNFJs=
X-Google-Smtp-Source: ABdhPJzWqDhdIsNJPkJ596mhZG9tc0uVp7T+xNkSujcLvuLMJSbxUCJxqXGZMVSxYGaXZ4YTc0g3cZsfccjUKkTS1b4=
X-Received: by 2002:a17:90b:1211:: with SMTP id
 gl17mr947942pjb.87.1601292557471; 
 Mon, 28 Sep 2020 04:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200928064244.29206-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200928064244.29206-1-lukas.bulwahn@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 28 Sep 2020 20:28:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com>
Message-ID: <CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] kbuild: doc: describe proper
	script invocation
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

On Mon, Sep 28, 2020 at 3:42 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> During an investigation to fix up the execute bits of scripts in the kernel
> repository, Andrew Morton and Kees Cook pointed out that the execute bit
> should not matter, and that build scripts cannot rely on that. Kees could
> not point to any documentation, though.
>
> Provide some basic documentation how the build shall invoke scripts, such
> that the execute bits do not matter.
>
> This serves as reference for further clean-up patches in the future.


For scripts run by users directly, the executable bit
should be set. (e.g. scripts/checkpatch.pl)


For scripts invoked from the build system, the
convention is to use interpreters such as
$(CONFIG_SHELL), and we do not need to set
the executable bit. But, we often set the executable bit
for this case, too.


This convention started from the following commit, which
was made by the previous kbuild maintainer.



commit 06ed5c2bfacaf67039e87a213fa5d1cdde34246a
Author: Michal Marek <mmarek@suse.cz>
Date:   Wed Aug 20 16:02:59 2014 +0200

    kbuild: Make scripts executable

    The Makefiles call the respective interpreter explicitly, but this makes
    it easier to use the scripts manually.

    Signed-off-by: Michal Marek <mmarek@suse.cz>








> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20200925 and v5.9-rc7
>
> Kees, Andrew, please ack.
>
> Masahiro-san, please pick this small documentation update into your kbuild tree.
>
> Ujjwal Kumar, a potential future mentee, will follow up with further fixes to
> the build scripts.
>
>  Documentation/kbuild/makefiles.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 58d513a0fa95..9d0d198adb7e 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -21,6 +21,7 @@ This document describes the Linux kernel Makefiles.
>            --- 3.10 Special Rules
>            --- 3.11 $(CC) support functions
>            --- 3.12 $(LD) support functions
> +          --- 3.13 Script Invocation
>
>         === 4 Host Program support
>            --- 4.1 Simple Host Program
> @@ -605,6 +606,23 @@ more details, with real examples.
>                 #Makefile
>                 LDFLAGS_vmlinux += $(call ld-option, -X)
>
> +3.13 Script invocation
> +----------------------
> +
> +       Make rules may invoke scripts to build the kernel. The rules shall
> +       always provide the appropriate interpreter to execute the script. They
> +       shall not rely on the execute bits being set, and shall not invoke the
> +       script directly.
> +
> +       Kbuild provides variables $(CONFIG_SHELL), $(AWK), $(PERL),
> +       $(PYTHON) and $(PYTHON3) to refer to interpreters for the respective
> +       scripts.
> +
> +       Example::
> +
> +               #Makefile
> +               cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
> +                            $(KERNELRELEASE)
>
>  4 Host Program support
>  ======================
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
