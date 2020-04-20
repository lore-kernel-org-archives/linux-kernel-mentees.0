Return-Path: <SRS0=VNSv=6E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB86CC55182
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 22:27:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E79F2078C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 22:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="CuexACRM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E79F2078C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4932D2210F;
	Mon, 20 Apr 2020 22:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0opbxGutWJxt; Mon, 20 Apr 2020 22:27:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5A2C120773;
	Mon, 20 Apr 2020 22:27:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 418F2C1D74;
	Mon, 20 Apr 2020 22:27:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4125CC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 22:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2B38A868FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 22:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkFWa-alF8M8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 22:27:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 63952864F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 22:27:08 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id l78so12599077qke.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=FnTnNFEg7Eu5eE5Hx3GU/Dpc3NxMHsYhRv+oF0x2HIU=;
 b=CuexACRM/C7YEMKWw9T0KV9eEQVZc8QUsaRMUaeTFwVC1cxNRwOvGcF+3MHhGFJElL
 rKFypSJxXiymzlr+Puvh5wsRv8jVT59EXleHsAtvkBJKEPeVy/dTBxXDC83umNjZOKCV
 2g4eALDgePL8EH/4+737PUzU3ZimD59H5a978UMEt/LAulA8eV1sZ+fzPjzFHw95WRoU
 ArZp4qpwzAw2g4gV9G4ZTpojWKjrxhHOB86qTEUaui57pW87Fi5+Sc7HDtyvdqm93I0P
 oy0NrFnMbya1fLltw+j51dTwjtxslYV1vngnIoR1JV6EcSbftzbB4S+S5mSdx7p1XzK1
 PD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=FnTnNFEg7Eu5eE5Hx3GU/Dpc3NxMHsYhRv+oF0x2HIU=;
 b=RaSU+MhTggr/X2BGzuyCHEjL7Exd8rpku4bhI7NbpPCzpmgJQdO/Ms4ioKpE/c959t
 9u70Ei0rPxD43fxDRceSysaIx9l6Do7ErlaVtqsfZ9mIkfeDNMNDbhPL+8u6D0H+LzZb
 lMSIUrhc8x5FXrc4/a2eKae9wHacWg7OkZxJK6PJp/IYKMP6C+2ja0keji9TuXcyvRnh
 tZv2H5FwDUHy4Qqawbntk6YekqiSFfELTJd5ZtCdZXaP6S9VvQYyB9UIaO9OxlgMMpaO
 TG1amgI3XUF6Ez7c3H4YJGyp7Em3aBFuk0k31huJoj6fDmvphkVng1BlVXGtydaxlaxb
 bIHg==
X-Gm-Message-State: AGi0PuaqtWbS1OWLUscNPdPsMo4+PuLlPOGkHV+UXJtYPwGvXDZb145A
 Duv4zqrGdt8EZZ2sWkJrsg1E7w==
X-Google-Smtp-Source: APiQypLK3tuG/uhayBXi71l583i9rWvzEYAli3/mm+oZ/U6XVf951KadRVyZLHxYclATHuNj3xjQnQ==
X-Received: by 2002:a05:620a:b03:: with SMTP id
 t3mr18349178qkg.209.1587421627192; 
 Mon, 20 Apr 2020 15:27:07 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id j2sm451758qth.57.2020.04.20.15.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 15:27:06 -0700 (PDT)
Message-ID: <b82142248b38085fa3ab49a9d3181cabd5a79a91.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 20 Apr 2020 19:27:03 -0300
In-Reply-To: <CAK7LNAQYxtcNinV7JR+c8Pn9Rp1g0TxJ7m_mOFNOJQsB=OiAoA@mail.gmail.com>
References: <20200414012132.32721-1-vitor@massaru.org>
 <CAK7LNAQYxtcNinV7JR+c8Pn9Rp1g0TxJ7m_mOFNOJQsB=OiAoA@mail.gmail.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kbuild: ensure mrproper
 removes arch/$(SUBARCH)/include/generated/
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

Hi Masahiro,

