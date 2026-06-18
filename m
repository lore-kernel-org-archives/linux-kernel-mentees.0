Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A8D332916
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jun 2026 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781813023; cv=none; b=otw8so8yPjwPBK9mzS2EHZeCvOCRMg2j2r2hqhi5aYlSZT8wA7nAfObDeixZUmRqWcHlkw/I9EBjC/bTyrkH3cIGTf7H3inyBOn/Fa6qoSOxtx+JIp/gww84ihuKHwIAes3Im/XPxa8gljgdcCv0rLYUY7rpzKGspe9DiQNRi5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781813023; c=relaxed/simple;
	bh=pBk9kGJqbXRSBiX8wQep4HoR3YvnXTOqulYjM3xplJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLoCHV8WuzToMyLAXb2SzQpBPdpoCRhWN3Ik8P6KruWYcNDvRjuQnXLKqosbp2uzGCXd3Oj3tLE+av9ta2DX6sciYl1rUNfDLY/alBQdW6Qkt/ErBrD6uiVc9RJki9071BNtIG1bfRDNKH72YpS/v9O2apNRP1F7csXZsInUTW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFrlP4xl; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFrlP4xl"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0B4F6151D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jun 2026 20:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZp_ZWrgRlLa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2026 20:03:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=hisamshar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF147615B3
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF147615B3
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jFrlP4xl
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BF147615B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jun 2026 20:03:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso10322765e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jun 2026 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781813020; x=1782417820; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBk9kGJqbXRSBiX8wQep4HoR3YvnXTOqulYjM3xplJU=;
        b=jFrlP4xl7kvqzuiIa5B0YkGIqXvAHDJcRcxEklIbNwSl+mWQA7xdMRdm0c0q21WDax
         pz0QA411BFPDg2RDnKg2IaQv6g/sDEhT5q+5AazP3+hpsyRmnfO8zCyFlEzQ0IaXkkyL
         v2y52GYipQUhxEXvdt4bCKIZ1cfZXSX1OCtArfJwz0foDVeBGB1K8wALk6bjTezNQ34d
         g2XQGvmNhXXSVeLZWk/wuNZzDMy3FmvCFMFfnjTaP5+pofWPDbnhjDkOowXOuuAaXneN
         5ze3oxc0GG21S8l2q838rjrxzeA30lCXWsvQDCi+QhkJHZNpFBUq28M+KxoLnuC4TEFQ
         ovaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781813020; x=1782417820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBk9kGJqbXRSBiX8wQep4HoR3YvnXTOqulYjM3xplJU=;
        b=Sirm3Y+rWqypIkTbLHiuaDoXxL/Cfx9vWKT2Y3ckdVvTYTjU6ThaVqihSZXmhuByiw
         j/fIzKfsIDN0T0L5ZL82dE6VzGc5UUP1snnjK4K6WbHvy8qVcYzyr300Gwj9s3HIR4E6
         74LtqllMn+Dzjr2/Ia5Xt7T5ECwZJOzELpi/v+vcKOOea2ht9YwEEkEGNMaCdgqtUnt7
         YVkN5QURfILokPyxS3NdKwrvfLydQCN12JIz0ZFLMPq6AAT5oon8nAwYeKXqbzWgm8Uk
         DkV7C75pbUsKSFeoYpeX3RhmqMptEGNjAj8znv1IxwR90w3Ot1JlIdFkEEQsu42AewrM
         XslQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UoJK4voVSjaXskFxtsMPPZaTH9fVmjLJaR3AomqOgQUK9ogBRc97caFmVLwQLbSLFKwikHIqWDeuRulnPKWxxDkcMWw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzMIIiqImPZJZOrDIvgeevyX4kbMs/5gY1/KNCPfXxVc0PJsE9M
	zOjHxgUAXfSQoWmueMwaibSmdDtrCdG0O0+a8Usc2/Vo3FIEvg7PtNJL
X-Gm-Gg: AfdE7clHMpips38GF2lnA9ROV7tp/wM/nlUkYuFBKwQYrw646zOhC77TK/IegIqkKZu
	XK3hhfw88paWNS8cTTbdjLzHYDuwBzK/1I+9YbsOVnNczTVzc5ggbTHAJvgb3hKocwmu/NDR2bN
	yJKlkAW5G83ONd1hAKr7S0yi+YSdwMkXc/NQi4/VsEwSWPdXcXodWPGipoyJH5+33aumKRRyRJ9
	zzu438E5dn1oynhKUkPounasPdebEtTIJb5bWSPuyx7RH7+DnQFhFEGOON1GymKypwdPshpHHkY
	Jv5G9+BEUyhtvBTPEwCn4SDJknCUtfXv+CtlJvmaCNHe+1iuwvhYzWlukPJZms2gNQFvGbLITLf
	oQ8f5keg0rfFAJN3L4jP5hR8to4UE0sWTpZPzYIMELLxJZWxZmy6UxQ/FGbg4kul8teWyD42TFg
	RHIwXcHxOFnMzwGColrfeeSXtHub39654x52mnMZA1YrgJNQ==
X-Received: by 2002:a05:600c:4fce:b0:492:1e36:bb04 with SMTP id 5b1f17b1804b1-4923f6ad553mr18204725e9.37.1781813019397;
        Thu, 18 Jun 2026 13:03:39 -0700 (PDT)
Received: from [192.168.10.21] ([39.40.61.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650b67a248sm1487602f8f.24.2026.06.18.13.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 13:03:39 -0700 (PDT)
Message-ID: <60ef7ff6-0aa7-47eb-bcf4-76606ec016da@gmail.com>
Date: Fri, 19 Jun 2026 01:03:32 +0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/include/linux/types.h: add ulong typedef for musl
 compatibility
To: pbonzini@redhat.com
Cc: seanjc@google.com, shuah@kernel.org, me@brighamcampbell.com,
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20260531144934.403888-3-hisamshar@gmail.com>
Content-Language: en-US
From: Hisam Mehboob <hisamshar@gmail.com>
In-Reply-To: <20260531144934.403888-3-hisamshar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/26 19:49, Hisam Mehboob wrote:
> Building KVM selftests with musl libc fails across multiple files
> (e.g. memslot_perf_test.c, cpuid_test.c) with 'ulong' undeclared.

Gentle ping. Could I get some feedback on this patch?

Thanks,
Hisam
