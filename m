Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F8D33890C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434011; cv=pass; b=CI/LFnQCe0m6VZJSYu1RF6mY+szMGl1ebxRkSmd5PxSUCQ5R9JO5BJZKiSYLOi8WchZM6se8pikDCf+XltOnUzrkVr4S8OyPUbMnZLxylP2lsrViRq1FjEeYM21q/8sYK2y9pfjcqdeAD1ZJQwyvDKowAcE//GU1ojoGFTRPjMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434011; c=relaxed/simple;
	bh=BX64JmH75Zpil8XSGmc7fuBqvPJ74wuAVwHgMmKcf9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0Wol6zekhInh7gVhsm07HuVuSyNKwjmlaNZAiG0p7nXAPkfk4Bmkli99/Hj77WlecyQiWvzAffydTkkG/3ahKZuEnuoTX0n0DQ3wwBO+f9fANcV+tn7OdkbDKMpSj7W3GXp5KpX6qk6A1GIiKgOdaagaQSzeOyE878cxw5gSNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xcFowKWk; arc=pass smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xcFowKWk"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C74D14084F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 13:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6eE8ExcbTlmA for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jan 2026 13:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=edumazet@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA26B403CD
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA26B403CD
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xcFowKWk
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BA26B403CD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 13:26:48 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50150bc7731so72089371cf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 05:26:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769434007; cv=none;
        d=google.com; s=arc-20240605;
        b=gWn03WdffqY2/zW/iESYJHFVz/JIqiFq9Q9hqgGa1yv30kMofNIsWM3xyKhFb/95Qs
         oCYcVjfSy5z4c3zSjX00M3Zb9S+IqA3MvJiA2awAKxqhcCvf/5PlXXJ31ltAUKRPW9RO
         TDtAhtXSUFDtSqlgTQjR4uGIBOxbSCLRKEnIwvhKJY8X2sBaMiI0G7793Urpp1ndhP79
         /wnaMvNVh+67OpVyfPPYC5yaaOU86blYnm5llAUvfN2zliFN3Oo6cnx085OyTNFFL+Yn
         W2XSpJHldcStCvyczoG9JTIXWpXrqjnxxPKPlf0Nq+r14kQ88ZhdXDpf6mSZQm7G4Ci1
         IkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GwQrtPKSS8MhTcYPEdEzMX0OJ91zHhN3YjN3JV6Yq6g=;
        fh=+HvCVpfXR9/lB8WCtchNfDW5wBYFxnkqf3+iI2hRHBM=;
        b=G03TFTU6Pm6GJXCgTR2yplWeTc/Y6FFak7a7DKJOqfuOnQl9ErCMMUbcqNBo4USvlC
         +K9ubqqp9ZRAnOpzlcj9HRoz4nhUwACFyPplOpa1aGsbRU7079aI6DyYAFJSdyfaijgu
         OMWXcSz+6Rz7aAQZX20dI7TGLQcmKnTD3EHfawdx/uEvgKWjcgQgH7jp48SYpzFfbftX
         ksy6SttpuAviOqSmpBt1s8p3oNKTNjBsP00x5Ry49f4Pw5v9fS/+xSM8RCpdftXX7Wty
         btyfOSOi6fGCcmglN5f8mmyyE2WqunMfI2AIfxH6b7iN+pvitHLlOnRyhwQAc0S+q/ck
         aBiw==;
        darn=lists.linuxfoundation.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769434007; x=1770038807; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwQrtPKSS8MhTcYPEdEzMX0OJ91zHhN3YjN3JV6Yq6g=;
        b=xcFowKWkTkgkI717q3yYTeXH9VsadSm2Vh7f8VuXVOx145AIMAX8HwFy89wrjmQKqr
         7nRfIG9DoL8cjc5lVk4jZpXnwZe6lAw/o2DTsD/y+npVpdAEw9fCdwV0aaaTaAXhpt38
         Q7bi9TyKIvc0tclxKNs0EDeEUimP8Iqr4FYnJeS8hn0aGOh01cmS/LdEXVFPKPOf4azm
         fUt6BCDgjed4H0ljO8Vpvbuiob/eg6GQ3ZyvmSJa5bdb69Q0N/y5PLpHU8fO5YGc+exc
         Wt9rnAT6fITHYpvfVCv7spdAjmE3rIq6bvLjYKChDKIaq6cewkechFW7OjtK87MU06w3
         ksmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769434007; x=1770038807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GwQrtPKSS8MhTcYPEdEzMX0OJ91zHhN3YjN3JV6Yq6g=;
        b=NhZCuY1EjKSz0zM2IhLgbLQypO7SoVMkDCf2J43KqJkWc6+MiEaIYzQKz7mpsUlkCT
         Eo/e9Vc96vFH1JHZZ6KO6awVMKOAimSUGOMVbMO+rGrTyFC+fpyTvIKWavvtAfwPL5HC
         5J55tDyJLg2UmZNZ7Ln+UgVt2Y4GbYh+ux1tSMDrVSv+ZPfhkzyYb4As+cFm+vYIt1+Y
         6Jnzc2MWlFLDdDqtnkfHNa0keb4xBQXFrlMpt/gnL9cJDX7X9LtMoaH+PLFE1fBfVOH/
         fyo1mhnr8vXPrEhllVMcRV22AN8SMOWRmahz3RuoTem1U/bbYnmR/dH3sGtMcAq0gRxR
         e1TA==
