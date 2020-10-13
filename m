Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576ECC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 16:03:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7515225234
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 16:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="j1iFKrZF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7515225234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CDEC387937;
	Tue, 13 Oct 2020 16:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWm5gBBo1Gco; Tue, 13 Oct 2020 16:03:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8221887928;
	Tue, 13 Oct 2020 16:03:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 658ABC0052;
	Tue, 13 Oct 2020 16:03:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90DB9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 16:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7C80686C08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 16:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPJSXbDDNnVa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 16:03:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0B46686B8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 16:03:04 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 09DG2vWE009051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 01:02:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 09DG2vWE009051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1602604978;
 bh=3Doy0JIMW8UlEO9WI984BiymwAAc3PcCowImi1wWrlc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j1iFKrZFjKmYB3TS8hS72+3ACn6mEqyeXyYK+OY/XcWRDiCLMKufgU6PI75iJ58FZ
 ZqD5aLNvA39nMpysKLZC72E0xGyW4sUckhjz3n8gIUAl6h4kyMvPLBXh+3D6sKuZgq
 9cG4qFz+WchFkOtXJdWjeeCRbIqifjTOC+FLInKWf6g0+tv0J+3G7ht7fzrqeTNEdJ
 v5kDS0j9pSdICvj5MU3estuPiL7nPx1xsi/cRk22nNIwntgtgS5IxjFK26ZgrzQh0a
 Bof89zfD3ncfUS3jTnaZbcQF0ztFME3JhZwXAjf5wF7UZGbrVnzEeQPdD9dnPNtU3y
 pRitjo25wXk9Q==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id az3so104919pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 09:02:57 -0700 (PDT)
X-Gm-Message-State: AOAM5304KL7mzmZf3ls4Vd5jz+4YsPEjh34tWhJY2y6JBf/Cj8iKuofO
 Udk0HDh4LSc62U0C8Fa/YpIidiAPZmFsNtaCjlI=
X-Google-Smtp-Source: ABdhPJwppXe7uVVWc+nfoNIz3RPoqqMPJii8V+bgs/KaSKZBm5bodncuyboRoJgCH3YbpjaBw+5sUrG7IlnA22ZMdAo=
X-Received: by 2002:a17:902:c3d4:b029:d3:df24:1619 with SMTP id
 j20-20020a170902c3d4b02900d3df241619mr159914plj.1.1602604976734; Tue, 13 Oct
 2020 09:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
 <20201012170631.1241502-3-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010122019410.17866@felia>
 <b4fdc7c5-8edf-3895-69fc-1bcf9efb5d4a@gmail.com>
 <53b7257e-b192-07da-9dd3-06497ce826f0@petrovitsch.priv.at>
In-Reply-To: <53b7257e-b192-07da-9dd3-06497ce826f0@petrovitsch.priv.at>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 14 Oct 2020 01:02:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRDz-+HqXtW6o7nowwprBSgKkhx7-Joe2=hjgLp4o+4A@mail.gmail.com>
Message-ID: <CAK7LNARRDz-+HqXtW6o7nowwprBSgKkhx7-Joe2=hjgLp4o+4A@mail.gmail.com>
To: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Cc: Michal Marek <michal.lkml@markovi.net>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] kbuild: use interpreters
	to invoke scripts
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

