Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E851BF334
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Jun 2024 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584723; cv=none; b=NvVzjN7ThbcglJnMJDHz3n6aNqYmrmnYmghJnMhK108Oiskdo/YRFF7FIybSAQK8Hz7fx2L6G6bl0ckTdzP1iZ8RUaH7OjsT2o0J6Wtut7iGg7mNJwZJcGRP9BY6X/60EpxsRTWVZfC8+Ib0+La7cyRRUOazQuEWvHZNyAQ0xDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584723; c=relaxed/simple;
	bh=Zo4QNEftC90ngAD8RC20T2f2OvX59Lz7ga6iZJ6sNfw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qGYQojFZmCz+5CUX2Hy49qA/1aVyGmJsHH+SyPK+U+WkismEWI2cURoQii7oow58vQ+RzVd3l+ROLaUuNCsMIgtu6xWANE/i3UPiRtV+sT3/26JZ/lT3JGzgzNjUJPiuxKZ9PJdk2ykHaBOwpiRW435A+FBL/Q6s2Ul+r0e+xIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ynsb2Jjc; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ynsb2Jjc"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3EDB6100B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Jun 2024 14:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbIy4fzjpJYT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jun 2024 14:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=xadimgnik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DFFC60D91
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DFFC60D91
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ynsb2Jjc
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7DFFC60D91
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Jun 2024 14:25:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-424aa70fbc4so4725995e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Jun 2024 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719584718; x=1720189518; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VeAwXuF7+pmymrZyPiqRkGCZGiMSVwcLFpTO8NXP0nk=;
        b=Ynsb2JjcCqZuHgaIYQk3WDX9E0Td2+EbaW6jkH7YkoOV8bPeKxwBfKtuspU763ZeVG
         NheSN9RGRNT9ToXBAD/VfecSUC6hcDLXYe14fReyTzrJXRP5/Ax6eJYscdgC7ymomjyP
         BIYRCNHBo67AisvicIE3jIuRTc369ydXdDT25LvmhSX2axWO0NIBUi6CCSAbfTfh7BfO
         nEwAAdD6UFgK07SHTYVvfrywOevW/EJ4KpleGpvZ1lBPCVfVlWuF3Zhzf1kWM5tUxmLf
         M+agQOaZ+B8rMRY7o8OWSTtlDUN+akH6T9j5QGqGt3Zl34u6CfonlxOUJWHoKcZGtUhg
         puAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719584718; x=1720189518;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeAwXuF7+pmymrZyPiqRkGCZGiMSVwcLFpTO8NXP0nk=;
        b=n9gp3rxyUsiPbws+nRH9nNukaS1tUnzDQgEDrdR2wzu8VfPwRRk5LePnThijJL+fsQ
         TmRX70LxMTV/O3FVSjjuTcIrst8prWwj4MBA7EicZ5Yj59oRjLMSZIaXu0pNCeDoMS7D
         YbxqR1pS/aL+0GeZJPOdX9eNJrAx7+S0ckcSvVO1XH7xQlSmAIRVsq4jtcvUnYxFm0CO
         wbWfQDRozxSF+j49Ce7PH5H3oE1PKdHOLi0ymGEptoMooXGmNsqGC0ccKVUVO3dY04WZ
         35Ad/gdZj6XNizprtloN0Jhhf3+x1R0O0OjtMKtKYu20XUHHVkt3/4FAKeTpl1JeRgmN
         YscA==
X-Forwarded-Encrypted: i=1; AJvYcCVth1Lotcb2F1PuzH8SOFuvt+i7Y9RPnSJnor5KG0/RQsCpDitxa4TtLEkxeZlUMeqKEjmnr3WBbMg95r3UZ+M70hIaN1BaUL/Z8Os4U1/dBbfl06or7pBNs0in7j0L
X-Gm-Message-State: AOJu0YzOKx/2Upf16xoqPtsoFi4MkTG6Lrun7evDINEYtAL4Kl+z16Ws
	nOZdqabTnpT2YC5xqfmdOHg/hpHYlIs8JSx5zeeE0cSuV824LGqX
X-Google-Smtp-Source: AGHT+IFTYNRmuabn1FZnyKG4Uik1w/ofEuzazYAzcKR3V8UFSfbfjagdPNoyM0oNWquKxkwJrJckjg==
X-Received: by 2002:adf:f782:0:b0:35f:2725:7ae2 with SMTP id ffacd0b85a97d-366e9628e80mr11865862f8f.57.1719584718199;
        Fri, 28 Jun 2024 07:25:18 -0700 (PDT)
Received: from [10.95.168.202] (54-240-197-235.amazon.com. [54.240.197.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8d9fsm2458985f8f.26.2024.06.28.07.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 07:25:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4e25df0e-000c-4af7-a34f-ba831623aab8@xen.org>
Date: Fri, 28 Jun 2024 15:25:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2] kvm: Fix warning in__kvm_gpc_refresh
To: Pei Li <peili.dev@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, llvm@lists.linux.dev,
 syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
References: <20240627-bug5-v2-1-2c63f7ee6739@gmail.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240627-bug5-v2-1-2c63f7ee6739@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2024 16:03, Pei Li wrote:
> Check for invalid hva address stored in data and return -EINVAL before
> calling into __kvm_gpc_activate().
> 
> Reported-by: syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
> Tested-by: syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
> Signed-off-by: Pei Li <peili.dev@gmail.com>
> ---
> Syzbot reports a warning message in __kvm_gpc_refresh(). This warning
> requires at least one of gpa and uhva to be valid.
> WARNING: CPU: 0 PID: 5090 at arch/x86/kvm/../../../virt/kvm/pfncache.c:259 __kvm_gpc_refresh+0xf17/0x1090 arch/x86/kvm/../../../virt/kvm/pfncache.c:259
> 
> We are calling it from kvm_gpc_activate_hva(). This function always calls
> __kvm_gpc_activate() with INVALID_GPA. Thus, uhva must be valid to
> disable this warning.
> 
> This patch checks for invalid hva address and return -EINVAL before
> calling __kvm_gpc_activate().
> 
> syzbot has tested the proposed patch and the reproducer did not trigger
> any issue.
> 
> Tested on:
> 
> commit:         afcd4813 Merge tag 'mm-hotfixes-stable-2024-06-26-17-2..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1427e301980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e40800950091403a
> dashboard link: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=13838f3e980000
> 
> Note: testing is done by a robot and is best-effort only.
> ---
> Changes in v2:
> - Adapted Sean's suggestion to check for valid address before calling
>    into __kvm_gpc_activate().
> - Link to v1: https://lore.kernel.org/r/20240625-bug5-v1-1-e072ed5fce85@gmail.com
> ---
>   arch/x86/kvm/xen.c  | 2 +-
>   virt/kvm/pfncache.c | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>
