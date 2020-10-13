Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6CAC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 14:31:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5989C20BED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 14:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="0J/PcS7R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5989C20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BA43920479;
	Tue, 13 Oct 2020 14:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1r1Dmuwia9g2; Tue, 13 Oct 2020 14:31:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A669C20466;
	Tue, 13 Oct 2020 14:31:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 872B6C07FF;
	Tue, 13 Oct 2020 14:31:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A26E3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 14:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 719BF20479
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 14:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3EhlMlLmljL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 14:31:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 by silver.osuosl.org (Postfix) with ESMTPS id A773720466
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 14:31:53 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 09DEVlTT025647
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 23:31:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 09DEVlTT025647
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1602599508;
 bh=YB1WCHK+o0PqjhCmZaRPYUlHHjnzTpeZ72Cc5ws6nnQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0J/PcS7RB6cSMWzhxjAkmcMYmQ0jpQkyiqE3Gl20SI+j1Sgjx6rCh5HPw5T/yV9Mo
 HTiB3Ji4HtV1N1yU9LTSSpJomh16lcl1Yp/aKwZwirASTVyIJJQTysUb8CHpo2+8Oe
 3hu4SeJc9ITlz4pdImlv+j6rXSO3LNl0xGtD9r51rpdHyspqdvNxiJbwHhb+z5lHHn
 s0HZXUooYhijAoCvYrsxsjYqh44DlXpYCGWcF4On9xO2fK23iqA5OXnkv9lWgrqB5/
 IdqPB346sMuYSyzNtqXDHJ17B0K84jt5TSRhkB/DeQisLudnFo1Og6zEuKtwbizN8X
 qkq+sXDhH8xkA==
X-Nifty-SrcIP: [209.85.210.176]
Received: by mail-pf1-f176.google.com with SMTP id n14so16840362pff.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 07:31:48 -0700 (PDT)
X-Gm-Message-State: AOAM53378nH9aieojzuMwPkeW90w2ye0j6LEAR9GaPCpIveMatv7/IHK
 egwf7kl80qM0AeLdmXEnPHY9DZI9Fjsbfx25608=
X-Google-Smtp-Source: ABdhPJxQEpKrJv97JNnMtyZL/6zzLxfMcFXOLKK2hXBRKcuKHRyo30zIrJHi3byG9tmQNm6tYre1p+bv2hRJsgHxsv0=
X-Received: by 2002:a63:1b44:: with SMTP id b4mr17246132pgm.175.1602599507368; 
 Tue, 13 Oct 2020 07:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201001075723.24246-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201001075723.24246-1-lukas.bulwahn@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 13 Oct 2020 23:31:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARXirw-DZg1-Dwq0NhWtqyS9PCpFhzjL7bfZjQt5-dL6A@mail.gmail.com>
Message-ID: <CAK7LNARXirw-DZg1-Dwq0NhWtqyS9PCpFhzjL7bfZjQt5-dL6A@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] kbuild: doc: describe proper
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

On Thu, Oct 1, 2020 at 4:57 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> During an investigation to fix up the execute bits of scripts in the kernel
> repository, Andrew Morton and Kees Cook pointed out that the execute bit
> should not matter, and that build scripts cannot rely on that. Kees could
> not point to any documentation, though.
>
> Masahiro Yamada explained the convention of setting execute bits to make it
> easier for manual script invocation.
>
> Provide some basic documentation how the build shall invoke scripts, such
> that the execute bits do not matter, and acknowledge that execute bits
> are useful nonetheless.
>
> This serves as reference for further clean-up patches in the future.
>
> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> Link: https://lore.kernel.org/linux-kbuild/CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com/
>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


Applied to linux-kbuild.
Thanks.


> ---
> RFC v1 -> RFC v2:
> explain why execute bits are still convenient.
>
> Kees, Andrew, please ack.
>
> Masahiro-san, I have taken your feedback into account. Please pick this small
> documentation update into your kbuild tree.
>
> Ujjwal Kumar, a potential future mentee, will follow up with further fixes to
> the build scripts.
>
>  Documentation/kbuild/makefiles.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 58d513a0fa95..bd3e1baf58be 100644
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
> @@ -605,6 +606,25 @@ more details, with real examples.
>                 #Makefile
>                 LDFLAGS_vmlinux += $(call ld-option, -X)
>
> +3.13 Script invocation
> +----------------------
> +
> +       Make rules may invoke scripts to build the kernel. The rules shall
> +       always provide the appropriate interpreter to execute the script. They
> +       shall not rely on the execute bits being set, and shall not invoke the
> +       script directly. For the convenience of manual script invocation, such
> +       as invoking ./scripts/checkpatch.pl, it is recommended to set execute
> +       bits on the scripts nonetheless.
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
