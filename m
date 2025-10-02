Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EC4227BA4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 19:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759431656; cv=none; b=u6jm5ntmcKP+qbNit2AaKKU0OLKgO11twP5w3eSwqlnQgV+9XSIauzW+LbtOW0MbeGPk/f0Jta316M7TVBCQoK7gIDrn/vRvbShg1R9Uq8Qx7/aRELETYCdNfMs3iNPQW1Bq40FKjdU8iW0msitqLgIip2YXSVs3tgzBXaRB6KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759431656; c=relaxed/simple;
	bh=HdRM6QtSEu6oISwiLRqfnMz+LiKeMqQ1/pBIxbMP6TM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XUvRX0yETujkt1ZyNNA+jS4zkeLbyrWNUNbFavtU0p7MUEq2Gr29hajfqFIy/fc6L1Q/9RMY/5gmaiJQP/h/3yzWDh33p4glcU7dn06gx1mLoEFMzXlssSQ8TM4/UvgB3/MA/hBfHHtmYHRCEIOuZNZvdbyeX++dY5BJMmhoIrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rv9178eL; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rv9178eL"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2751640088
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 19:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3pRKhOHomgo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Oct 2025 19:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1211D4008C
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1211D4008C
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rv9178eL
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1211D4008C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 19:00:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e542196c7so14643165e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 02 Oct 2025 12:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759431651; x=1760036451; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6fOaFPX2oAXf2qf/MzKaSamzMn6vecX7vKZ+f0WXRk=;
        b=Rv9178eLZBvDlk1U1uPy6DqUYyBv/sP7X2ZWAsMQMxJDgZYXX4b293XaBA8/yiGoe4
         t0ZXdG9KlQuvyqZrKeRdnrqF2jN1KKqgend9OGf8oyT9jTzzc6x1JlmidAqCnk/UE24L
         KUWvJxU7twwFF+f/Pft2g2sPO4+vgZK+JwoJHB+JtPTAahQrMh0RYWi93ywPKQiHM/0G
         SQhNGWPqchoUO+Bpji4FYGzsbrANqtzq6eGnWW+Cz97ckIIGalNuWk9Zi1pnH+LhAKI2
         3+3UjCOcF/bxto8WrUZWiS4ATGsbtO93kvzXXuv5/dtXsOR8GYV/nORBUurmpuCh/prn
         RTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759431651; x=1760036451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6fOaFPX2oAXf2qf/MzKaSamzMn6vecX7vKZ+f0WXRk=;
        b=vvFlmrvtJQG229vruFhtHy30JgyEyHnrbTd7doV4JwolLrAoYetuxAPyFzDY8qcjlG
         PUrZ+lg8uLhnj78OAxmIcsw8pocI/kJSvAyCHTAIjN3ToZqHkfm/VM3qU8E+Afy7Y5Xh
         hyTKFPJKHpxfvgPbJWoYvesCVMPMonukOKxQf1+f2dkVLBWvIRwmEfdrVT1+NA6qzHwP
         poq8iqv2u2tJF87oCUSAY8bMZ+TaZ+9DZsJxTv70JfTNowMCyLjU+EL7wWB3Tkxqv/kg
         o/DIA/+5Ih4FEgUiPapZDy7n1s2+oKv2qVT5v9bGjM2jJEt+vqR3tC9QbZ98LC4ID5I0
         Ls6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4Tw0OD+cGNy2guz1fe+DMrJq3ZwHFxyEGul9F5LDIH5zjm1AwHM25wc4v+ZmjStcGHCzt9E2xTYroYEYt5qtvfwBLbg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx7/tVQqOeTvc4/CLfy9dNf+EZoUNjOku4TUT5qO/lPCjBwhkfg
	gZoH0Zhs300MYqGLkqHSOvdsBzFV9H5UYCkNEpO/z2ZqbtaSX0SIJ5su
X-Gm-Gg: ASbGncuRhbo4/CKLQaR1ydAtE4oEW68ThgyT3x0mtL7S5esrjzS13tRQA7lPjw5vx7n
	kEp4U5JI1kd+Rza+v+0jRPf1CNT3rAj9rgMTMrHyy9hEocvD19StZAsDe0H/gzkq/xmHpdE9jsM
	wehlE1xYtHQkjzj2XKWiX9Q5BSz398r/roUq1zdYHE6844rLpFtQgkjBIM7v+OlPsQHLPyVlbWK
	BdSxIPXrH/w2wkSFfigw6jatYGta6Dgevni38da69v7mKXBiCYqiwOwfVRU1V8w2Bb4rIcx3vki
	qmGWtjLIk7W28TkkOmW8oWDwgOK7TwDmCrOrJ0GlyJDCWblBXpyhTl/Cyq/qgRA/NA+7AE4ddXB
	LlmHJqnW4nQ+gG/JAfkEsWn52vQ0oj1QcSJ36XuNtjVG7oZaNhhZyvE7zPgLg+TVec1fHGLmuR4
	9aNk7NhzXFfsFA
X-Google-Smtp-Source: AGHT+IGaoHiZFJpX7P4fpJ5gN/YctPtIRaA4HuaLp2YmDRoVlK6rbZNidGIsWnYJjI0Td812wrRW+w==
X-Received: by 2002:a05:600c:83ca:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-46e70c5cef4mr4217145e9.8.1759431650257;
        Thu, 02 Oct 2025 12:00:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6918bb06sm51107905e9.8.2025.10.02.12.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 12:00:49 -0700 (PDT)
