Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1B87080D
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 04:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753416390; cv=none; b=bQveoLdFWW0gbEMeaHatBmniyI1rj5/kTHgjxOU3IR1tJgMWF7BcJObt8+tpFCM0qBUmph5PoiyUuKKhlQbnybAKEnzI25PoHoItkCMyzhR9jW1gO0+QwjkTBxTx8x99CSt8R37ACw+z5guKECZmRlmEATnZX/rLKhYCWdKB22g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753416390; c=relaxed/simple;
	bh=Nbiex0cAfXxQfSvouhrM5Lo/7kXZCARpsH6Uszz/5iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WhUGGsWOgyDEQveHMwWSyWuWoI6wS80xJYCjeJTHmkM+RHHhLpLGpQ6xkLvZKwMK9iE9NhzCss+uD1Gh4lzv/t1GJyaKQPOIGSxh732m2Oiusnuvk/vQyIDniY5G0UkmWmMCXqpbQTbL/tKzyumBnaLbAoc9alKuiwTsGUzfXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9LBS5dD; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9LBS5dD"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2ffa1b10918so983765fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 21:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753416385; x=1754021185; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MxFwecxr/0B2ef20Od5cEy15w6qiFnt04wlLQ+u7uOU=;
        b=m9LBS5dDbHjbr+eatglyig4ciup8dE6Zse6OhsURc0Gixigra64YOysiyY/LJfEjp8
         u6mWVfOtIEERXEvNgVExy+C7cinT1Ads2vB9Nxad4iz0s4y61zj8yAlb64accOUaBIMs
         a+qe+Fz7D2KQJw7yr3JGBzo2Ml+w7TALoa4FdCRpMlvbqNhOhC4eD79EJTjmTyVLPbyr
         Mms2A7xw+SbVAtXgRA5GZ9ISb58tIRgzpxBCzCMBolxmXTKmlwFzfYFurhflKT0dSxV1
         k0i54G8UgGbDfldIz6Homdc1Iyd5mAyGclfpIzJibLrS5KyDPWBMsVyH2Ou850BQ91qX
         a61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753416385; x=1754021185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxFwecxr/0B2ef20Od5cEy15w6qiFnt04wlLQ+u7uOU=;
        b=sy1jMc/7+ZuBRhAXXaGb0ezwqAoL30tJoapI3g1Y7pW87mQOVyWunzSZaJjFX4gMnp
         NihiKqU4BHcggAdBa/ht5AJBcuQILSs3JauUt+1budtr/y6DQPaHPhOJwkahlfAr2Sf7
         5r6E42e71+pD6UGAw5ZHk/Wmwjc5FAKK/dp30YWkb5iLbuwWvdu3FVuEgy8JWlRgH25L
         P65rQDroDIj8e2uM6XiVlSmQl31t/YuxVGV3WTCOhBuz8d+eAIQFBL5rTq4jJFP/5xrP
         uKbXAHk4vk3iO7PMe2COJwrzDdZOL4CEC7YSKFjM7tFyqAYRO8Jf+iD837Ag69TYDxhG
         2I1w==
X-Forwarded-Encrypted: i=1; AJvYcCUBbOa0uQQ7ViCJCb+2pYTB9MAiaRaN8BqtnqcsNS76/X/Z738vaSDKo9FMcUGQhKClb4nW7XHOBGpHNV6ULE0TwUysEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc1jGkpdkVwFVL0LlxeIJeQeR8tsiFx1rCaP6PGF8QdxnXEChT
	d0y4dN6zaZSB9yORXnAE8sfeV9z5AAqkReqXcdFvw9UdIUpee2ljQAlQ59eDHFwFeOqdmqBT13B
	nttb3VYtkwTt4ThUY6LbX9mKzwdVfuEk=
X-Gm-Gg: ASbGncua0o13KUBuMgzoV4F/0DdGixnaAyGbjjWBL2DOKUDsn1HrEo7X8+w9Y9e0Lj8
	cj8ameBWuGWJN+fLqFheNqXk0sdDcU6Zl9Ug3qU0cN0wPm2UzxQC85XYBBKBXfL8kWnj9D+95ZK
	5liaHAhPYXtGeqEl++ZIVUYtrS5E/RNdFyjLiwjkIyX00mN++TVEYES36aJvi5tx/30mlM/Skkm
	KRYUWVROTrIw1twOEQ=
