Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203624;
	b=Uf2xCcrajx749VK6cJqru1vL9WvIswhAEtrqp59ozG35BZaMBdyOd6P2AfDIevkrhwGr
	 OKIuWKjB55kHKrjHN2PaXyR2S7UvOy5KqotBpLwy0ClxzkAdI4gGuGKq6w7p3TcLhjmfe
	 rM+FcHyC+8X3vnHrtFcBMo4UEhbmaVKb+rah6btUwhdaOZj71UCHXmNwf6SbgcXrZuiZZ
	 JGeJ6rb0/svX6eOKgvY+0v0dgqRVoYQ/kYtoybaJXafZ9p2mvIUIsL4OF1afppu7HCFrD
	 byKt78nX3cMjAgrDMBJM7oyXQmUsotSSg5VAYka72hVsxU69duVFDrpByI5jZCZmBqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
	b=BawHhQmJMEEGWeaJfUHz7wjb++deaApNGlpP2wrhiBopjG3Kg+7kEpMgSbmsOng5+EpA
	 8sd6tDUE5oXCjMBi5Gg9Cv2d5CNNq2USwcqfiwuMvfnCwaTkoiAmmx3Hr+1Q2LBrpjcDw
	 wbb4DbHn1VGy9tAVSry82T65AWAkhsdrAyL6cHw7tTZlx3XGZMfgmskS1DM16lKW6Qmgu
	 4Dqz17YHsaL+9ga3yUpza7CroNl3Fcx866bbRIvs1VMiZ1gBLnTr4J5cmWpHZqWEkfCcH
	 HS1/uYQEqrZyND9knSPiB8s0n9HyZ5DcVVEB+0s0b5ciKfKN8f+yTC/oFs7rvtx9dGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUP6JrrA;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF89606A6FC
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Nov 2026 19:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF89606A6FC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUP6JrrA
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so815665137.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Nov 2026 11:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203611; x=1795808411; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
        b=gUP6JrrAPdQdCx52cjkPgEj+tbStKjI5JEUwr44On9eUDDmsO11MSjVq6djCHMUP7a
         6t4RSbbMJS7uyo8w2TbYfkf1b/+DrGl+h3N+AzPcQIw8GLPsoVG8l1A79WZiRWFCGCuD
         x/WruntcyK4Ymlt40hHqbDInToNdQBiyTvfI8ee4p/7RiC+0mklcIo4JHWfaTE0j3JgG
         Q6TbK4LQTLzgfrlPdiGKhFa5L9UL3mqGL1ZMBWzcQx6hWewUfNZgdAf3+mKOU2g4lEyb
         QzRGMqcjUduGmYdLsBT0hWYEq98QkQMdOMozZBMQM/aBOhxDnRpWyekC0FKUFpZsyqKR
         geBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203611; x=1795808411;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
        b=m3zHyx2rn8HUx6AHoedEQRWAnQCrf7EpNB492Sg72ZVKbG1WMusYKkefW+HuLGQYOr
         wJau3RnTKyZrerydBX1ZUYWdquD+UQFznNDaqSzCaZsaq2TTlMl1XWcuBc4pXF20hyB8
         lJOd2YHvdk6gJ0cUuEXiBmEKYXdESi+ZEqzxMuIPCSMywm/zo4lNuOWkOuA6F8lLd7vI
         HVv53jNS6zP67Yc+XblCofTDiTJ2l6ZxWDygZiWHMdoiT/KZmkvdTF8OHlVK6KbpXqSX
         ANeVyxYDTZ3TUmhTSpVoMV8jPsaLZAh2+IEe+JpTGpbdfdfqbQ8bjKcwyk78Rsaf7vC8
         0ObQ==
X-Forwarded-Encrypted: i=1; AL+hErH46d8EjnhNnCvM2yJTMTcShPA/lG+O9p/yQ3vdG0MkeMUieVyl52BNt96sESTCs8wQw4P6MoNodWhZYNHl6AlpqPX4+g==@lists.linux.dev
X-Gm-Message-State: APuU4Z92jZopck1o4+2uNL6mBr2YmlAXNn+5LR+1USRDHTOPf8kbK2Ea
	VtcTtXylesqwJ4TlTsQqiKJZwkUsNhUJsX/V8XmCqyGNBOn+o0eQR7fI
