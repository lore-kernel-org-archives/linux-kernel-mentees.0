Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C152D838E
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758706625; cv=none; b=U/1AKfF/ZV1eNjVuOQMCjfcd2IznKXJ2WUThx+vMJhfF5tUJ9Eq/sto3KadAHyX+GM9ln4fktC0XMOdccVx/kmR0tbEvAf2GwIbXsASnu0iiOFbEZHEjeMPppaaFLc+KjKnEgMeIWVg+kD+mOBkxFAheuEtW55PHzC1uU5gzxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758706625; c=relaxed/simple;
	bh=tHDZPTjqsvGSVtD2vzi+B0EfyL6Wl8yhlQVaMzP6+5o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fG+Otcd/1i6D1i1dscchO3Dl3EFJXR0EpXz+4mEHPIGdvQug7LUc68tkNrwHZeavNJglf9yU4PDMgfNfwacaWBbU9evPxQv+YTOS29pdvteO9svypQVGrd/d64B2Q/MXlF3uYL3d/KslJV2RrteAF8tHf7VSqSJN7Pzzzr/zSss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvBY+ko5; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvBY+ko5"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-36a53fe7ebdso29982291fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 02:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758706619; x=1759311419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfQjDW9lOZhqCcu0UR8GmRDS7/f9HDxq+dUiuWeXOX8=;
        b=lvBY+ko5lKpW6TcRlcPpaKMjJ8Tjw3Xu+WTK1oTjlgl3DvxjTq7/6Jl4t6Qe42wCdO
         N1fVxUJcVadHhDQqUE3KrfXPJv8OAM6OKlAD3QDCgck69sruNHH01wRlCmfkfqJ2YTVd
         W7zT98Be8F0I7El1rOXT00Diez23U7Z+R+jW1xj06/3twiB8OyE0SwI5SJ/6sc2OiY0s
         ZnTriRBtrDV4uO3nKzFVeJNt1iCsIHS7wts1xbNF80bUBY2thxv1BL4QrgaoRvjGSuxT
         +uLjO40TQ59eyCwJgWXXbgtVH3P103ar5P2FOueyffVgu37Imt7NFrs9hA8n4hlV6Bax
         XgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758706619; x=1759311419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfQjDW9lOZhqCcu0UR8GmRDS7/f9HDxq+dUiuWeXOX8=;
        b=Za9n844d8I8/xtDbbwthDDUghX/Lrr4si3XSoI6i2GAs+KJQR11V60MZVkwoxs25Pn
         TZEFJBx48ILPnws+wMC/svMrXmk2QXCx3ZvigN6sBy3IZXeaTyPVcG3+7yyei58ckr/r
         2X6fVckoiriu/eSL+0PHHGRKv9ZM63FGbF0mD5sKv2E25wZiMnB0hnO50HvUHlHgr1Em
         10ioqm7t27x4R3mNoRI+Z20Gz4FpUj0aSV1XIXWjq6op5GNuNu/WcntXofVA0DxtEYe+
         CwZQaxtje1UFS0Y+4Ck7bY8pRBZKrOgRRVfh7dDqT+SlH1F+/YI0i7asjtQc4Av6+9Bm
         yZOg==
X-Forwarded-Encrypted: i=1; AJvYcCWgJstHKQqFd7GytHVamUwclsfy+cDRjahvUkf5gvJ5960I6HXlP6XrDLjYPcYMAHf3+iE3jSjvQkCUmA8J44mFkZ0bQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ9FzoWONWYqWWUlgA+A9CrrAzOV1QENCAcT+R7srhxCGHo8UO
	duJg965pmKfOJYHa6oaiZpjgTr5l7pVW4KXRFTWO/fIXCwxiY09i3IPO
X-Gm-Gg: ASbGnctKci5RFBgTVNENnIbbtnjiRZJmyuK0PpTTJBtyWs+8r/vTvIRWGJr/IXObbX9
	qMPIp12wxAQtcsezzbwBFn2TmUihld5DXCfRpcof9YWlWKcQ3q9wUHaE8VkLuz2PK7XK4SP+g/B
	P7fzd3nqGoXr6EQv94TwBJOZQoGoDm9jP6HOJqLZFOeuxGwJJzv1LqfK2LpL/XL76KhbGNja5fR
	/TS8sfW9NOxbe/ic6HgkJQdBgY1hCrNa443j1XSDa5A10KIrcHgXH1BI7/3HweSMlTN5ONyvXGF
	HpzvrSgHOXvwNsjq9ssbZCn1w6HNSeTdH0tyy75HHYUNdAjc4ROR5AwQD7Mgbq0y412DAVQM2Fb
	G6Hg8Kj+8+a/YOwM+jrLNxx1k+mCvf5NbA5Q=
X-Google-Smtp-Source: AGHT+IGAXIFBfltfcFUi2JvMXFLpdNu20IBm9lusClOWXvJ5IvB5Xvu2p2lzfwLhA2Gs0+4M6+OmAw==
X-Received: by 2002:a2e:b8d2:0:b0:36a:f4d3:82e9 with SMTP id 38308e7fff4ca-36d14ebb0b5mr14965271fa.6.1758706618408;
        Wed, 24 Sep 2025 02:36:58 -0700 (PDT)
Received: from foxbook (bfe191.neoplus.adsl.tpnet.pl. [83.28.42.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a26cbbd6sm43990051fa.23.2025.09.24.02.36.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 24 Sep 2025 02:36:58 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:36:53 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: viswanath <viswanathiyyappan@gmail.com>
Cc: andrew@lunn.ch, andrew+netdev@lunn.ch, davem@davemloft.net,
 david.hunter.linux@gmail.com, edumazet@google.com, kuba@kernel.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 petkan@nucleusys.com, skhan@linuxfoundation.org,
 syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] net: usb: Remove disruptive netif_wake_queue in
 rtl8150_set_multicast
Message-ID: <20250924113653.5dad5e50.michal.pecio@gmail.com>
In-Reply-To: <CAPrAcgMrowvfGeOqdWAo4uCZBdUztFY-WEmpwLyp-QthgYYx7A@mail.gmail.com>
References: <83171a57-cb40-4c97-b736-0e62930b9e5c@lunn.ch>
	<20250920181852.18164-1-viswanathiyyappan@gmail.com>
	<20250924094741.65e12028.michal.pecio@gmail.com>
	<CAPrAcgMrowvfGeOqdWAo4uCZBdUztFY-WEmpwLyp-QthgYYx7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Sep 2025 13:32:52 +0530, viswanath wrote:
> On Wed, 24 Sept 2025 at 13:17, Michal Pecio <michal.pecio@gmail.com> wrote:
> >
> > It's not freeing which matters but URB completion in the USB subsystem.  
> 
> Does URB completion include both successful and failed completions? I
> decided to go with "free urb" because I wasn't sure of that.

I think yes, usually in USB-speak "completion" is when the URB is
finished for any reason, including error or unlink/cancellation.
"Free" could suggest usb_free_urb().

But I see your point. Maybe "finish execution" is less ambiguous?

> I wasn't sure how to describe the flow of execution in a multi threaded program.
> I will resubmit a v3 with this version of the execution flow

I think it's an irrelevant detail which CPU executed which function.
It could all happen sequentially on a single core and it's still the
same bug.

In fact, I just reproduced it with all CPUs offlined except one.
