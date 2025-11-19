Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15538274B35
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 03:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763524693; cv=none; b=dgPr0sAa4t2DW6Lr34xMnZe84mP3i1s9Gh+lpBU1khLNpRr74hIfIPE963XAE48by8QBQv5KFKkjlYoSF0RT2TGJnRrDNZGVU7O87t3xqRPwNshxX7kh0xCXf2pV9wA7LNgCsFrojM/fBHWsVcuPP22VmF3vsJiGi7D4b9awqcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763524693; c=relaxed/simple;
	bh=PI3QKLL1UFflRMFBd9gNh7xeqS0cnp6FXnZ/gxAlTuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaalwbjBuihUmBgWI3L9+u1gA+eo78Xb1y4PyW7kw1jAA/V2SOZXi1a/0OWQXYjeXj8cRyko7X2s8aqDLtVWu/RNpvQ+H1V3M0mtAUrYIRpZnFpdnbjyosHLctWnN0Opd+HKOUxm5kNVNR4atouixn4/bB2ZMtV1PxLqA80jkXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T34KPg0+; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T34KPg0+"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso10040707a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 19:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763524690; x=1764129490; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PI3QKLL1UFflRMFBd9gNh7xeqS0cnp6FXnZ/gxAlTuI=;
        b=T34KPg0+GIzaVCziWQe60tiWQWcs1VwuLWHJBSaMpUmKOdCCvqVK9ZPclwMeUTlfCt
         T4uH1LXneGUq/09hg4eWQyvW0lOHBCF8Zp92QIQExvKJgMl2STrUumt4KxEYPqJ7Tacr
         qpAiAV+3yhHcOoFpunOttugs+NJCdGZsX5hqvk/+El8YsArs0R97k+YV/ploLfpGvXVh
         jbsD8+/0VcKNGa3G/Oz2pqPhFtOadKfpEAxKaEUgyntZXBrjgXIKDr4L/8DqMHCWc1kp
         va6wifw0+rFDYEHkpV+ZHPERIGMoGVIpS11zzRFr+1Fzs9+QGvlR/80W3Ev7riCAZzCS
         aX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763524690; x=1764129490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PI3QKLL1UFflRMFBd9gNh7xeqS0cnp6FXnZ/gxAlTuI=;
        b=iOXuNgUStZk4yF1a5bF3LovH4iLgoIbHTw98trs+QGOuWPfwzRKHrmFQckws8YYv9G
         WYz2NOPAZfh8zE4gEjsSvZePhZ+Bxy8Zqc2uc1MQG25Tu9cNxrM17novQVYnxUZ5c8TQ
         01j7oSh9SLdl8ggl5U2sniQ/lO3Zi8UgavpCsGuqYvp13uRFf48xUwnFpXfw4penKjwe
         vbpqaExM2PT3HNbYX54fJqxs6sYtZuZRt5yNa2eE5Pyw/8TYDxVlclOOBo3ubAUQQA+0
         JE6Qn5hnLpKrXD4aFG0WYuUaQw1jvYaLuAKXm9ZwxnyGFavWgQWhkAgs6W8fYv4R6Ium
         dpVA==
X-Forwarded-Encrypted: i=1; AJvYcCWJMj/gmfrKsvz1su11zkyxF04jQ6zUtZk+AV0ESaIhxIpZCq4GZbRpG4sNEOxN6R5CA4y5Kl4QSEKHcdJ/NbICOpcVmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKjGIA21GJ/i25lSxZ7n1AbSrS0lQyDnxTZroHqOrMvE5bWely
	AY6cIWBReg1l1VFvFkpgLeG6X8Oc/9uW/B6ScDoKeXu3wHgL3SG1mMA2/uZ87OH2k/axF0PLahp
	NNX3iX2agKTAWceG83+0CtcxE/vdB5ss=
X-Gm-Gg: ASbGncv8xcgiYTLEFsLdC2NJG2pX65v+EAmPpSEnpI2jrAUS+M7plcbsRpCY9IQ4O5R
	SeiMC+pzUt9ZzMTP6nsDf0yFixRXpz29B9VYLcP/Idygp13kn4nO816CQI4rYIQkYx3c0affeag
	4vm4caJaETbZZ0/v1MWnZ6pv4iCJJ9VkfeXl09N2wyIVvN0l5sepHdoYnxRsg/ZxZvbErU7WUQv
	mhhw/PyZqYdpv6chFU9ONUqMbPQ31kSp4hxzwH4hTQrkbzVaVbxInESL1C3q7HAmAMI+AIbQWOS
	B45N1g==
X-Google-Smtp-Source: AGHT+IG3PwSV/TBqcgYiQTrXM8pDMO5dg/Jf6yZQNxRWinFCJb2bV92dB5BAFrlKAhEykr/231k5fj1ur5+oNuf4Gz4=
X-Received: by 2002:a05:6402:52d5:b0:643:c8b:8d30 with SMTP id
 4fb4d7f45d1cf-64350eac57bmr15010389a12.30.1763524690169; Tue, 18 Nov 2025
 19:58:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118164333.24842-1-viswanathiyyappan@gmail.com>
 <CAPrAcgNSqdo_d2WWG25YBDjFzsE6RR63CBLs9aMwXd8DGiKRew@mail.gmail.com> <20251118105047.20788ed9@kernel.org>
In-Reply-To: <20251118105047.20788ed9@kernel.org>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Wed, 19 Nov 2025 09:27:58 +0530
X-Gm-Features: AWmQ_blCdRe1tCw5lI8xL4ehntzBrd_SGHl4OQqj-ctDdgKE4rWDvz00iLoDe1Q
Message-ID: <CAPrAcgOBa5Q3k5r=G4qixzWRuvK+PEinj9sGVf-nxWYon4BkpA@mail.gmail.com>
Subject: Re: [RFT net-next v4 0/2] net: Split ndo_set_rx_mode into snapshot
 and deferred write
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, mst@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com, sdf@fomichev.me, 
	kuniyu@google.com, skhawaja@google.com, aleksander.lobakin@intel.com, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 00:20, Jakub Kicinski <kuba@kernel.org> wrote:
>
> Broken as in patch titles or broken as in it crashes the kernel?
> Both are true.
Yeah, I will fix both

> Just to be safe "as soon as possible" hopefully
> takes into account our "no reposts within 24h" rule.
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
Yes, It does

> Also I'm not sure what you mean by RFT, doubt anyone will test this
> for you, and you're modifying virtio which you should be able to test
> yourself.. RFC or PATCH is the choice.

Just to be clear, would testing packet flow with all the possible mode
combinations
under heavy traffic be sufficient and exhaustive? I think this should
be PATCH once
I sort everything out
