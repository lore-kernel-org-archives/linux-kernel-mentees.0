Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE0D29B795
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Nov 2025 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069635; cv=none; b=Xg2M7C/XlQn9n6hQYX6Vf08ojZOWe0P5qA+RlVWgObe8uvG1VvBecS2LtG8FwFMR/EnDStaG3buINMefQhdzA68+KEw66HECByUfnRjExvMYem7T7k9RvkJit4Mfnrj1UAZPUTPTUm0fNHoVAziG2sUahiWSFVTICLaDXVuXJ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069635; c=relaxed/simple;
	bh=a4+h+unp3TP1oyr0yJ3XjFYwuxew3KdwZUR593H/1O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgaEchmPGfdz4sS3pAsJ9tThnfImad3nbLIPbTITdjoCwV6e4OlSNrofsohbnbqIjAXUm5LHcbuuW2pnJvVpOXK1CPZlHd8dbnBWck+w793uKKUbQ0SGVEHpXvBwzcttqFG3qAaIMkRVCHBpWLhJs5r2jdQbJRd5K6f1wjjcnrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gs7qujiq; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gs7qujiq"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DF2040209
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Nov 2025 11:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLlt995rKPy7 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Nov 2025 11:20:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B97B24007D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B97B24007D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Gs7qujiq
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B97B24007D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Nov 2025 11:20:32 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7c66822dd6dso1751977b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Nov 2025 03:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764069632; x=1764674432; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVhOQpkFhqqTf3BtOV6vobGzp0Wpfer3ElYSjbBrdyo=;
        b=Gs7qujiqhNQSMiZsM03mGKUuQu7uZvnK1uDXKel/zWb3KJI6usI+nyvrkUrt8g3VsG
         fibGLEh3e7Hgmgxxg3jWfHlHMCTwrTB+Gp6rEU2d7Fty1wXW2qYk4EqQWg/XcKNq/HAh
         mUir1Rxf0HH1pqQpcNeO1+wg4SN2/z25bFrM6HN4iZyL/anVnOE1OZOpIhxbPDsmtHKq
         e++xsbe8bqTtQFIn+Hj3Ici34YVAiyET8LM3kIIgKGDDdtjo5vYM1XMvSABwPRawoVeG
         cIJIlOw1yS6Y3dHFxEqc/SPuYL4eooG6PxxL1lqVP9pwm5egNlcUJdqe0jIybvvgOXwF
         kfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069632; x=1764674432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVhOQpkFhqqTf3BtOV6vobGzp0Wpfer3ElYSjbBrdyo=;
        b=MuMrYLDYyx71N4LiIamV3ifbsa/77lqZKlJY2GkQzQ08sAFPnP1VvOcvt87rlweeyL
         9P9WOuWmLma/0vnj7d4wA0soqG3hct8UpaCjvzjqqQsa+Q8B++lBSpd8o96omQzdmxkR
         sedCWkhKeQLGewIjikr/qoCebg19VQx0TRCtp1oA7pV5jGkLRwEzpw45knH9MJ7XiATd
         +QxMaEyewgDon7sjCjNoiUbhlKgHg8taG8M9C4zU4g9X9tQpYxZ18yY6njlkU63nWbb9
         7ukh8sDm3E3mjG1uZdOshs9CxiFBAOEsPpnTIlEab6EaeSBJ93QqDNpaFBjZgm59i7dj
         bo2A==
X-Forwarded-Encrypted: i=1; AJvYcCVkzg9bgoJpHsfbgM9ugP9U41EoO+XK0/8z7VLvyu0TH3QBe+Ltjt9omEdo0z9xUWJJXUtG/PQZcp4AGLiwG2nTS/qUHA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwQLY5BWf1ET9krL7y1xs6tkBBWl3so1AVhR7CVy5PhN/eAG/JE
	SzwBZZqCnZqP+RQtySINAfZ/pCPxpxrwH29ft5fTe0oMHy+YaC1vGEUn
