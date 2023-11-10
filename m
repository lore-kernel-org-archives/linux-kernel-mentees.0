Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1C71DDFA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 19:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WnNB2q1+"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 160D98352B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 19:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 160D98352B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WnNB2q1+
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -9.6
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CrgAfpD3qrii
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 10 Nov 2023 19:20:39 +0000 (UTC)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 46FB583903
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 19:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46FB583903
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6b496e1e53bso2478534b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 11:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699644038; x=1700248838; darn=lists.linuxfoundation.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmDqdAWs76Z38wbCXMVzmK7UmSAVaiZdksg9Nozpdp8=;
        b=WnNB2q1+9TFAhdfPhF4S90oh+LzNhtv0mfo+Ijvd54ViNtPC4KI71sBjp9LQIPfEF9
         2z1fX3LJs3MUkHXcRBy+uPb3V3ZwkNUJS3w2sCPcAoJXrx6i34WHeer50rFOOHKQAtIu
         TF30krX0NNV9l5IpJE2ErEjPAhyES21hG8GHkFjbsdAxnJcF0Csyok1nJEcYmbsgqw47
         CbETRPr8TGASgfqoYwn7Ll+8hbFxvziMb2NARsu9NNkjWz1ZGEm5Yc5ZuzS0Ms1T1SY7
         vh8IdZxs1CGbSNeXTtLM7KOogKot5AF30lIYN5kr3wRXj7W2KTeFuf57Te27dI8zI6hd
         BqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699644038; x=1700248838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmDqdAWs76Z38wbCXMVzmK7UmSAVaiZdksg9Nozpdp8=;
        b=fkc1vNxbyvUGkJjb6493Mfi2AAn73ABlUAp8MIf29pbJkM4deEdF4jJyIj2Va+OnDy
         H4mjR0CKMyLsiuW3drlj5yPvpsh1/FU3NVIpEdeqPbvQNsKGlzWcAR3HwcPwWqWB9HYq
         1bC7X5+EMo4zmAip3VnM/bM8fqTY6YiAUMuWy4ihS7IRUz6HgrrYaJHou1w92sWUtVty
         yq6ntza1kPmkKGyUxH+BjdTuPgR2eRSZOCSRzLiSAoQh1nI0Xe3tqSmpIlWRMYzNvTct
         gB/ZjkJMwDN3K3htUK1Ufw2AA++W9CkxjxE9c4jhd+6pKh51886U6iv++g9pjnVcDBGx
         x0NA==
X-Gm-Message-State: AOJu0Yz19ZCPw9f3oJAA8BMbe3dicfMC3/fM+pMeZDTSc6KKJ10YZEUi
	uA/6QchtdoTyUP/wz2GnaVkT4/g=
X-Google-Smtp-Source: AGHT+IGjQZYceFZlkLGm/EfIF1Vis4zESpzioSQUieFa3Kg8E3dOt0VspAX2UHxfpbxz1G8loZjCJa0=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a05:6a00:3212:b0:68f:cb69:8e76 with SMTP id
 bm18-20020a056a00321200b0068fcb698e76mr1374197pfb.2.1699644038285; Fri, 10
 Nov 2023 11:20:38 -0800 (PST)
Date: Fri, 10 Nov 2023 11:20:36 -0800
In-Reply-To: <20231110111223.692adbd7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231110084425.2123-1-kdipendra88@gmail.com> <20231110111823.2775-1-kdipendra88@gmail.com>
 <20231110111223.692adbd7@kernel.org>
Message-ID: <ZU6ChFruBvEnA0V0@google.com>
Subject: Re: [PATCH v2] Fixes the null pointer deferences in nsim_bpf
From: Stanislav Fomichev <sdf@google.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Dipendra Khadka <kdipendra88@gmail.com>, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+44c2416196b7c607f226@syzkaller.appspotmail.com, 
	Stanislav Fomichev <sdf@fomichev.me>
Content-Type: text/plain; charset="utf-8"

On 11/10, Jakub Kicinski wrote:
> On Fri, 10 Nov 2023 11:18:23 +0000 Dipendra Khadka wrote:
> > Syzkaller found a null pointer dereference in nsim_bpf
> > originating from the lack of a null check for state.
> > 
> > This patch fixes the issue by adding a check for state
> > in two functions nsim_prog_set_loaded() and nsim_setup_prog_hw_checks()
> > 
> > Reported-by: syzbot+44c2416196b7c607f226@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com./bug?extid=44c2416196b7c607f226
> > Fixes: 31d3ad832948 ("netdevsim: add bpf offload support")
> 
> Don't think so. It's probably due to Stan's extensions / reuse of 
> the offload infra.
> 
> Please put more effort into figuring out when and why this started
> happening. Describe your findings in the commit message.
> 
> Current patch looks too much like a bandaid.
> 
> Before you repost read:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html

I agree, I have a similar suspicion for the same report on the bpf list [0].

0: https://lore.kernel.org/bpf/ZU13dQb2z66CJlYi@google.com/