Date: Thu, 2 Oct 2025 20:00:47 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org,
 davem@davemloft.net, kuba@kernel.org, hawk@kernel.org,
 linux@jordanrome.com, ameryhung@gmail.com, toke@redhat.com,
 houtao1@huawei.com, emil@etsalapatis.com, yatsenko@meta.com,
 isolodrai@meta.com, a.s.protopopov@gmail.com, dxu@dxuuu.xyz,
 memxor@gmail.com, vmalik@redhat.com, bigeasy@linutronix.de, tj@kernel.org,
 gregkh@linuxfoundation.org, paul@paul-moore.com,
 bboscaccy@linux.microsoft.com, James.Bottomley@HansenPartnership.com,
 mrpre@163.com, jakub@cloudflare.com, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, mptcp@lists.linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
Subject: Re: [PATCH] selftests/bpf: Add -Wsign-compare C compilation flag
Message-ID: <20251002200047.2b9f9ef9@pumpkin>
In-Reply-To: <e3a0d8ff-d03d-4854-bf04-8ff8265b0257@gmail.com>
References: <20250924162408.815137-1-mehdi.benhadjkhelifa@gmail.com>
	<20250926124555.009bfcd6@pumpkin>
	<e3a0d8ff-d03d-4854-bf04-8ff8265b0257@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Sep 2025 17:03:29 +0100
Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> wrote:

> On 9/26/25 12:45 PM, David Laight wrote:
> > On Wed, 24 Sep 2025 17:23:49 +0100
> > Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> wrote:
> >   
> >> -Change all the source files and the corresponding headers
> >> to having matching sign comparisons.  
> 
> Hi david,
> sorry for the late reply.
> 
> > 'Fixing' -Wsign-compare by adding loads of casts doesn't seem right.
> > The only real way is to change all the types to unsigned ones.  
> The last v3 did only do that with no casting as it was suggested by 
> David too.
> 
> > Consider the following:
> > 	int x = read(fd, buf, len);
> > 	if (x < 0)
> > 		return -1;
> > 	if (x > sizeof (struct fubar))
> > 		return -1;
> > That will generate a 'sign-compare' error, but min(x, sizeof (struct fubar))
> > doesn't generate an error because the compiler knows 'x' isn't negative.  
> 
>   Yes,-Wsign-compare does add errors with -Werror enabled in that case 
> and many other cases where the code is perfectly fine which is one of 
> it's drawbacks.
> Also I though that because of GCC/Clang heuristics 
> sometimes min() suppress the warning not because that the compiler knows 
> that x isn't negative.I'm probably wrong here.

That sentence doesn't make sense.
The statically_true() test in min() uses the 'value' tracking done by modern
versions of gcc and clang.
This means it can let signed types be promoted to unsigned ones because the
compiler knows the value isn't negative.
OTOH -Wsign-compare is a much older warning and is only based on the types.

> > A well known compiler also rejects:
> > 	unsigned char a;
> > 	unsigned int b;
> > 	if (b > a)
> > 		return;
> > because 'a' is promoted to 'signed int' before it does the check.  
> 
> In my knowledge,compilers don't necessarily reject the above code by 
> default. Since -Wall in GCC includes -Wsign-compare but -Wall in clang 
> doesn't, doing -Wall -Werror for clang compiler won't trigger an error 
> in the case above not even a warning.My changes are to make those 
> comparisons produce an error since the -Werror flag is already enabled 
> in the Makefile.

This isn't about whether -Wsign-compare is enabled or not (or even what
the option is called).
It is about whether the compiler's 'sign-compare' warning triggers for that code.
The one that detects the warning/error isn't gcc or clang but is probably
used far more than clang.

> 
> > So until the compilers start looking at the known domain of the value
> > (not just the type) I enabling -Wsign-compare' is pretty pointless.  
> 
> I agree that enabling -Wsign-compare is pretty noisy. But it does have 
> some usefulness. Take for example this code:
> 	int n = -5;
> 	for (unsigned i = 0; i < n; i++) {
>      	// ...
> 	}
> Since this is valid code by the compiler, it will allow it but n here is 
> promoted to an unsigned which converts -5 to being 4294967291 thus 
> making the loop run more than what was desired.of course,here the 
> example is much easy to follow and variables are very well set but the 
> point is that these could cause issues when hidden inside a lot of macro 
> code.

There is plenty of broken code out there.
It isn't hard to find places where explicit casts make things worse.
The problem is that, even for the above example, the -5 could come from
way earlier up the code.
If you 'fix' the warning by changing it to 'i < (unsigned)n' the code is
still just as likely to be buggy.

> 
> > As a matter of interest did you actually find any bugs?  
>
> No,I have not found any bug related to the current state of code in bpf 
> selftests but It works as a prevention mechanism for future bugs.Rather 
> than wait until something breaks in future code.

That's what I expected...

> > 	David
> >   
> 
> Thank you for your time David.I would appreciate if you suggest on how I 
> can have a useful patch on this or if I should drop this.
> Best Regards,
> Mehdi
> >   
> >>
> >> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> >> ---
> >> As suggested by the TODO, -Wsign-compare was added to the C compilation
> >> flags for the selftests/bpf/Makefile and all corresponding files in
> >> selftests and a single file under tools/lib/bpf/usdt.bpf.h have been
> >> carefully changed to account for correct sign comparisons either by
> >> explicit casting or changing the variable type.Only local variables
> >> and variables which are in limited scope have been changed in cases
> >> where it doesn't break the code.Other struct variables or global ones
> >> have left untouched to avoid other conflicts and opted to explicit
> >> casting in this case.This change will help avoid implicit type
> >> conversions and have predictable behavior.
> >>
> >> I have already compiled all bpf tests with no errors as well as the
> >> kernel and have ran all the selftests with no obvious side effects.
> >> I would like to know if it's more convinient to have all changes as
> >> a single patch like here or if it needs to be divided in some way
> >> and sent as a patch series.
> >>
> >> Best Regards,
> >> Mehdi Ben Hadj Khelifa  
> > ...  
> 

