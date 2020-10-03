Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82764C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 07:05:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E58EB206B8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 07:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWX91c/S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E58EB206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 816042038D;
	Sat,  3 Oct 2020 07:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOiaLH4Ntm7U; Sat,  3 Oct 2020 07:05:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 281C120377;
	Sat,  3 Oct 2020 07:05:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0432CC0889;
	Sat,  3 Oct 2020 07:05:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C2D2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 07:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 80F7F872F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 07:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phsdjnN5xIyP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 07:05:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A7BE2872B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 07:05:20 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id t21so1362471eds.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 00:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=NJ/WHE251OhY0ciXODflSGBeCzOt5CltYPM41VoVDpc=;
 b=LWX91c/SLqcvKOz98y7pfxX1Y1Vs/sC0bPqW2SVxZkdZHPM/TlRuZwDDbeYU0uKlFw
 NtLnuBeoYOScZQjIrZMgKgrnas2ZV6wkg8l0Y8n7yuMiVajSMXdz3w4ByZWZB7GAOyiI
 lrUiA3Y0/R7znkTVD7AxTGVI4Ju9piCfjG6B/Yc5yY0T+VTndhza+VVTNcwqVVKXxf83
 ERkO6CTQTCCDfgIHOoif8DsbYvb6Y2cHoqVIw/EYAu9Kla4wnYJKt0C15+TtYQ/QS9JM
 cLYyBwSKJ2P7D0DKCJv617ORVvx/upopTlej45jYU9RiNzox4Bqa9IVbM2IFmMirSoiO
 qxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=NJ/WHE251OhY0ciXODflSGBeCzOt5CltYPM41VoVDpc=;
 b=NVTX21mvUpGtsh1j3zwoFjv82rd5WVF9QWsc2N2zuXG/M7TirS0ULHbcQ5YyQqBFop
 8wimETqTZO3AQwn+f3OotawMaHT/xSjQ3lfBobDHSvGSyeWiaFaflGgHNFLkT1/AJSzS
 ezsMzEOiW+teuWk9WCA9gM+79zJfYirEWVg3e1bFCGO80/UTSk6/Umlzo1AuHetWyF4L
 B++ks6w/C/Dy1rEwPDh94DTFcDfilcJ71DtMEwVAhvSINoK3BHKlYJnS/3qPgTwDvMdC
 iQqOwhf8hxRn/TyMdEMPxMi8p1d1Yd7w8hYE8joTa3Z5VE0mybUUd+U8zoLeSkTXh54H
 Lffw==
X-Gm-Message-State: AOAM532yubO3DcdDzoF5ekuWZlN2qHzFD+Jhwijy5msE/AeGvu1mhM6S
 6iRHYKNE5nR4P7PLjoVqeyo=
X-Google-Smtp-Source: ABdhPJyTWLfUtbn4Rhk8d3pmnIUlx2/onbiUCQXebZEyJHPPrNM/x4m1J49Uo69FkPCCiHQH17lxiw==
X-Received: by 2002:a05:6402:14d4:: with SMTP id
 f20mr6645973edx.291.1601708719125; 
 Sat, 03 Oct 2020 00:05:19 -0700 (PDT)
Received: from felia ([2001:16b8:2d0f:200:5c8a:6672:a0e2:bacb])
 by smtp.gmail.com with ESMTPSA id g9sm420356edv.81.2020.10.03.00.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 00:05:18 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 3 Oct 2020 09:05:17 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <3ae58bf3-3725-f7c8-0ab5-ae7a2d8d28df@gmail.com>
Message-ID: <alpine.DEB.2.21.2010030859430.7503@felia>
References: <ef1681fc-1123-15e7-0f93-2cc8b70354e7@gmail.com>
 <alpine.DEB.2.21.2010020544590.7067@felia>
 <3ae58bf3-3725-f7c8-0ab5-ae7a2d8d28df@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] kconfig: use interpreters to
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



On Fri, 2 Oct 2020, Ujjwal Kumar wrote:

> On 02/10/20 9:20 am, Lukas Bulwahn wrote:
> > 
> > 
> > On Fri, 2 Oct 2020, Ujjwal Kumar wrote:
> > 
> >> We cannot rely on execute bits to be set on files in the repository.
> >> The build script should use the explicit interpreter when invoking any 
> >> script from the repository.
> >>
> >> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> >> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> >>
> >> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> >> Suggested-by: Kees Cook <keescook@chromium.org>
> >> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> > 
> > 
> > Ujjwal, you have nicely split the patches. I suggest you send out this 
> > patch and the patch "kbuild: use interpreters to incoke scripts" together 
> > as one patch series.
> > 
> > You just need to write a cover letter and explain there which steps you 
> > did to find this being wrong before and what you did to test that it is 
> > now corrected.
> > 
> > Also, can you please share on this list to whom/which lists you would send 
> > this patch series?Running 'get_maintainer.pl' script I get the following list.
> 
> kconfig: use interpreters to invoke scripts-
> 