X-Google-Smtp-Source: AGHT+IGBZ7w/dfI527SR+DjinfNWuVbsu36wytkW8N4l6YT8Yd5aYP89lAVW8ZijJwwDy/9hDaIyx8WtdOiU1h8rzkU=
X-Received: by 2002:a05:6870:9e8b:b0:2ff:8c8e:c222 with SMTP id
 586e51a60fabf-30701d5dc82mr361913fac.14.1753416385412; Thu, 24 Jul 2025
 21:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724165639.13926-1-suchitkarunakaran@gmail.com> <90864bf5-2edb-4901-9566-c89431c6d717@arm.com>
In-Reply-To: <90864bf5-2edb-4901-9566-c89431c6d717@arm.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Fri, 25 Jul 2025 09:36:14 +0530
X-Gm-Features: Ac12FXz44GOWvQ9VHe3SSaOhUjxs0ZPwCO46dWoM-kiLqy_XkQMRtojfL8c4zg4
Message-ID: <CAO9wTFgFqmKWdF5bhpqh2ffrUb7QH8mqUNH1nieOMDFn_fUcDA@mail.gmail.com>
Subject: Re: [PATCH] arm64: allow NR_CPUS=1 for non-SMP and adjust default accordingly
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Jul 2025 at 07:46, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 24/07/25 10:26 PM, Suchit Karunakaran wrote:
> > The arm64 Kconfig for NR_CPUS previously required a minimum of 2 CPUs.
> > This patch changes the minimum allowed CPUs to 1, enabling single-core
> > non-SMP configurations.
> >
> > Additionally, the default value for NR_CPUS is now conditional:
> > - Defaults to 1 if SMP is not selected (non-SMP systems)
> > - Defaults to 512 if SMP is enabled
>
> Just curious - what actually prompted this change ?
>

Hi, sorry I think I should've explained it in the commit message. So,
in linux/include/linux/threads.h, there's this fixme comment:
/*
 * Maximum supported processors.  Setting this smaller saves quite a
 * bit of memory.  Use nr_cpu_ids instead of this except for static bitmaps.
 */
#ifndef CONFIG_NR_CPUS
/* FIXME: This should be fixed in the arch's Kconfig */
#define CONFIG_NR_CPUS 1
#endif

And the original commit is as follows:

commit 278d1ed65e25d80af7c3a112d707b3f70516ddb4
Author: Rusty Russell <rusty@rustcorp.com.au>
Date:   Tue Dec 30 09:05:12 2008 +1030

    cpumask: make CONFIG_NR_CPUS always valid.

    Impact: cleanup

    Currently we have NR_CPUS, which is 1 on UP, and CONFIG_NR_CPUS on
    SMP.  If we make CONFIG_NR_CPUS always valid (and always 1 on !SMP),
    we can skip the middleman.

    This also allows us to find and check all the unaudited NR_CPUS usage
    as we prepare for v. large NR_CPUS.

    To avoid breaking every arch, we cheat and do this for the moment
    in the header if the arch doesn't.

    Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
    Signed-off-by: Mike Travis <travis@sgi.com>

diff --git a/include/linux/threads.h b/include/linux/threads.h
index 38d1a5d6568e..052b12bec8bd 100644
--- a/include/linux/threads.h
+++ b/include/linux/threads.h
@@ -8,17 +8,17 @@
  */

 /*
- * Maximum supported processors that can run under SMP.  This value is
- * set via configure setting.  The maximum is equal to the size of the
- * bitmasks used on that platform, i.e. 32 or 64.  Setting this smaller
- * saves quite a bit of memory.
+ * Maximum supported processors.  Setting this smaller saves quite a
+ * bit of memory.  Use nr_cpu_ids instead of this except for static bitmaps.
  */
-#ifdef CONFIG_SMP
-#define NR_CPUS CONFIG_NR_CPUS
-#else
-#define NR_CPUS 1
+#ifndef CONFIG_NR_CPUS
+/* FIXME: This should be fixed in the arch's Kconfig */
+#define CONFIG_NR_CPUS 1
 #endif

+/* Places which use this should consider cpumask_var_t. */
+#define NR_CPUS CONFIG_NR_CPUS
+
 #define MIN_THREADS_LEFT_FOR_ROOT 4

 /*

This motivated me to do this. Please let me know if I misunderstood
something or I'm doing something incorrectly.