X-Gm-Gg: AZFdTZdCAVbjYcRzIL4BMtWCO0nR1lrDSOK3hpU+ogafT8HMs1I02cXbhjEfFILMAAH
	tPww6B6F0t2UrgH8PdaCYcQF7vJORUwU3CC28djJYuDOoUp6TJwPUvQeN9twgL+80fPPwW3XZph
	RnLtaiaYygYkLcmTGjcV18cTiJAdy5lyG81UV8AAxcLHRpO2Qk8gt4/bAwY0zn/YmzWuPSBSAhl
	/EY2n6JBhAX9Sx5CZf4ZWyJNbLeiIa7s+xxPoUweAnBQgoxdnFzLsy1JfhYW997SVhIl23E8UB8
	EtqmA8DIfAGO+34Eru+STt0Vs0FcsW0h/VUcTVUw38bYNNILKvRJJ+x2UQJJa29RU+AE1ZZvkyI
	Q0KuwAw1h8FPEx+6RQCpK5OaBikgZ8eSQQR1dWqQ2t26g1clr+CqC+ITbnIQ0o4ISNMiqyS95An
	yZRijx0iiCKHEfVkD2jQ56/4DRcHVc+X4+74XJyTMKcN/VkgzoYJ9IlAB7t8kwRN3BTkC0vjB9T
	SYjGYu7hjzAgOu8Di3E3R691HjGUdXnzhgJs4IMvucpBCmB22RtyKprIyU2Vd+h1IDFVLXjaqw0
	9Zbqtbw+xMygs3mRB9iA0KdVw6d7slY0sccXOGNNBgGJVuyIiI6SAhEVb3KD/RCuCdUro7/ROcA
	xTa8cCeQoxQOAyRqxFqmVqtSoKZ0pQSDJiWN4
X-Received: by 2002:a05:6102:5091:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d7393ff1eemr1985327137.7.1795203611220;
        Fri, 20 Nov 2026 11:40:11 -0800 (PST)
Received: from ?IPV6:2804:14d:4c64:82a2:d4d:f9f9:a4fc:aa28? ([2804:14d:4c64:82a2:d4d:f9f9:a4fc:aa28])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a29csm3845871241.5.2026.11.20.11.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:40:10 -0800 (PST)
Message-ID: <a848c700-f1b4-4975-8c80-27b8c81160ec@gmail.com>
Date: Fri, 20 Nov 2026 16:40:04 -0300
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] staging: media: atomisp: use kvmalloc_objs() and
 drop redundant OOM messages
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Content-Language: en-US
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/14/26 19:48, Rodrigo Gobbi wrote:
> Several allocations in the atomisp driver still size their buffers with
> open-coded multiplication, e.g. width * height * sizeof(*p). When the
> dimensions are large the product can silently wrap, causing kvmalloc()
> to allocate an undersized buffer.
> 
> Convert the remaining sites to kvmalloc_objs() with array_size(), which
> saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
> allocating too few bytes.
> 
> This continues the work started in commit [2], and picks up the stalled
> sites from [1], unifying with [3].
> 
> While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
> the touched allocation paths: the memory management core already emits a
> far more detailed warning on allocation failure as raised at [1].
> 
> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
> [2] d178c7ca8fef ("staging: media: atomisp: use array3_size() for overflow-safe allocation")
> [3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
> ---
> Changelog:
> v4: 0002: use the full commit reference form for d178c7ca8fef (Media CI checkpatch); collect Andy's Reviewed-by;
> v3: https://lore.kernel.org/all/20260623221028.40238-1-rodrigo.gobbi.7@gmail.com/#t
> v2: https://lore.kernel.org/all/20260622224402.34001-1-rodrigo.gobbi.7@gmail.com/
> v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
> 
> 
> Feng Ning (1):
>   staging: media: atomisp: use kvmalloc_objs() for overflow-safe
>     allocation
> 
> Rodrigo Gobbi (2):
>   staging: media: atomisp: use kvmalloc_objs() in make_histogram()
>   staging: media: atomisp: drop redundant out-of-memory messages
> 
>  .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
>  .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
>  .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
>  3 files changed, 41 insertions(+), 76 deletions(-)
> 

Hi all,

Gentle ping on this series. If there is anything else needed from my side,
please let me know.

Thanks,
Rodrigo.