On Tue, Oct 13, 2020 at 4:03 AM Bernd Petrovitsch
<bernd@petrovitsch.priv.at> wrote:
>
> Hi all!
>
> On 12/10/2020 18:42, Ujjwal Kumar wrote:
> > On 12/10/20 11:50 pm, Lukas Bulwahn wrote:
> >>
> >>
> >> On Mon, 12 Oct 2020, Ujjwal Kumar wrote:
> >>
> >>> We cannot rely on execute bits to be set on files in the repository.
> >>> The build script should use the explicit interpreter when invoking any
> >>> script from the repository.
> >>>
> >>> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> >>> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> >>>
> >>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> >>> Suggested-by: Kees Cook <keescook@chromium.org>
> >>> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >>> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> >>> ---
> >>>  Makefile                          | 4 ++--
> >>>  arch/arm64/kernel/vdso/Makefile   | 2 +-
> >>>  arch/arm64/kernel/vdso32/Makefile | 2 +-
> >>>  arch/ia64/Makefile                | 4 ++--
> >>>  arch/nds32/kernel/vdso/Makefile   | 2 +-
> >>>  scripts/Makefile.build            | 2 +-
> >>>  scripts/Makefile.package          | 4 ++--
> >>>  7 files changed, 10 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/Makefile b/Makefile
> >>> index 0af7945caa61..df20e71dd7c8 100644
> >>> --- a/Makefile
> >>> +++ b/Makefile
> >>> @@ -1256,7 +1256,7 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
> >>>  PHONY += headerdep
> >>>  headerdep:
> >>>     $(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
> >>> -   $(srctree)/scripts/headerdep.pl -I$(srctree)/include
> >>> +   $(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include
> >>>
> >>>  # ---------------------------------------------------------------------------
> >>>  # Kernel headers
> >>> @@ -1312,7 +1312,7 @@ PHONY += kselftest-merge
> >>>  kselftest-merge:
> >>>     $(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
> >>>     $(Q)find $(srctree)/tools/testing/selftests -name config | \
> >>> -           xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
> >>> +           xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
> >>>     $(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> >>>
> >>>  # ---------------------------------------------------------------------------
> >>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> >>> index edccdb77c53e..fb07804b7fc1 100644
> >>> --- a/arch/arm64/kernel/vdso/Makefile
> >>> +++ b/arch/arm64/kernel/vdso/Makefile
> >>> @@ -65,7 +65,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
> >>>  # Generate VDSO offsets using helper script
> >>>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
> >>>  quiet_cmd_vdsosym = VDSOSYM $@
> >>> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> >>> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
> >>>
> >>>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
> >>>     $(call if_changed,vdsosym)
> >>> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> >>> index 7f96a1a9f68c..617c9ac58156 100644
> >>> --- a/arch/arm64/kernel/vdso32/Makefile
> >>> +++ b/arch/arm64/kernel/vdso32/Makefile
> >>> @@ -205,7 +205,7 @@ quiet_cmd_vdsomunge = MUNGE   $@
> >>>  gen-vdsosym := $(srctree)/$(src)/../vdso/gen_vdso_offsets.sh
> >>>  quiet_cmd_vdsosym = VDSOSYM $@
> >>>  # The AArch64 nm should be able to read an AArch32 binary
> >>> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> >>> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
> >>>
> >>>  # Install commands for the unstripped file
> >>>  quiet_cmd_vdso_install = INSTALL32 $@
> >>> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
> >>> index 703b1c4f6d12..86d42a2d09cb 100644
> >>> --- a/arch/ia64/Makefile
> >>> +++ b/arch/ia64/Makefile
> >>> @@ -27,8 +27,8 @@ cflags-y  := -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
> >>>                -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
> >>>  KBUILD_CFLAGS_KERNEL := -mconstant-gp
> >>>
> >>> -GAS_STATUS = $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> >>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> >>> +GAS_STATUS = $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> >>> +KBUILD_CPPFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> >>
> >> Here is an instance of what Masahiro-san pointed out being wrong.
> >>
> >> Ujjwal, will you send a v3?
> >
> > Following is the quoted text from the reply mail from Masahiro
> >
> >>> -GAS_STATUS     = $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> >>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> >>> +GAS_STATUS     = $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> >>> +KBUILD_CPPFLAGS += $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> >>
> >>
> >>
> >> These changes look wrong to me.
> >>
> >> $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
> >>
> >
> > From the above text, I understand as follows:
>
> Did you actually *test* that (expecially) these lines work
> afterwards as good as before?
>
> > That my proposed change:
> > $(shell $(src...)    ->  $($(CONFIG_SHELL) $(src...)
> >
> > is WRONG
>
> Yup, as it's in a Makefile and that's a Makefile construct.
>
> > and in the next line he suggested the required correction.
> > That being:
> > $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
>
> Such stuff should generally not be needed as the to-be-used
> shell can be set in Makefiles via a "SHELL = " assignment
> (defaulting to /bin/sh - what else;-).
> Flags for the shell can BTW set with ".SHELLFLAGS = ".


You are talking about a different thing.



Take the current code as an example:

$(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")


Here are two shell invocations.


[1]
The command
$(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)"
is run in /bin/sh because the default value of SHELL is /bin/sh.


[2]
The script, arch/ia64/scripts/check-gas, is run in /bin/sh
because the hash-bang (the first line of check-gas)
specifies #!/bin/sh




Bernd is talking about [1].

In contrast, this patch is addressing [2] because
Andrew Morton suggested to run scripts without relying
on the executable bit.
(and, after this patch, we run scripts without relying
on the hash-bang because we now specify the interpreter.)


Of course, [1] and [2] can be different.


I always want to use /bin/sh for [1],
so please do not use bash-extension inside $(shell  ...)


You have more choices for [2].

If arch/ia64/scripts/check-gas had been written with bash-extension,
the code would have been changed into:

$(shell $(BASH) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")


I hope this will be clearer.




> So please
> -) learn basic "Makefile" + "make" before brainlessly patching
>    a Makefile.
> -) actually testy your changes to make sure the patch didn't
>    broke anything
> -) and - last but not least - check if there isn't a shell
>    already set (and which).
>
> MfG,
>         Bernd
> --
> There is no cloud, just other people computers.
> -- https://static.fsf.org/nosvn/stickers/thereisnocloud.svg



--
Best Regards
Masahiro Yamada
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
