Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9709C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 19:10:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A0720644
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 19:10:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmlhwAss"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01A0720644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6658986658;
	Wed, 30 Sep 2020 19:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cb22BviGZ7UX; Wed, 30 Sep 2020 19:10:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C863986769;
	Wed, 30 Sep 2020 19:10:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B089FC0889;
	Wed, 30 Sep 2020 19:10:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 574EAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2F4852155B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJ4eHgkRabqD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:10:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 67B28204D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:10:50 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e11so659597wme.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=5aRpJy0/82weV0MTZskZu30UZTgMwvdZwKvGepOT5VY=;
 b=hmlhwAssKxhrEcXCQagC6+ZRD2UYlHuT7Go37W5LW2D051C/x7DZn2a+bTOrSw15a8
 aQPMYYCNCTPr0SMzAtgdcUO0vKk45YqAKkSO1V2c2EJrljrVrngzjDwlGU6+rvKvY6Jd
 0VO69olSM7ctdp2lIJ+Xdh1wh3ML7Z0Tc2mXTFsR1GYZyKCxhaqFeW81QgbejdN3X/7E
 DMnklVR3PGoe5drkpbGYicBCfYYXVwVlHAfHEtez92MQrEDq2byV39YfiUsDIhEvUu2e
 RFJpQvRfa5Y74IvWGpkTq7BDZB7S1UB4iaGXGttQxGep2bFpk8w6dFblLavB8TaHPZl8
 DCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=5aRpJy0/82weV0MTZskZu30UZTgMwvdZwKvGepOT5VY=;
 b=LQIrtWwsN4Pu6xCyVm1/QvifAq4wzpew7DKCZsi4K3CZvJb10ks4I0csP8B+XX9BAa
 HUCfj5rfHuUL5xn4nC3V7VWXLf8+/JoMaHLqGsak++aQgG/6PtHGxtjjGCqwEmmCGicN
 CNc+IA8dZXF5BIQzYkJCP7NApNLdMLoVlMbQpCVdFSmmo7qRHabxciRLactv9VJQcBwC
 7mr4TbblCIQVjcGGJOQScMqxcGOvZjDHYajPuo8NX1f4JeQtEXa0bR5JKyFI9+9cBHuW
 D3qnmbIjfmEvM6E5/vjBNKMSWp9loVkrU+cbOyrgCkNIoEOw5JJW9Eq+WHmSapgg4WLR
 53AQ==
X-Gm-Message-State: AOAM530J7XVLk2y65hhWkEpndvAJK58xU4a1A6PUhOHQsuVXJER5O+/a
 TXud7p88CYy1vAE00ISl0GQ=
X-Google-Smtp-Source: ABdhPJz2H28qzsIReJvOp+xzWwLy25yqvVPeh7YRqJdKS8v6TL4H322LlYouKD57jcY5ecCIfHbHTQ==
X-Received: by 2002:a1c:117:: with SMTP id 23mr4498474wmb.48.1601493048595;
 Wed, 30 Sep 2020 12:10:48 -0700 (PDT)
Received: from felia ([2001:16b8:2d6f:5600:7072:b735:b671:fb4f])
 by smtp.gmail.com with ESMTPSA id l19sm4453743wmi.8.2020.09.30.12.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 12:10:47 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 30 Sep 2020 21:10:41 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <20200929205731.207393-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2009302102420.8279@felia>
References: <20200929205731.207393-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: dwaipayaray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix
	multistatement macro checks
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


Dwaipayan, did you checkpatch.pl your patch before sending it out?

On Wed, 30 Sep 2020, Dwaipayan Ray wrote:

> Checkpatch generates incorrect error message for certain
> macros.
> 
> When checkpatch was run on commit 4649079b9de1
> "tracing: Make ftrace packed events have align of 1"), it

brace ( is missing, checkpatch should warn you.

> generated multiple errors of the form:
>
Present tense is fine. checkpatch runs on ...,
it generates ...
 
> ERROR: Macros with multiple statements should be enclosed in a do -
> while loop
> +#define __field_packed(type, container, item)    type item;
> 
> This should certainly not be enclosed in a do - while loop.
> The problem was with the trailing semicolon. Any statement
> with trailing semicolon was marked as a multi-line macro.
> This was fixed by having a seperate rule for excluding
> single statements terminated by semicolon.
> 
> The second problem is due to while (...) {...} macros not being
> handled.
> For example, on commit fe557319aa06 ("maccess: rename probe_kernel_
> {read,write} to copy_{from,to}_kernel_nofault"), checkpatch
> generated following error:
> 
> ERROR: Macros with multiple statements should be enclosed in a do -
> while loop
> +#define copy_to_kernel_nofault_loop(dst, src, len, type, err_label) \
>  	while (len >= sizeof(type)) {
>         ....
> 
> This was fixed by having a seperate rule to match such while blocks.
>

s/seperate/separate/

If you address two different problems, make two patches not one.

Kernel developers can handle many patches...

Create two patches in a patch series, checkpatch.pl them, send them out 
here; then we will do a quick review and out they go to Joe and lkml.

Lukas
 
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9e65d21456f1..4fb612200c27 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5342,10 +5342,12 @@ sub process {
>  			    $dstat !~ /^\.$Ident\s*=/ &&				# .foo =
>  			    $dstat !~ /^(?:\#\s*$Ident|\#\s*$Constant)\s*$/ &&		# stringification #foo
>  			    $dstat !~ /^do\s*$Constant\s*while\s*$Constant;?$/ &&	# do {...} while (...); // do {...} while (...)
> +				$dstat !~ /^while\s*$Constant\s*$Constant$/ &&			# while (...) {...}

tab and spacing might be different than lines around it?

>  			    $dstat !~ /^for\s*$Constant$/ &&				# for (...)
>  			    $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&	# for (...) bar()
>  			    $dstat !~ /^do\s*{/ &&					# do {...
>  			    $dstat !~ /^\(\{/ &&						# ({...
> +				$dstat !~ /;$/ &&						# statement;
>  			    $ctx !~ /^.\s*#\s*define\s+TRACE_(?:SYSTEM|INCLUDE_FILE|INCLUDE_PATH)\b/)
>  			{
>  				if ($dstat =~ /^\s*if\b/) {
> -- 
> 2.27.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
