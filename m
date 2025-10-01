Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EE32FDC41
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 20:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759350525; cv=none; b=elnerHz+NfHz/LJWVxd4xCp0XRJ0V3gOrd+qsvOXq556cLzGc14L11vG0pn4mLoQ2wfzoG7cSKFuhoZshNw9hx9vaakVS4wJZOwEnlxbhoPBZ52Uijt+seGAdisYXrpeH7Mt/3I1ioBCr5xgiTm6LFasUA603KAUL1cTVAQ3TPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759350525; c=relaxed/simple;
	bh=JzNNoDWyqa/zS7UWyDTfg/U2MEu+uqwPpkYQr/cahAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y95zwcoC9bc/jKDkZp68OUtlZLUt+OnHzxUk7JRMytHkWvERCJ2R77+HERvAzbgKCu1S53WXXAuqQ6BY2Fsfpn54e2tP8krlVN2C05YVyfFPzB2mgtp4jZy3fez2NPOP+lFxiZxFqqQa93BYMT+wrH4PJ3DEd+2dhThnxJu+AUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFjGuR6D; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFjGuR6D"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A809840A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 20:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_suJGGMTwdc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 20:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A9D0840A3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A9D0840A3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CFjGuR6D
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6A9D0840A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 20:28:42 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-634beb1a884so67503a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 13:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759350520; x=1759955320; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vx5hdGkahy1NQamogmVtVf5yuP6YF2+NsatonLX9Rk=;
        b=CFjGuR6DPghIYdbuYaGUIdP7svsh84Gxp5HauSfscLZjZ9egDA5uEGVOgoKLwJEcyz
         39UAxWgCR8JQgNlBDk2LxgsqA5sDlDWD+fGHyuL4q50aEq0/JdO9LjC1Fd2hUWBZ/459
         cAf5v/3QnH85zXo8Kp4O/hMOqAW7e8JhjfBCjRghtKjKUjGUhks30ldKUG9aVJjQTtqf
         Ks6OUSro1rlJFJmNfhnYpGiqmaTxARKVLnK/hh78r/8XDDhwcXexkjKGmxvPkCMQ+WSL
         qWxMUJKLfmOGNPqNmtZ2r3pFRXZNznDArgrktHCpUxepukiV+7pT8CrecFuZHfU2xatI
         e+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759350520; x=1759955320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vx5hdGkahy1NQamogmVtVf5yuP6YF2+NsatonLX9Rk=;
        b=Mz/VK4c3zTbsFNWxL3qm7tmr9wmyopClZaiNAUeLegl86FMedJKkv+Y3nwORPt8VEJ
         HDfo8gevf9b5Fig5xdogXYJDeO8TY6p/LbanZpe1gQp32N8qWDkiyb2T+0DVpM8RDM9+
         I5wdJqfAF6/SoVMj2ryjktiJUetetseMWMzUSToh53ZkjgfEVudlT940lfVWb8DMGE0A
         D7ss/qih7yVGZSD4cxBq5c7nFLFqPm5yxkdHLC0GeD3kW0zG/8IAFt1MPVbbH2NA+n6I
         4xd0auq6tgVLw2EPoRtsNQNxPy4vkANU1QKnQgXi6sPwgtKk15fejY9cIajoEWi/SpJ3
         v2vw==
X-Forwarded-Encrypted: i=1; AJvYcCVbXeIuCme1f5JUVTNWSs4/6viCZi719ltqz56gxtkoABuBUtNIMshe3201rJzZsDRo52q7z3pIyFXB78ZR2WPF3cPbmg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yykt3lyh/fUsgUhs+UXxFnd9+ApuqA9woNN9ENXqdWtrA9X5FLF
	aLkU8cWezPnfciIkFsTxyEDkAhVIslonvGv2ZsvrseRZyoVzB8dvBx0d