On Sat, 2020-04-18 at 03:12 +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Tue, Apr 14, 2020 at 10:21 AM Vitor Massaru Iha <vitor@massaru.org
> > wrote:
> > In the following use case, when compiling the kernel for the UML
> > architecture, for example:
> > 
> >  * `make ARCH=um defconfig && make ARCH=um -j8`,
> > 
> > SUBARCH files are generated, however when we run the command:
> > 
> >  * `mrproper ARCH=um`
> 
>       make ARCH=um mrproper
> 
> 
> > the files `arch/$(SUBARCH)/include/generated/ aren't cleaned up.
> > 
> > This generates compilation errors by running the following command:
> > 
> >  * `make ARCH=um defconfig O=./build_um && make ARCH=um -j8
> > O=./build_um`
> > 
> > This PATCH fix that problem.
> 
>   This patch fixes ...
> 
> > This makes it possible to compile on different architectures that
> > use the
> > SUBARCH variable, in different build directories and root directory
> > of the
> > linux directory. This is important because we can compile without
> > the object
> > files being overwritten. This reduces the re-compilation time in
> > this use case.
> 
> Sorry, I do not understand this paragraph.
> 
> 
> Brendan Higgins just reported the build error
> in the out-of-tree build after in-tree build.
> 
> 
> [1] make ARCH=um defconfig all
> [2] make ARCH=um mrproper
> [3] make ARCH=um O=foo defconfig all
> 
>   -> build error
> 
> Ins't it?
> 
> 
> 
> > Besides that, in the workflow of developing unit tests, using
> > kunit, and
> > compiling in different architectures to develop or test a PATCH,
> > this use case
> > applies.
> > 
> >  * This bug was introduced in this commit a788b2ed81abe
> 
> Instead, adding Fixes tag is the convention.
> 
> Fixes: a788b2ed81ab ("kbuild: check arch/$(SRCARCH)/include/generated
> before out-of-tree build")
> 
> 
> >  * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> 
> Maybe, this can be also a tag.
> 
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> 
> 
> 
> 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> 
> Reported-by: Brendan Higgins <brendanhiggins@google.com>

Was actually Reported-by Theodore Ts'o <tytso@mit.edu>	
https://groups.google.com/forum/#!msg/kunit-dev/QmA27YEgEgI/hvS1kiz2CwAJ

> 
> 
> 
> > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> > Tested-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> > v2:
> >  * Explains what this PATCH does and the importance as suggested
> >    by Brendan Higgins.
> > ---
> >  Makefile | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 70def4907036..e1a79796032e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -532,7 +532,8 @@ outputmakefile:
> >  ifdef building_out_of_srctree
> >         $(Q)if [ -f $(srctree)/.config -o \
> >                  -d $(srctree)/include/config -o \
> > -                -d $(srctree)/arch/$(SRCARCH)/include/generated ];
> > then \
> > +                -d $(srctree)/arch/$(SRCARCH)/include/generated -o
> > \
> > +                -d $(srctree)/arch/$(SUBARCH)/include/generated ];
> > then \
> 
> This hunk is unneeded.
> 
> 
> 
> >                 echo >&2 "***"; \
> >                 echo >&2 "*** The source tree is not clean, please
> > run 'make$(if $(findstring command line, $(origin ARCH)),
> > ARCH=$(ARCH)) mrproper'"; \
> >                 echo >&2 "*** in $(abs_srctree)";\
> > @@ -1388,6 +1389,7 @@ CLEAN_FILES += modules.builtin
> > modules.builtin.modinfo modules.nsdeps
> >  # Directories & files removed with 'make mrproper'
> >  MRPROPER_DIRS  += include/config include/generated          \
> >                   arch/$(SRCARCH)/include/generated .tmp_objdiff \
> > +                 arch/$(SUBARCH)/include/generated \
> >                   debian/ snap/ tar-install/
> >  MRPROPER_FILES += .config .config.old .version \
> >                   Module.symvers \
> > --
> > 2.25.1
> > 
> 
> This problem is only related to ARCH=um builds.
> So, it should be fixed in arch/um/Makefile.
> 
> 
> 
> 
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index d2daa206872d..275f5ffdf6f0 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -140,6 +140,7 @@ export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS)
> $(LD_FLAGS_CMDLINE)
>  # When cleaning we don't include .config, so we don't include
>  # TT or skas makefiles and don't clean skas_ptregs.h.
>  CLEAN_FILES += linux x.i gmon.out
> +MRPROPER_DIRS += arch/$(SUBARCH)/include/generated

Can I add suggested-by Masahiro Yamada <masahiroy@kernel.org> ?

>  archclean:
>         @find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \
> 
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
