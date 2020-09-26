Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BEDC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:12:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5582120878
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngxjT26P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5582120878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0F82A86C34;
	Sat, 26 Sep 2020 06:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tP9IWZC-+9a1; Sat, 26 Sep 2020 06:12:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D871286D46;
	Sat, 26 Sep 2020 06:12:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9A51C0859;
	Sat, 26 Sep 2020 06:12:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A384C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1612086BAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqYNjXLvENV8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:12:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0FB0586BA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:12:44 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id gx22so1502766ejb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 23:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=LUviZAwZV9Vb+JMxSdAgc/OfdYlNYMaziP4C0Fhulm4=;
 b=ngxjT26PN4IzE2UfgOkRE5kIEFCCzTLhW6eYPMOWevMPpCtsCZYPPcznnIEEwvak6Z
 PSwQecoe/XC7F0Bw76hayTWbl7G5tf3TUEN0qjnWLQWLIzVsbsbYC7dTE3O88U+rcdOW
 xDdijWnUj1OsvTazfEkzpwQm8nu0chmXMYZQpwvdC7CZ4djOJhw05M44RSRYagCgW/kD
 VOGj+l14VuNO26uri5jMkCp1TUo4a44fYy4h+M5ozzmmAcaSD6s4T5GYOUWmtLo/5CBj
 WR8XTkljgna58r+7jq+aAJbhyb4qMPPYTD49wNJcYUw/cI4GD2a0bdF0u+NkLtA/pUmr
 Pmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=LUviZAwZV9Vb+JMxSdAgc/OfdYlNYMaziP4C0Fhulm4=;
 b=ZwzwxAnSTclibkth7WqrGLx7MU5L11jnt3VPHa2uhCb1fH6HEX3+AXzKwjjK3AO94L
 SXkgmhr/oEfZwUINsY0ja3ByrOBjUDxYFMoLcNVxzbo9zi2faa3MSFYzDVFWuatzubDz
 JPiGm+/NnfKGL/LwQWR1BlKn1E+JURygdv5zR99TVLiCBUQuf8UvUAbN/0nhjsg0y6ah
 Qa1aL+dFGBIyWM2HI0qlPE7eAKt16jcUIptAi3cUdfsTTTpa42JhHTnwgngLxEcT6Ksy
 CqVToyoJlLUhhXubbfQqniXftY60tGmQ+musFHJnIaeHg52cRJeQNEP42cWVm1VCMHX9
 +hLA==
X-Gm-Message-State: AOAM531fViXyCgac7/9TBV7W4WOebIx2cwgkhuJzQC1BIUHCsN4+OQ1v
 Ul/p2dSrbSJdQwrLCc5KHXe8fpsf0nxRZw==
X-Google-Smtp-Source: ABdhPJxDGAXyTgms36Tht1EFug21Y7mP6g729s7ZVQPeixBCt+/r91xyo+jSYphepUx9CXU7FVcuNw==
X-Received: by 2002:a17:906:375a:: with SMTP id
 e26mr6064721ejc.552.1601100762303; 
 Fri, 25 Sep 2020 23:12:42 -0700 (PDT)
Received: from felia ([2001:16b8:2daa:2000:7099:7490:f83d:38e7])
 by smtp.gmail.com with ESMTPSA id rl14sm3346587ejb.109.2020.09.25.23.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 23:12:41 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 26 Sep 2020 08:12:40 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
Message-ID: <alpine.DEB.2.21.2009260754430.4734@felia>
References: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] kconfig: Prepend interpeters
	when calling scripts
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


Basically the diff is okay; already start writing the commit message.

On Sat, 26 Sep 2020, Ujjwal Kumar wrote:

> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
>  init/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 91456ac0ef20..9f6ec575e3d1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -30,12 +30,12 @@ config CC_IS_GCC
>  
>  config GCC_VERSION
>  	int
> -	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> +	default $(shell,sh $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC

in the top-level Makefile, (./Makefile), you will find a section:

# SHELL used by kbuild
CONFIG_SHELL := sh

I think that is what is supposed to be used here.

>  	default 0
>  
>  config LD_VERSION
>  	int
> -	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
> +	default $(shell,$(LD) --version | awk -f $(srctree)/scripts/ld-version.sh)
>

Further you find:

# Make variables (CC, etc...)

This section defines variables for each interpreter, in case someone wants
to modify/override the default interpreters.

You can find there:

AWK             = awk

Use that.

>  config CC_IS_CLANG
>  	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
> @@ -45,20 +45,20 @@ config LD_IS_LLD
>  
>  config CLANG_VERSION
>  	int
> -	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> +	default $(shell,sh $(srctree)/scripts/clang-version.sh $(CC))
>

I think CONFIG_SHELL is right here.
  
>  config CC_CAN_LINK
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>

Same here.
  
>  config CC_CAN_LINK_STATIC
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>

Same here.
  
>  config CC_HAS_ASM_GOTO
> -	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
> +	def_bool $(success,sh $(srctree)/scripts/gcc-goto.sh $(CC))
>

Same here.

I think this is already a good size for the patch, it solves one problem 
to have the basic Configuration targets in kbuild work without the need 
for any executable flag on repository files.

Fix it up, write an appropriate commit message, we will review here on the 
linux-kernel-mentees list and then it can go out into the wild wild west 
of the kernel mailing list.


Lukas

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