Make those people explicitly to:

> Nathan Chancellor <natechancellor@gmail.com>
> Nick Desaulniers <ndesaulniers@google.com>

Nathan and Nick were working on the multi-compier support.

> Masahiro Yamada <masahiroy@kernel.org>

Masahiro-san is the important maintainer here.
also add Michal Marek.

I guess they are all optional:

> "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> Masami Hiramatsu <mhiramat@kernel.org>
> Daniel Borkmann <daniel@iogearbox.net>
> Andrew Morton <akpm@linux-foundation.org>
> Krzysztof Kozlowski <krzk@kernel.org>
> Valentin Schneider <valentin.schneider@arm.com>
> Nick Terrell <terrelln@fb.com>
> "Eric W. Biederman" <ebiederm@xmission.com>
> Johannes Weiner <hannes@cmpxchg.org>


Yes, the mailing lists should be added:

> linux-kernel@vger.kernel.org
> clang-built-linux@googlegroups.com
>

also add the linux-kbuild mailing list.

> 
> kbuild: use interpreters to invoke scripts-
> 

These are the important maintainers:

> Masahiro Yamada <masahiroy@kernel.org>
> Michal Marek <michal.lkml@markovi.net>


I think these are mainly developers that some of the lines;

maybe just put them CC:

> Catalin Marinas <catalin.marinas@arm.com>
> Will Deacon <will@kernel.org>
> Tony Luck <tony.luck@intel.com>
> Fenghua Yu <fenghua.yu@intel.com>
> Nick Hu <nickhu@andestech.com>
> Greentime Hu <green.hu@gmail.com>
> Vincent Chen <deanbo422@gmail.com>
> Vincenzo Frascino <vincenzo.frascino@arm.com>
> Kees Cook <keescook@chromium.org>
> Nick Desaulniers <ndesaulniers@google.com>
> Alexander Popov <alex.popov@linux.com>
> Mark Brown <broonie@kernel.org>
> Sami Tolvanen <samitolvanen@google.com>
> Nathan Chancellor <natechancellor@gmail.com>
> Denis Efremov <efremov@linux.com>


Mailing lists looks good:

> linux-kbuild@vger.kernel.org
> linux-kernel@vger.kernel.org
> linux-arm-kernel@lists.infradead.org
> linux-ia64@vger.kernel.org
>

I think you have a good list.

Lukas
 
> > 
> > Then we check that we did not miss anyone important for these two patches.
> > 
> > Please resend the two mentioned patches again as patch series with a cover 
> > letter.
> > 
> > We are getting close now to sending this to the larger group of kernel 
> > developers.
> > 
> > Good progress so far.
> > 
> > Lukas
> > 
> >> ---
> >>  init/Kconfig | 16 ++++++++--------
> >>  1 file changed, 8 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/init/Kconfig b/init/Kconfig
> >> index 91456ac0ef20..335c8fcb99af 100644
> >> --- a/init/Kconfig
> >> +++ b/init/Kconfig
> >> @@ -30,12 +30,12 @@ config CC_IS_GCC
> >>  
> >>  config GCC_VERSION
> >>  	int
> >> -	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> >> +	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> >>  	default 0
> >>  
> >>  config LD_VERSION
> >>  	int
> >> -	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
> >> +	default $(shell,$(LD) --version | $(AWK) -f $(srctree)/scripts/ld-version.sh)
> >>  
> >>  config CC_IS_CLANG
> >>  	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
> >> @@ -45,20 +45,20 @@ config LD_IS_LLD
> >>  
> >>  config CLANG_VERSION
> >>  	int
> >> -	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> >> +	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/clang-version.sh $(CC))
> >>  
> >>  config CC_CAN_LINK
> >>  	bool
> >> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> >> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
> >> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> >> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
> >>  
> >>  config CC_CAN_LINK_STATIC
> >>  	bool
> >> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> >> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
> >> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> >> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
> >>  
> >>  config CC_HAS_ASM_GOTO
> >> -	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
> >> +	def_bool $(success,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC))
> >>  
> >>  config CC_HAS_ASM_GOTO_OUTPUT
> >>  	depends on CC_HAS_ASM_GOTO
> >> -- 
> >> 2.26.2
> >>
> >>
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
