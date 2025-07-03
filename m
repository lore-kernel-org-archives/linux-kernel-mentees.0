Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C5629B8C3
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  3 Jul 2025 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530337; cv=none; b=ZhQngLZ6GmeLJ7uuPtRhJqkeqrd3AKIQj/3xEbvwWMJ51qHumgXcSakQOhiVy1y7vkbpRKgMFU8AALCgjMwl7orwvqobd4BjWZP9oIl7WCNM0jmQEep6HXWN0U5JkJRY5YMKpKIwJpYYLo11+E0EjrbjoIJ6sVNPVtUwh1zOiZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530337; c=relaxed/simple;
	bh=gerF8JQWMEdkhKtxPVw/PtBWBbq5eskmcKg3u+ll64w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JWgUpK2fkA9XfixKOztczQOxZEJOq/fCItcTJOFLSdLED3O8c61UYTVn8+HPHVI0FAsAd7KQDBvtUia1BHgW3SB1YqFKJ5ud2AhkqTToBjLOesDoHWrtYoSRGJSVEbSFjz/tmxBGwelmpTRWIiQaLV7a2DXMtgvXpn52YZvH+qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVgC2c1T; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVgC2c1T"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d3f72391so55862215e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Jul 2025 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751530334; x=1752135134; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2Amm6SDjKC70sAGhYgLWsL4iEpai6FEV+TRkntvAp0=;
        b=FVgC2c1TOYd07Er81pBv7oA5UqcY4ioPJJr00F43NIiET1uJgkY93AS8TYmAGdJtxy
         KR/JjLDTrg36YmDfc2gg6bR/DgdlLVRvuXjGkoN/DUNN78af9ifN2lxom6RlsMYx0rcQ
         RKynCf4Qw7wkt5atAgkBgBB8g7rnZWbPm4/3dahcG1M4dSB2oagu4EvSlRUjzCip85RX
         m5WDfzNK0dVStvdwHgKyCFrBnV+fZG3SIJDDMGiZnUNHTbDqxG8BYHIUZxlddLNlnXpP
         X3Nc7/IrVyV7oxHl9X1XmXiciDqENqBFF7tLHQTjThLpY21O1Lh0y5ocudcr3dV32Qr/
         nz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530334; x=1752135134;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n2Amm6SDjKC70sAGhYgLWsL4iEpai6FEV+TRkntvAp0=;
        b=qNR81Q28EppF8ATYXn6DHfnd9uQASMTB+Rf5MAP7aoYAKUk+XBmon/T5wJvs2MyZsT
         nvhAptrtcBP4thxqtHSKOiqvUM3xmfvfTlpqZuf+iVVuSToOxk+0NTzGwDgahENtc3FT
         WY4rDwwTxudtfrG5jSmaStuWEho7HSuYXzSfSM+DwuVfsvJdJf5qHGAM5qa1DW1NJJQ+
         CD7Rq6w8iqj2TNwCqCxedKl32OKoXQxYxtyD0YxFfi8Dhn9vTDjSwaTucivkaL1lLQTa
         Mv/VNyXFbv4jXY1VE1CgkYngMKQJiD8HgQxMy3l/5k2jCHgWX7QiVMiPtmc3+Q/eT98O
         1glA==
X-Forwarded-Encrypted: i=1; AJvYcCW++roETJbJpT8rVhy15ValzKkWe7zK3XoYlln+CCD7aefYlodYGq7jKbsHptCo72scIIZIeRV70Ix9OhbO1qGq/DvBlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhsXGcAuWWGn7C5/WFfUe8T2Va8xRoOXBAFrgaycME5HNLR2Y0
	OEYAZPIZPeBJs5owbzCtVYNR8MqtVjE9h0Val9eDXbTlgFeWb3SoDxKH
