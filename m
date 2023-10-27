Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1A0C25B67
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Oct 2023 10:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD5D81E5A;
	Fri, 27 Oct 2023 10:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD5D81E5A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XMYt/YuQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqXJ_xICssFP; Fri, 27 Oct 2023 10:41:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 011CA81E03;
	Fri, 27 Oct 2023 10:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 011CA81E03
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE030C0071;
	Fri, 27 Oct 2023 10:41:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0C64C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 10:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C38E81E22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 10:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C38E81E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMgbYOV9F_tZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 10:41:49 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A23FC81E03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 10:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A23FC81E03
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9bf0ac97fdeso295393766b.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698403308; x=1699008108;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jJlIxAlI3qqoojs2SPzt67107Ewh+X9coDI5REUO6oE=;
 b=XMYt/YuQs4QrFt69drgf/PogCnjkZnP9rzSIoUZB3jhLdYo+QiVbpzQUCIZdBht+Oo
 9VeHXpo59/o7TZo3aN6HQC27YFGPQBiAhFI/CsqlqQu+dkPhq/NFKxEzneCEHd4a0IWs
 TI0xc0zdlEh1ht9CaWao74R1SL1btmLKSGW2qyOVcjMhimC+32oJV1wTe7bmDvlCvMZs
 MP39JFdksSJuX8H9ALosl2RB4A9cOpV6MsDlYnQ8pBpd5OjTrNHOZMMRUuSClVJ96DOq
 gK505Sgp8HeO2jYoB2yOJ9specrQbxX/iL0xk2x21WYSI+ktx6lgRLg3ptwuDV8UMUPq
 k6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698403308; x=1699008108;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJlIxAlI3qqoojs2SPzt67107Ewh+X9coDI5REUO6oE=;
 b=LDJjI0CXqxTQM8WaBVT5SFy1muYp9aOeXb122FXaWSy5u08RsUMgmXrJNpEaDYDQRL
 qWHkzdAcJbXSG97Km+BKzggqpEVfMTNxWR/T9Qq7oj7zaqopvClj8V+XPTppiuzFhuna
 ihhGP4tzjm7EoLiD2/nWk504aZS6PIACEdKCfJZZQjnTUo1X+vPFeFwQbh7/jhWPhTMT
 AE+hDU2WJ5s+f4IcWrdk/AIy+4gccLlohmgElgbymUe1dXYVIchRpL6bYPh8IGXjAX/A
 3UZW00+jDcDAvPWF/S/o65JSR0Q8LndkiAfcMe4LeulojoD7IRaqbS8lErcpkBL+0Wz2
 dl6A==
X-Gm-Message-State: AOJu0YycdXAMoecedABQFbMOEU8KS4qwJ0D8nrS9yUGMx8A/UNHyBJJE
 emwAqan076CCY7NWJdbvGw==
X-Google-Smtp-Source: AGHT+IGG0dNg9Z43zdOJ+I4D2u9uJ72OdmCpwTt73ucvr6QlsbPcc81T7NTMWkn2PS2Ln1LhaE5qFw==
X-Received: by 2002:a17:907:1ca3:b0:9bf:39f3:f11d with SMTP id
 nb35-20020a1709071ca300b009bf39f3f11dmr1986424ejc.30.1698403307469; 
 Fri, 27 Oct 2023 03:41:47 -0700 (PDT)
Received: from p183 ([46.53.253.206]) by smtp.gmail.com with ESMTPSA id
 qt7-20020a170906ece700b00988f168811bsm990259ejb.135.2023.10.27.03.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 03:41:46 -0700 (PDT)
Date: Fri, 27 Oct 2023 13:41:44 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Subject: Re: [PATCH] selftests:proc ProtectionKey check in smpas test
Message-ID: <397bbed6-9e9d-4aca-8b14-8b0f2d69d845@p183>
References: <20231025193627.316508-1-swarupkotikalapudi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025193627.316508-1-swarupkotikalapudi@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, shuah@kernel.org
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

On Thu, Oct 26, 2023 at 01:06:27AM +0530, Swarup Laxman Kotiaklapudi wrote:
> Check ProtectionKey field in /proc/*/smaps output,
> if system supports page-based memory permissions.

> --- a/tools/testing/selftests/proc/proc-empty-vm.c
> +++ b/tools/testing/selftests/proc/proc-empty-vm.c
> @@ -37,6 +37,7 @@
>  #include <sys/types.h>
>  #include <sys/wait.h>
>  #include <unistd.h>
> +#include "../kselftest.h"

I'd rather not include stuff. The reason is that this include makes
the test not (less) self-contained so it requires copying two files
to some machine where it is broken for debugging.

> @@ -83,10 +84,7 @@ static const char proc_pid_smaps_vsyscall_1[] =
>  "SwapPss:               0 kB\n"
>  "Locked:                0 kB\n"
>  "THPeligible:           0\n"
> -/*
> - * "ProtectionKey:" field is conditional. It is possible to check it as well,
> - * but I don't have such machine.
> - */
> +"ProtectionKey:         0\n"
>  ;
>  
>  static const char proc_pid_smaps_vsyscall_2[] =
> @@ -113,10 +111,7 @@ static const char proc_pid_smaps_vsyscall_2[] =
>  "SwapPss:               0 kB\n"
>  "Locked:                0 kB\n"
>  "THPeligible:           0\n"
> -/*
> - * "ProtectionKey:" field is conditional. It is possible to check it as well,
> - * but I'm too tired.
> - */
> +"ProtectionKey:         0\n"
>  ;
>  
>  static void sigaction_SIGSEGV(int _, siginfo_t *__, void *___)
> @@ -241,13 +236,26 @@ static int test_proc_pid_smaps(pid_t pid)
>  	} else {
>  		ssize_t rv = read(fd, buf, sizeof(buf));
>  		close(fd);
> -		if (g_vsyscall == 0) {
> -			assert(rv == 0);
> -		} else {
> -			size_t len = strlen(g_proc_pid_maps_vsyscall);
> -			/* TODO "ProtectionKey:" */
> -			assert(rv > len);
> -			assert(memcmp(buf, g_proc_pid_maps_vsyscall, len) == 0);
> +		assert(rv >= 0);
> +		assert(rv <= sizeof(buf));
> +		if (g_vsyscall != 0) {
> +			int pkey = pkey_alloc(0, 0);

I'd call syscall(). glibc might not have pkey_alloc(3) [[citation needed]]
And I'd move this pkey support testing to the very beginning (like vsyscall).

> +			if (pkey < 0) {
> +				size_t len = strlen(g_proc_pid_maps_vsyscall);

OK this test was broken, but it is not your fault. See my next patch.

> +
> +				assert(rv > len);
> +				assert(memcmp(buf, g_proc_pid_maps_vsyscall, len) == 0);
> +			} else {
> +				pkey_free(pkey);
> +				static const char * const S[] = {
> +					"ProtectionKey:         0\n"
> +				};
> +				int i;
> +
> +				for (i = 0; i < ARRAY_SIZE(S); i++)
> +					assert(memmem(buf, rv, S[i], strlen(S[i])));
> +			}

OK-ish.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
