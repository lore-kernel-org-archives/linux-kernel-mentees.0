Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860E4291C18
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 15:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754494720; cv=none; b=Oo4yNZ4Z88aATxo658dvcXY3Xx5k6t7RlmtUprwGU9GJwLHgW4eJxSlOzC5DS7hVd7WlomrUb1Yi68Lade4xFjMPcVHWhgIUV1XiC4ZD/SuQj5dhI53EYlpMY1bNETrue+jUd6hFfKb0E/fb8bRaXLV+UN8Ci8geH8rLdvVoN9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754494720; c=relaxed/simple;
	bh=b5xV378mmIVkPQ2XJHTTVqaUFaKTnwOkMfVxl6qad7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZb7DS5VDzVV71TXfv/Z2fzaXFoJH33zSkmYi9TWphlDUIc5stfN60UTSDg9MDm2Z5XY3qdRBrNB2eSE/KyExK3r6FMSFxoC67UJPVgUFBQdKcwkljE6UHghjbGeAQPIZbOF6KL2eEHprgskqYEeQgOkZhd9ldparbyhNvv9k3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xqxhutp9; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xqxhutp9"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-30799a41109so32532fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 08:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754494717; x=1755099517; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WrOiLUjlHMAD5qB46+Jo2Wz4HXpj9fepKX/diN8D56c=;
        b=Xqxhutp9XEX37PmprDFL7VKZ5MLlw83ocjhBTEx+54Tj+ODVagqYG5wFKVujWTlXQ4
         j78zT+Twn70v/qM22CO9qSBqejLTTnGvanunFNNQCKaaqvX1qi6/3rWDxRLRY2LRvnkE
         6uobL51kt1L151Uwrzf9/YIqS5Y9qWTMwOHlKrUO4NuTTBAyEUsJCHNO1JKQHGYeUWuc
         AWa9Qs8PLzcM22QFpq1WzBiq1VyW1aIz/d+4KtVF2p1VkE07ew6lDraLyA6S/wo7sQoD
         QVK/RMI1jjBQzMymo/44TVuD84X0eyYNdMY/zdXQ349i6eglx0KurCtrKaKMWaQsfdWj
         35AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754494717; x=1755099517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrOiLUjlHMAD5qB46+Jo2Wz4HXpj9fepKX/diN8D56c=;
        b=mXRJzX9xqGzUIF+TgLojbDLAYqRwcu9nK4fIHbyIuxsWbferUcBiNIu3f11+Nj8sJP
         hGHTof2IqavKvfZDDDii/OMHYEQmujYgkDQ+sf/N8qKjLzwIntQ4gv4sJXNGwG41rMye
         0NAr7aKAUbAIp2fJ8PBnaIt+Fy0ur0izBOGOyLNeRiyH7tVC/o79f3w9nawW9mBYRrjZ
         pKj83Oyer1A/KHsyRWiSzqLxvWz/v99015zIbpMpVUT2AcasJBuI9jor2gYtuSagXkoP
         itUUluTpNLIVvMEefMK6eFqrLegt/Mig4H2QYBTCV5xI4Yk1zwWpjCco4MCyWxGr1nqB
         tL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9i0cX8cNTmdXsWMmb3ETblzodzwGCwzp60naJMN4p1Zk/x3i3n1UQbhjxUp89FZqLBix+KdHwOcNSdgrtt6awU5uySg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfvtmYVnNhtO2zgQn68m5FO3HsId1UjBiQJW7v4g1CL2GkNhaq
	/i+AOkQOVO9nK1tMHV1VW1wbhmA855/VOHdSkFWyTGzcKx7C1bDk5jXm4rWibR5kUG9WCPkNH4z
	p1gFPX2I9mzMU/oNPun9F5+nTNu/0Yk9ahA94JSaNAA==
X-Gm-Gg: ASbGncuUvLAq8mh+/cCoGmIBpcG81r5wFRfa38pDaMHcxWU5ciAyjxgdbS4h2zWdSlX
	fxIPgvhklo/M0O15aFr7Ef2E43CnN5KCoTLdzVblcPNKFrdW0A+njR3saqvUMWlrAGI9OEm3Ty2
	DEQsdmwozhCZ0vYo6T90ZFXTkiRjKWsWJcmcF0rggyDCeq2zhjWp7hkHieO4NZqwgq8UYFO4vmP
	MgAJiKz
X-Google-Smtp-Source: AGHT+IFYz8e/stP8Hupv1QOCESKJJcWXdDupZ7+uMLrWpZ9GYUBBRbHCBkNonI8IRQBTq1coB1FaRIx+CPg0mnqQSF4=
X-Received: by 2002:a05:6870:3929:b0:306:c53a:f904 with SMTP id
 586e51a60fabf-30be2961c85mr2219047fac.9.1754494717379; Wed, 06 Aug 2025
 08:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250806153433.9070-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20250806153433.9070-1-suchitkarunakaran@gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Wed, 6 Aug 2025 21:08:23 +0530
X-Gm-Features: Ac12FXwWWIuBvgVBmXN6nTaFuKW8SoROaRzgJ17UnQsFmv7ch28vadLMsyDfm2k
Message-ID: <CAO9wTFi9MHnzEw0p9QhhFOW_sk3mo_1yT3-YkjTYwN+spYUFWg@mail.gmail.com>
Subject: Re: [PATCH v5] x86/cpu/intel: Fix the constant_tsc model check for
 Pentium 4
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, darwi@linutronix.de, 
	sohil.mehta@intel.com, peterz@infradead.org, ravi.bangoria@amd.com
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 21:04, Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> Pentium 4's which are INTEL_P4_PRESCOTT (model 0x03) and later have
> a constant TSC. This was correctly captured until commit fadb6f569b10
> ("x86/cpu/intel: Limit the non-architectural constant_tsc model checks").
>
> In that commit, an error was introduced while selecting the last P4
> model (0x06) as the upper bound. Model 0x06 was transposed to
> INTEL_P4_WILLAMETTE, which is just plain wrong. That was presumably a
> simple typo, probably just copying and pasting the wrong P4 model.
>
> Fix the constant TSC logic to cover all later P4 models. End at
> INTEL_P4_CEDARMILL which accurately corresponds to the last P4 model.
>
> Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural constant_tsc model checks")
> Cc: <stable@vger.kernel.org> # v6.15
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
> Changes since v4:
> - Updated the patch based on review suggestions
>
> Changes since v3:
> - Refined changelog
>
> Changes since v2:
> - Improved commit message
>
> Changes since v1:
> - Fixed incorrect logic
>
>  arch/x86/kernel/cpu/intel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
> index 076eaa41b8c8..98ae4c37c93e 100644
> --- a/arch/x86/kernel/cpu/intel.c
> +++ b/arch/x86/kernel/cpu/intel.c
> @@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo_x86 *c)
>         if (c->x86_power & (1 << 8)) {
>                 set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
>                 set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
> -       } else if ((c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_WILLAMETTE) ||
> +       } else if ((c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_CEDARMILL) ||
>                    (c->x86_vfm >= INTEL_CORE_YONAH  && c->x86_vfm <= INTEL_IVYBRIDGE)) {
>                 set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
>         }
> --
> 2.50.1

Hi Sohil,
Could you please review the patch? I hope I haven't made any mistakes
this time, and if there are any, it was completely unintentional and I
apologise in advance.

Thanks,
Suchit