X-Gm-Gg: ASbGncuH97sSC13yr41P7pkpuB5oqDBi/bwUIsrQoGsIyCTUgIddItbsVHLhhw/yEvG
	iUT0Gw4+lHgLjgSmsbjnC5yBD72/noLqHK65cHuFLbnXd30FlaJcH/3Kau7ey/fjKcJ/iw8hW0o
	wmN1/zx/Lx2Heyk7XaziaYi91ug6oV6Fabylk0SIk2Kz1rd27Uxe3TEa3mPzYzcVXp+ZAX1VqkQ
	aM31FwNgmDbt4nuMwCs84odELUEoNiRj8J6hT/QP650klREo29GAYGe2rzlzlQcaE6mlEisSzMx
	Yg5OViU+4OG/2R9TIefbtQQOsdXMe1AI7guHj7e5NYSIShZoLFwhFDi+oOGrfLpJ7zFJV2Swr6L
	3u2L22LVoUaKa7QFh1G5JsqGZD6BoaH09fvPt86CqWKd9uqDLASr/fCM5aQ4kzim5hch2KQ==
X-Google-Smtp-Source: AGHT+IFypxArnR4xsqK1PVKw3BTncFOVNbk0EzgLn+bv/Qi9HndoSHc9qYacyAg9i+F0I7m7EgQ4fQ==
X-Received: by 2002:a17:907:7eaa:b0:b3a:6c29:3552 with SMTP id a640c23a62f3a-b46ea1277b3mr326729366b.8.1759350519925;
        Wed, 01 Oct 2025 13:28:39 -0700 (PDT)
Received: from [192.168.1.103] ([165.50.124.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b23csm40909366b.61.2025.10.01.13.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 13:28:39 -0700 (PDT)
Message-ID: <581decf0-d360-4da8-a247-3b207d5ca21b@gmail.com>
Date: Wed, 1 Oct 2025 21:28:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/bpf: Add -Wsign-compare C compilation flag
To: Eduard Zingerman <eddyz87@gmail.com>, andrii@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org,
 davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, linux@jordanrome.com,
 ameryhung@gmail.com, toke@redhat.com, houtao1@huawei.com,
 emil@etsalapatis.com, yatsenko@meta.com, isolodrai@meta.com,
 a.s.protopopov@gmail.com, dxu@dxuuu.xyz, memxor@gmail.com,
 vmalik@redhat.com, bigeasy@linutronix.de, tj@kernel.org,
 gregkh@linuxfoundation.org, paul@paul-moore.com,
 bboscaccy@linux.microsoft.com, James.Bottomley@HansenPartnership.com,
 mrpre@163.com, jakub@cloudflare.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 mptcp@lists.linux.dev, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20250924162408.815137-1-mehdi.benhadjkhelifa@gmail.com>
 <fbbeeee096dc14332c50b1086b2089f1b2f496d9.camel@gmail.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <fbbeeee096dc14332c50b1086b2089f1b2f496d9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/25 9:23 PM, Eduard Zingerman wrote:
> On Wed, 2025-09-24 at 17:23 +0100, Mehdi Ben Hadj Khelifa wrote:
>> -Change all the source files and the corresponding headers
>> to having matching sign comparisons.
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>> As suggested by the TODO, -Wsign-compare was added to the C compilation
>> flags for the selftests/bpf/Makefile and all corresponding files in
>> selftests and a single file under tools/lib/bpf/usdt.bpf.h have been
>> carefully changed to account for correct sign comparisons either by
>> explicit casting or changing the variable type.Only local variables
>> and variables which are in limited scope have been changed in cases
>> where it doesn't break the code.Other struct variables or global ones
>> have left untouched to avoid other conflicts and opted to explicit
>> casting in this case.This change will help avoid implicit type
>> conversions and have predictable behavior.
>>
>> I have already compiled all bpf tests with no errors as well as the
>> kernel and have ran all the selftests with no obvious side effects.
>> I would like to know if it's more convinient to have all changes as
>> a single patch like here or if it needs to be divided in some way
>> and sent as a patch series.
>>
>> Best Regards,
>> Mehdi Ben Hadj Khelifa
>> ---
> 
> I don't understand why this change is necessary.
> Have you found any bugs while doing this conversion?
> 
> [...]

Hi Eduard,
No I have not. It's more of a future proof patch / improvement rather 
than a fixing patch as i mentioned in this email[1] with more detail.
Regards,
Mehdi
[1]:https://lore.kernel.org/all/e3a0d8ff-d03d-4854-bf04-8ff8265b0257@gmail.com/