X-Gm-Gg: ASbGncsP18Ik+rskSxCJHwmA8HqjBXL5EuVyfuM6yEjAunb12WKsEhFTa6txhlK9A+Z
	iR8Jsy0SYTtuMkskkyS6PFpRR+HtrQPZ6VX3RWtZU/gAD906Gue6PVQq/SKP5MPkBi2MS2cJkml
	iXhrdJUdQ4/U+hEKcyt4jOCGVNAj4E7WayR2Tq3ybwOXiYhege0Ja0t20P2v2yrRsFMOTSSKraa
	h13zD/FMCIca5k/W4p0CLBTQ5hN+pYJocyTV2zHJO5/C+HvvXKEp4cXJJqg7HpLEGETH6rNJAzg
	AgJd3x/5IEugTahvDNf7hW9z0w0zREvCO9g2AD7SsQhOL34jbjp/8sWNDfods20V0CF0SyAthVN
	UoEt1qFwyLvViXG+VjiO6XkLbMOLtWuSFy7OKoZZJZ30T9dMIRx/yNYoZXukAPjhwRnonI5uoUr
	OTCrq6G6t0HB+Q+9ppVnth196a6tROcQd/2FP5OP0x/xmhkYygYHAcGBD1Vr7PiDAPoJtNFUtPF
	yg5sJ/Nn61BhAu/
X-Google-Smtp-Source: AGHT+IHceA3bqsPjmyCa2TPF6zTj0bq2CPgSfhCVMko2nEB7fZ8pj+ZsS/cB9USjHK3Gmjz3R3UxLg==
X-Received: by 2002:a05:6a21:99a5:b0:35f:31bb:5a5d with SMTP id adf61e73a8af0-3614f227b8fmr16367798637.2.1764069631818;
        Tue, 25 Nov 2025 03:20:31 -0800 (PST)
Received: from [172.16.132.48] ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7d70asm17822575b3a.13.2025.11.25.03.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 03:20:31 -0800 (PST)
Message-ID: <8e1ff2f1-b45e-4b1f-b545-d433e277607f@gmail.com>
Date: Tue, 25 Nov 2025 16:50:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/seccomp: fix pointer type mismatch in UPROBE
 test
To: Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev, khalid@kernel.org,
 david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jiri Olsa <olsajiri@gmail.com>, sam@gentoo.org
References: <aP0-k3vlEEWNUtF8@krava>
 <20251026091232.166638-2-nirbhay.lkd@gmail.com>
Content-Language: en-US
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
In-Reply-To: <20251026091232.166638-2-nirbhay.lkd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/25 2:42 PM, Nirbhay Sharma wrote:
> Fix compilation error in UPROBE_setup caused by pointer type mismatch
> in the ternary expression when compiled with -fcf-protection. The
> probed_uprobe function pointer has the __attribute__((nocf_check))
> attribute, which causes the conditional operator to fail when combined
> with the regular probed_uretprobe function pointer:
> 
>    seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional
>    expression [-Wincompatible-pointer-types]
> 
> Cast both function pointers to 'const void *' to match the expected
> parameter type of get_uprobe_offset(), resolving the type mismatch
> while preserving the function selection logic.
> 
> This error appears with compilers that enable Control Flow Integrity
> (CFI) protection via -fcf-protection, such as Clang 19.1.2 (default
> on Fedora).
> 
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
>   tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 874f17763536..e13ffe18ef95 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -5172,7 +5172,8 @@ FIXTURE_SETUP(UPROBE)
>   		ASSERT_GE(bit, 0);
>   	}
>   
> -	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
> +	offset = get_uprobe_offset(variant->uretprobe ?
> +		(const void *)probed_uretprobe : (const void *)probed_uprobe);
>   	ASSERT_GE(offset, 0);
>   
>   	if (variant->uretprobe)

Hi all,

I'm following up on this patch that fixes the pointer type mismatch in
UPROBE_setup when building with -fcf-protection. It resolves the
incompatible-pointer-types error seen with Clang 19.

Please let me know if there are any comments or some changes needed.

Thanks,
Nirbhay Sharma