X-Gm-Message-State: AOJu0YzQqia5lUxkBYjLWbmdbBXWP8WF/DGmp0KKCZK4qS3P52aMJMT9
	ZhXjHIyaUNUGA4ih6i1dCenZY8b96xdorNCOVy04C7mXAekQG8KdQE4k6+gnkM6M7yb+XnUBegC
	TsCIpm6FhyO6AkQtbvZZzvkFH99PPrqFo5Wwgf59n
X-Gm-Gg: AZuq6aLLLLHl/le8+2u6PTVS4y4l7KGEjbH4j+aNKBHyJhSBjPJIAW+s0zVKIKBM32+
	u0L0fWUk19LBBG3+K6k2bB+7K3CKGBts0E83B8+bSpO3tOYTDQ/v8n2/jwfRcrlSB/BuiaQGoeP
	Zzk4iAFpTmDDLxCT7t/A5UKqbZ/wlVIGxgYLha4eJHZQtUFzevKljUqAWlNsClEDPjQORotVXnB
	XwWeE48nZC8JMUfK5JGzoRXLwmR+RzMYPYU8INeGeZ5K963sNXc7sp2/gigTKQeL0rmFpJLDyfx
	hama
X-Received: by 2002:a05:622a:345:b0:4f4:d298:b47c with SMTP id
 d75a77b69052e-50314bde895mr44108571cf.28.1769434006965; Mon, 26 Jan 2026
 05:26:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6954bc70.050a0220.a1b6.0310.GAE@google.com> <20260126114332.23955-1-sohammetha01@gmail.com>
In-Reply-To: <20260126114332.23955-1-sohammetha01@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 26 Jan 2026 14:26:35 +0100
X-Gm-Features: AZwV_QhmxFYxmShT5gsyJQWDXcDKCuEtSOICrxjGxqht-VPWWCf8urrICQPg7c4
Message-ID: <CANn89i+txkMjnxtaXtFJucNCLehhOdCw=5KBGpxCMj2v2erLNQ@mail.gmail.com>
Subject: Re: [PATCH v2] net: skbuff: fix uninitialized memory use in pskb_expand_head()
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com, andrii@kernel.org, ast@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	haoluo@google.com, john.fastabend@gmail.com, jolsa@kernel.org, 
	kpsingh@kernel.org, martin.lau@linux.dev, sdf@fomichev.me, song@kernel.org, 
	yonghong.song@linux.dev, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jason Xing <kernelxing@tencent.com>, Kuniyuki Iwashima <kuniyu@google.com>, Michal Luczaj <mhal@rbox.co>, 
	Mina Almasry <almasrymina@google.com>, Eric Biggers <ebiggers@google.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 2:22=E2=80=AFPM Soham Metha <sohammetha01@gmail.com=
> wrote:
>
> pskb_expand_head() allocates a new skb data buffer using
> kmalloc_reserve(), which does not initialize memory. skb helpers may
> later copy or move padding bytes from the buffer.
>
> Initialize the newly allocated skb buffer to avoid propagating
> uninitialized memory.
>
> Reported-by: syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D619b9ef527f510a57cfc
> Tested-by: syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
>
> v2:
> - No code changes
> - Resent to netdev list
> - Added Closes tag
> - Added Tested-by tag
>
>  net/core/skbuff.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index a56133902c0d..b0f0d3a0310b 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -2282,6 +2282,9 @@ int pskb_expand_head(struct sk_buff *skb, int nhead=
, int ntail,
>         data =3D kmalloc_reserve(&size, gfp_mask, NUMA_NO_NODE, NULL);
>         if (!data)
>                 goto nodata;
> +
> +       memset(data, 0, size);
> +
>


Certainly not.

You might wonder why we have GFP_ZERO ?

Answer : we do not generally want to pay the price of zeroing memory
_unless_ absolutely needed.

Fix the caller instead, ie root-cause the issue, thank you
