Return-Path: <SRS0=vwAy=DL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDD2C47095
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 06:54:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB107206A1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 06:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UG4DnuWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB107206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4EEBC20437;
	Sun,  4 Oct 2020 06:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNqjmPc2XWdk; Sun,  4 Oct 2020 06:54:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3963F20420;
	Sun,  4 Oct 2020 06:54:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29670C07FF;
	Sun,  4 Oct 2020 06:54:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EADD7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 06:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E278D84B80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 06:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NClPti9AEctX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 06:54:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EFDAA84B46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 06:54:08 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c8so6131402edv.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=EPLwvj5pya/JFWydy8L2Gp24s9uoCH6NbYu2uRRH6ik=;
 b=UG4DnuWuqE6SNkZ5M9hwm9iv1P4o4gLy5ReBNtNlbStSNV/RfwSPM1CzXqSYuQHzDb
 OiWhQQIBIvlUIuAv+4kKBcyLNIdnmTi/4+FXaCdwsW5NtFArKBHf0SgAR78thGCGYIty
 1423smC0NAJevTWU4kHKW2+fPLrxM+OVMKp3O3QPmx2zw79B/x8wwM0z0AgUyIeBut5J
 dTXu0AepR08jsr/AXzTLmplBGQr12f61wq+6dujLJlcAFhpxYUAyi+rC4oBi38W7lpJ4
 PIy4987RpSSFAdYaeSFT+ezfRumdUfnX6UHQmhTxkt0Iu/AmvSpwuWd0ZOqark6tU9Yf
 kySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=EPLwvj5pya/JFWydy8L2Gp24s9uoCH6NbYu2uRRH6ik=;
 b=Ch+ftRn3odzTK4GM80cbrcIOe1VDfM4pFBdaCs3AkGb02Gss9CR3AzJEvsjTWHJFF4
 e7Rn9dOueshj8fTh5swd9481IlGGX30ybyc2E7TlWvG0kYN3hxHyuQlSPUU41AJrhdIm
 wUxzHAzkkAmpX1R+NO6qVcScJ4GHlIJsXkSTY/89v7HSKCCwOqH8l5e5qwZGjtifBe55
 /lCQCtEk5MkctBSWTcihZbr/jE4A0H2mOmoK2PHtzG62d6bj8KbsSMe3OHhA+G81w6uK
 FOBuLw2I+DsDSB7pwtpeWvB7QniSvwYu/A0lXPdg0j8pnMXH2GUaJMixUNk8bkVLCsoc
 01lQ==
X-Gm-Message-State: AOAM5338AMnVOW35WUs3J+kid1qHuVQTS00lF2v+8BXPQ6PZH/PlU9QV
 JdavWGbaUnUkFafZ3s91vh8=
X-Google-Smtp-Source: ABdhPJzI48R2EuzLCKnqeLePDQ2Dv05WLcSgKkMSb9kmFpHlLInEpkzuSRIfJllzfN1l2U+/csG/Ww==
X-Received: by 2002:a05:6402:b68:: with SMTP id
 cb8mr11568608edb.350.1601794447224; 
 Sat, 03 Oct 2020 23:54:07 -0700 (PDT)
Received: from felia ([2001:16b8:2d26:f700:8d52:b46b:d125:e62a])
 by smtp.gmail.com with ESMTPSA id k18sm4876538ejk.42.2020.10.03.23.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 23:54:06 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 4 Oct 2020 08:54:05 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <d398ec09-2146-1fef-c594-643a9c868b06@gmail.com>
Message-ID: <alpine.DEB.2.21.2010040852150.28226@felia>
References: <d398ec09-2146-1fef-c594-643a9c868b06@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Michal Marek <michal.lkml@markovi.net>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 1/2] kconfig: use
	interpreters to invoke scripts
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

> We cannot rely on execute bits to be set on files in the repository.
> The build script should use the explicit interpreter when invoking any
> script from the repository.
> 
> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>

Reproduced the setup described in the cover letter on next-20201002.

The issue for make defconfig was resolved with this patch. So:

Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


Lukas
 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
>  init/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 91456ac0ef20..524f6b555945 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -30,12 +30,12 @@ config CC_IS_GCC
>  
>  config GCC_VERSION
>  	int
> -	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> +	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
>  	default 0
>  
>  config LD_VERSION
>  	int
> -	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
> +	default $(shell,$(LD) --version | $(AWK) -f $(srctree)/scripts/ld-version.sh)
>  
>  config CC_IS_CLANG
>  	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
> @@ -45,20 +45,20 @@ config LD_IS_LLD
>  
>  config CLANG_VERSION
>  	int
> -	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> +	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/clang-version.sh $(CC))
>  
>  config CC_CAN_LINK
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>  
>  config CC_CAN_LINK_STATIC
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>  
>  config CC_HAS_ASM_GOTO
> -	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
> +	def_bool $(success,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC))
>  
>  config CC_HAS_ASM_GOTO_OUTPUT
>  	depends on CC_HAS_ASM_GOTO
> -- 
> 2.26.2
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