X-Gm-Gg: ASbGncsKXovcVMW1noAIpPCVadlhemlWMHLYPRmEbjLkNTFcYt0RN4bwQM6UaQg2RpM
	krYNW17/uqGfoz1NEKkiM/9+xbyLVwU6MEgm8IgKFgbHH8buHz88Y6310x2AO0gh95WKZvPAQgV
	+5k81nP0ER02HFmgkGA59w0w80jyJ41g+/AFrNwGeFh4CRj96COdE66kjGxAzvk0Tuegw+0yH3Y
	G51g+iv/ydIMAQqcpCoftHddncfVxQCpU4xNPckehXHIn1MCU8+VcF13XRtUsu0XOJEQFUYUmOx
	MO8YL3soXAl75Hnxhs+EUzPlvzJRxIG2rV6o6l7E3FVgL7yV9o0telB4gfZ2sltvxLjBvedzRl9
	CA8YO
X-Google-Smtp-Source: AGHT+IEsq9wzUgl/VuH0s0iIjat6vHpL06Nc9v/cKnSMypsYOplsRyGJHy9CMEXSR8iNqHbAWyjM3A==
X-Received: by 2002:adf:b60c:0:b0:3a3:71cb:f0bd with SMTP id ffacd0b85a97d-3b32c196f1bmr1505622f8f.23.1751530333868;
        Thu, 03 Jul 2025 01:12:13 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5972bsm18169702f8f.68.2025.07.03.01.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 10:12:12 +0200
Message-Id: <DB29OMQH4W9Z.1GPKEZBBIRSTS@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com>
Subject: Re: [PATCH wireless-next] wifi: mac80211: reject VHT opmode for
 unsupported channel widths
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Moon Hee Lee" <moonhee.lee.ca@gmail.com>, <johannes@sipsolutions.net>,
 <linux-wireless@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250702065908.430229-2-moonhee.lee.ca@gmail.com>
In-Reply-To: <20250702065908.430229-2-moonhee.lee.ca@gmail.com>

On Wed Jul 2, 2025 at 8:59 AM CEST, Moon Hee Lee wrote:
> VHT operating mode notifications must not be processed when the channel
> width is 5 MHz or 10 MHz, as the VHT specification does not support these
> narrow widths.

Hello,
Is this really specific for VHT ? or for HE /EHT as well ?

>
> Without validation, a malformed notification using 10 MHz can reach
> ieee80211_chan_width_to_rx_bw(), triggering a WARN_ON due to the invalid
> width. This issue was reported by syzbot.
>
> Reject these widths early in sta_link_apply_parameters() when
> opmode_notif is used.
>
> Reported-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dededba317ddeca8b3f08
> Fixes: 751e7489c1d7 ("wifi: mac80211: expose ieee80211_chan_width_to_rx_b=
w() to drivers")
> Tested-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
> Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
> ---
>  net/mac80211/cfg.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
> index 56540c3701ed..5a6ae093a8bd 100644
> --- a/net/mac80211/cfg.c
> +++ b/net/mac80211/cfg.c
> @@ -1981,6 +1981,21 @@ static int sta_link_apply_parameters(struct ieee80=
211_local *local,
>  	ieee80211_sta_init_nss(link_sta);
> =20
>  	if (params->opmode_notif_used) {
> +		enum nl80211_chan_width width =3D link->conf->chanreq.oper.width;
> +
> +		switch (width) {
> +		case NL80211_CHAN_WIDTH_20_NOHT:
Because this seems weird for VHT
> +		case NL80211_CHAN_WIDTH_20:
> +		case NL80211_CHAN_WIDTH_40:
> +		case NL80211_CHAN_WIDTH_80:
> +		case NL80211_CHAN_WIDTH_160:
> +		case NL80211_CHAN_WIDTH_80P80:
> +		case NL80211_CHAN_WIDTH_320:
And this did not exist for VHT either
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
>  		/* returned value is only needed for rc update, but the
>  		 * rc isn't initialized here yet, so ignore it
>  		 */

