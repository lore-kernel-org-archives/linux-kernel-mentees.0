Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9951E5B71
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 18:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753294651; cv=none; b=TCvHLf5dtlJLowaQI8ZGoMB7nk5QtNmwrzTHnXp7qyIDklU5mHMHATejeUDnzbBI3N5evaX5lfG6kvpZzps6gzN++54NC2tF9oTb8l6Qdlw7NLB5Y23G8RZej1LJZlgyD7EHLKDjulV4keHpWZ/seEwKnoohcgil3wP8DqDGg7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753294651; c=relaxed/simple;
	bh=Mxapj/W6ghkGZsbzY4w3vXEDzVHjWtirUwe3EqUITS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIO6wvdzfQHp/V31ZO71v+OKZBXoORXMFTJrf4BslEP1ySZ1RFiQZ2PkwkH6YrwAWsGlyhEr3/W/u6rWNKrzJyQ3woNZnJeaQbxg/xiF4brCgAVosrclXnTDdP6KJwXffmhV0rI10VpM+ysoy8VZTC4tEsz0I+zl1TwMVEdk1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyQSC6q9; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyQSC6q9"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-60d666804ebso562414eaf.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 11:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753294640; x=1753899440; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RisToY55DvY0MLXrsGRlCU6n7jXckJ5IoAhRIn7EY5A=;
        b=ZyQSC6q9xVrrf0bXYIuOGfhlBfaMov+WvYkghcMDW20jRtPTDYIPlPNtgrw48M+VLz
         4j4bLpTAuqZomJQK7NZaYQuKmAUJRmB2T4Sf97VexC+mQYlHf2ugKPPjuWeiVhE+w/8C
         ak0/p/9KUJzqNqoyBHmx9yOEdwHAkAkJKiJSQ87Q2I+va7hLwQ7uPhK0gKrfUicKqAUR
         TyPQ/sMgrloGdVEpoliMI5MIYL1Zpoa59B9TQNi8McMO7k4pBWXzE/qho2eXlf2Q5jS0
         V6ho9AgY30guIdg4q6rlWCp/+RyroEdji6HvoCvPoF5468QwYK60qZ5LU86zwSlUNaxu
         IKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753294640; x=1753899440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RisToY55DvY0MLXrsGRlCU6n7jXckJ5IoAhRIn7EY5A=;
        b=hM3GJfGZRUxNyqJiPpJH1T/NEXb2P9a1bUYTOphtaoxNQMj7aVZzm43vmXkt6omXrj
         XemuDmnJmERIU2yVNZMIb5x86GaKAb9pIEvLDS+3MIRWgfiAeBbbkWxHS4PpGreaDQhh
         yDj+/6tzM2+6PS8bxD/dktmA7DPZP1OxSiqj9+NhX2i1YBkB/gGa7709H8BUWUdxHsi4
         ngwBIOBtgnEO2eSYNHPOi2sz8G5XCS+ZHJsUnM6HTVc/t+Q8KD6lDNmsmoEkIicOYpgT
         f9NsxVJehP+MgEFlbFAl+RkryJurdAPa+YrczP5ZzxVHYL+678B5dgVW0p7pzuEiS8Mp
         qZyw==
X-Forwarded-Encrypted: i=1; AJvYcCXaEnbMhp4DaQyi9+/y+oQ0Sv9xsF/fG+oq91guGU66AQatXg8I6zYETjm1Z4HS0hZKPQBvxLuZ1M7LQcMIxH20fRl54g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxBFUCdjSnX3J7zM+U2CTp+OXY0H/ZYZRwd5TBuu1N+s3nxbPP
	+1N2JBDqo5aEVmuBCXRCPEQhB/p+NwU9W4OEGo69PhDbolLMUTipMuibdgzNycm5CGZs8xS4fHL
	2EndYWduu4R6XypA501Kd0YDnvyVv9HO2cj0D8Qkj+gBJ
X-Gm-Gg: ASbGncsBrShPBwJbV4Xaq93YoJHTpP+qodiGmIYeJPTLAm4gbfnM/aNFr/wsiyQ3C+C
	iaEuUegh/qH63LEmO+l5KheJAQBEhgatx1fGElTgafj2zVHAKnO+3YKJidQ+m6Evo2msXGq84pT
	S7wdEZPKzgax0Rx+w30P1OGPa4/G2G3ZZEC/VZ4LRfDPYXONCz4sQeSFWCcwpkkel/a1OECi1v+
	rEnhIT+
X-Google-Smtp-Source: AGHT+IH0b5gniHC2oV6Q2cydxzDkfKC9O8de+o7IucN+Mu/rb3bzyZeGVWY4j+4HT2s4MTG/OFFbhDXhysYI9OzTKZs=
X-Received: by 2002:a05:6871:4681:b0:2ef:ad56:aaba with SMTP id
 586e51a60fabf-306a79e6abamr5612128fac.3.1753294640104; Wed, 23 Jul 2025
 11:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com> <CANn89iJgG3yRQv+a04wzUtgqorSOM3DOFvGV2mgFV8QTVFjYxg@mail.gmail.com>
In-Reply-To: <CANn89iJgG3yRQv+a04wzUtgqorSOM3DOFvGV2mgFV8QTVFjYxg@mail.gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Wed, 23 Jul 2025 23:47:09 +0530
X-Gm-Features: Ac12FXwzJdHhCWw-QUoBRjGVUQrpiSZCrI9ATw4JQ1XXd6D6Ht2zQKkMXPXNQEM
Message-ID: <CAO9wTFiGCrAOkZSPr1N6W_8yacyUUcZanvXdQ-FQaphpnWe5DA@mail.gmail.com>
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
To: Eric Dumazet <edumazet@google.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, sdf@fomichev.me, 
	kuniyu@google.com, aleksander.lobakin@intel.com, netdev@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> WRITE_ONCE() is missing.
>
> > +               while (i >= 0) {
> > +                       qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
>
> What happens if one of these calls fails ?
>
> I think a fix will be more complicated...

Hi Eric,
Given that pfifo_fast_change_tx_queue_len is currently the only
implementation of change_tx_queue_len, would it be reasonable to
handle partial failures solely within pfifo_fast_change_tx_queue_len
(which in turn leads to skb_array_resize_multiple_bh)? In other words,
is it sufficient to modify only the underlying low level
implementation of pfifo_fast_change_tx_queue_len for partial failures,
given that it's the sole implementation of change_tx_queue_len?
