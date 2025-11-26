Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584C3019CD
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147849; cv=none; b=F11+YicYO7zmBVlQdOpXFlXzG7huRAgZ+7ilf3MouPEVW1D4dxWZznIau44oTcIdhtzXZfD5ig2BPdbr6tCMi8mQqnlL3iQeEoMbLM6YL0n9hSI6NjSdgAp6p1spkZm6UdxhJLzgQRHjEOkSacTRtBMgwkKQ3j/lPPYC7/ntMqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147849; c=relaxed/simple;
	bh=msA1Bmidu73lv6UgIPfMu/uKxgKN3WMlHd0YJZqFXso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgfApB4iQCayUWoBqVnFvzskYTrKH3a2FmNSiQG2nEhQFhjGP35MkYsaIcDj4o0l3/1q023YfPk+XDZP6vpRPw1rlmEbMnbOYkYoIDvCC5ul9BagPP2CDMbWgLujxp+dFKzDxeV3vdAD/8+rLfR/ynNo7pbq5XtQ4klosZHtbd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BCuldOI5; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BCuldOI5"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee4c64190cso49087761cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764147842; x=1764752642; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyRh8xXL0L8kVbM1qWyCLwjKZ6UbKVPw2m1+P8OYNlQ=;
        b=BCuldOI5HT5buiIBaiYmxSVAgOxmwAbDUsCcjEcN6ZjV1Dh4C4DEclFSZWg1Iij2Y+
         3qpsk81jifrqXw2T658YacTPVF5itisjjTqqoUdEncvjmQtONNo8/xgzyFvUKnD68KDo
         Z9AGikzwAceYyxCO/VS+J3RTY/WMLNm72gV6yXItSjnMMh/zrxe8tIUgzHFfOnXAIDlh
         EW1tqR8h94yMvgQbzFBgJsr9fPX6F5f04Ki76I32T1GQ7/IjoZiKPnWwQMp7U8itpyHt
         H2buK783xk0tlfpI6ptn41VO6qWUtUl+flHhXacbV4goBc9lNkmUkVhKIKiKwwoN4LZa
         DhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147842; x=1764752642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hyRh8xXL0L8kVbM1qWyCLwjKZ6UbKVPw2m1+P8OYNlQ=;
        b=LGXi5wyYobMbEFtBBZR2FtELECyI/VNztbpDNjM9X/XpK+9mnWLSoBB6E4r/OQVwFj
         mOTiaDxHKOTAyhRXVoqD6CzX2dJ0vwu8Os5nR9fVzw3/q8PeKpO4wzLq+GYuLnKdR7n6
         oo3Mva884PAlMe81wFbU1V1a+QnOcuxQ5BKDQWhUHZyVCTCAYdsOcI9JAvLUa9XxVZEG
         SlNWpluUFT1qjCj4JC1Ab318PBNxMFK5Ofjzce8fstsu+D4c6nuSpFqdgFsUzZUDr3Ln
         1xXR07YUXXNTpaTTska9aw/KyNg2PbU8GJ1Zatl2jShFbgN7GhIXVWI9YwsSNcJcd1si
         F5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdhozeUWOStsuWZmxVFDyaLuDA67jhqaVtWxgxMhkSvg5NaqIujwZVOitwfeZswLdlJTbCQJlF4EG6R4nteLBh9ZchDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFfvzf2Isly1wkTDDVlFdy1B3MeFChVsbGZCosy1C05Aly8SX9
	nNEatg8g7RZ7sosaBbzCzCt6A4HWEcNw7PQ3HeQSXzAJaJFfwE4dksWBsAWE5p/MLsHMXzJlZMf
	zfJ/rFdK0cGnp08COC1TMY/1FTKGuc2Syt6kqN5lE
X-Gm-Gg: ASbGncvGqqe/eG6ze1W5BGoWpr00Hzi18SM8KmQsRU6/9TWeZrhxgJGRTzfUmCU0iDW
	CbjuMI/Rn/s+mY3YJSp0YrhD6IjtLlyd46kwoiHBnnUPVEOXy479PfW212lDxVhLfX4vCrGAZrv
	hbb6/TieWVBKzfI3w+/ejKRJK7RaN/FAbXX3Z/D4lgPP3KDJy8P5YxRQWCRPTEgpNeuKvN0gE3h
	/v+VdpWCeBUUwl6t0NppPV8PLQwtJpbZ81bG8ZPf4LUKGfVULI/kcXgxQhKKLnarkCReA==
X-Google-Smtp-Source: AGHT+IEPVELKVM1cwUwrfGMntJ3piYPimKdkJDSl5UF5isYNXZBNp4wQ/L7Ai4Aqn4fzrw9sl0QMSXAAIJOZ5vJ9tYw=
X-Received: by 2002:ac8:58d4:0:b0:4ee:1db1:a61b with SMTP id
 d75a77b69052e-4ee58b04acbmr253389301cf.75.1764147841940; Wed, 26 Nov 2025
 01:04:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126085718.50808-1-ssranevjti@gmail.com>
In-Reply-To: <20251126085718.50808-1-ssranevjti@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 26 Nov 2025 01:03:50 -0800
X-Gm-Features: AWmQ_bmE9KDgoqH9fUKEjaUj9BjCwLFusadkTUuVGXRtTtcEL0ewy5b2wK6n-kg
Message-ID: <CANn89iKRYHaYS_wC0CzxsFD6pCHv126xKDbVgozBKvZyK-j7Yw@mail.gmail.com>
Subject: Re: [PATCH v3] net/sched: em_canid: fix uninit-value in em_canid_match
To: ssrane_b23@ee.vjti.ac.in
Cc: Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Rostislav Lisovy <lisovy@gmail.com>, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com, 
	khalid@kernel.org, syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 12:57=E2=80=AFAM <ssrane_b23@ee.vjti.ac.in> wrote:
>
> From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
>
> Use pskb_may_pull() to ensure a complete CAN frame is present in the
> linear data buffer before reading the CAN ID. A simple skb->len check
> is insufficient because it only verifies the total data length but does
> not guarantee the data is present in skb->data (it could be in
> fragments).
>
> pskb_may_pull() both validates the length and pulls fragmented data
> into the linear buffer if necessary, making it safe to directly
> access skb->data.
>
> Reported-by: syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D5d8269a1e099279152bc
> Fixes: f057bbb6f9ed ("net: em_canid: Ematch rule to match CAN frames acco=
rding to their identifiers")
> Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
> ---
> v3: Use CAN_MTU to validate a complete CAN frame is present
> v2: Use pskb_may_pull() instead of skb->len check to properly
>     handle fragmented skbs
> ---
>  net/sched/em_canid.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/sched/em_canid.c b/net/sched/em_canid.c
> index 5337bc462755..2d27f91d8441 100644
> --- a/net/sched/em_canid.c
> +++ b/net/sched/em_canid.c
> @@ -99,6 +99,9 @@ static int em_canid_match(struct sk_buff *skb, struct t=
cf_ematch *m,
>         int i;
>         const struct can_filter *lp;
>
> +       if (!pskb_may_pull(skb, CAN_MTU))
> +               return 0;
> +
>         can_id =3D em_canid_get_id(skb);
>
>         if (can_id & CAN_EFF_FLAG) {

For your next netdev patches, please read
Documentation/process/maintainer-netdev.rst

Resending after review
~~~~~~~~~~~~~~~~~~~~~~

Allow at least 24 hours to pass between postings. This will ensure reviewer=
s
from all geographical locations have a chance to chime in. Do not wait
too long (weeks) between postings either as it will make it harder for revi=
ewers
to recall all the context.

Thank you.
