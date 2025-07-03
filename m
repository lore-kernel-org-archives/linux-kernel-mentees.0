Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0F730100
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  3 Jul 2025 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560535; cv=none; b=YZT9Gb+UrTQLq+3XJDmYq0Vv7ZUh3KJO8W/TdhnPcHz5kumgNxYmEjFMLJAVoFG+f3KCUTEbMMD9cBxekAo5WP/o970LIqu6Ug3XEtGfhzxGBnNDy199FjylfYSto+Izwym4nl+9kCpsbRD+l4LWiWcCQBvXsZFzfdIXwwkFo2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560535; c=relaxed/simple;
	bh=mitvISWYz9VXM4jc5Q04XMHY5jFnGMTPup9ISmOOkYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O36kHZN6F4B28MUnr2AXF2p2TVDDaiUBGseJod0/S3dkG1R0loKCqaTLPwl2L6hY2Brptm4OtCnXGo0EZayuN9f+YdRL6s8TosdrtxPrNXbur4jQh6IjUqM2gXWpLzjNxSpcSCGxzg26D2R4uD8z2GELr1qA9mEmdeCycJ5takw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaNyuE7f; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaNyuE7f"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7115e32802bso56808457b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Jul 2025 09:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751560533; x=1752165333; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=utBS017XFgzQ0zp8Wqpxes+6RofiALZItP1TdxQEbKI=;
        b=NaNyuE7fDGzNnu0cbtjVrUOcr50E5ta8rQ1Ja0v/f3KcpbA7nL/+7NcbPpKF4G/0Cg
         FZRuzmrAsxv1LAwzue9LvPLOMgl2sKXtBvfUC9DZCd9www5x+Rsot7NR+lIaHjWyeX2H
         fIV2PGX68Bto7ZlfWQRMszH0BC4jpJv0Rn5Rcrb5dSfAJa1rPTaCFe8Bj+4pTqgynV+V
         EVT33fZ/N1jek/aqqvz75Iq54hGtdHqkJO6mrSmlbjzM4vKY8Bh+6lYNOti5CJ6hOn5G
         OiSoTnTPreWQgrW/7mAcXuNd0S8g55iIEck9d5CzwzDCC+1p305ns2ziGqpn6791IUgG
         Ykbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751560533; x=1752165333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utBS017XFgzQ0zp8Wqpxes+6RofiALZItP1TdxQEbKI=;
        b=ROSvJoL7D2SDXoeeam0fHNR63Su1l+Nhko1ImIS64slk1k7BaLO784sfB8LRIwcV+x
         85OxzxV2yPDVjxGXPuT1JRMeIaDYq1cz+vocPwV4r261LCPekavsSsPlyTqnFdsAiF16
         WffMNs88TkCuY5b4rm14k3y1O6iTwoFtzBEscA5WvJ9LX25EJKVeQg8PH/5x0LbZe8p5
         DVTy1YMZ3FaVlhhG8Bh8ygHqI+yrWySJbG7c1HUGjmQltDYjglKqrnuyBTa/AOFfohij
         OkuvKTC3uqR1Rq+boi7ed+uu2/4iBHHx+we7Cy7o10odGUFlMAkycIkrzCi14+tzly5y
         yIBA==
X-Forwarded-Encrypted: i=1; AJvYcCXiUgP6+enrzsEeJHAQsfAJSIDGT9qfJo5/7o4hdChAyzFGqQlEO8qvBl+E/0hmis1tlZIKOTKvCXg8N4PIrEEkgg3Ryg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvYVy47fXS8mqUm+7r2/A+xWEGJ8HvRK52asq6aRdRbQml9D4a
	uHkn4/p4QFB3m1joQ5mhqKxvO5M+uLkj4b2AjE24t8XoY0i/e4iLNvnFre1UgpALLxJOwDkM3Nh
	wboq/1yztMEcfdQetrlebOKK48x/cWTY=
X-Gm-Gg: ASbGnctHurZyMcbQwVTorI7DT8ZBn1Imj7Jc0kR9hQ3UXnYL9UmLFJR8JvswiIVfx/q
	DP3PJEjEclfBdM5SiP8Yw96MxJcoqJ62RpWHVQd/2SZ/cdJIPMMluIn9OAvABevAzQRs6alaUUK
	o/dnU32kr9QcMd112QM13/PLo1JmoCy2OcVJ2CoC6MNda9AKXQUvrGTFoXwaIm771x0iVnGTsxJ
	s4=
X-Google-Smtp-Source: AGHT+IH/iyPTFqL3M3jHfprWGyO2TfoMbrPC7NbrggZ1Yo0bYJAC8QHCPeDEMdhCNBakZBK3OaY2qZtlskNgpVcnuS0=
X-Received: by 2002:a05:690c:9993:b0:70f:253d:f278 with SMTP id
 00721157ae682-7164d2d0f01mr107532887b3.15.1751560533232; Thu, 03 Jul 2025
 09:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250702065908.430229-2-moonhee.lee.ca@gmail.com>
 <DB29OMQH4W9Z.1GPKEZBBIRSTS@gmail.com> <CAF3JpA7wM4JBdd6OvGS+hmv0UahcW=h4HrPNDwRNhduk8iKsWw@mail.gmail.com>
 <1f13328a55c54fb49d8ca1dd72bc5de23f161ac8.camel@sipsolutions.net> <6ecced8b962cf3a6f5056a87aa3442c49941e74c.camel@sipsolutions.net>
In-Reply-To: <6ecced8b962cf3a6f5056a87aa3442c49941e74c.camel@sipsolutions.net>
From: Moonhee Lee <moonhee.lee.ca@gmail.com>
Date: Thu, 3 Jul 2025 09:35:22 -0700
X-Gm-Features: Ac12FXwg4u1q7mSzj9AU16Ms01bFVIpviQb0K31UMy7j7IsxJBZgw4Jou9gHLgw
Message-ID: <CAF3JpA7ZeG5uxLJr1NQBBzF=UZRi4sj4TSfBw=Pvx7xb1NCqTw@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mac80211: reject VHT opmode for
 unsupported channel widths
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Nicolas Escande <nico.escande@gmail.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Johannes,

On Thu, Jul 3, 2025 at 8:09 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> I'm not entirely sure that'd be correct. 320 MHz can only be used on the
> 6 GHz band, so clients must be at least HE, but I'm not sure that VHT
> opmode notification frames are completely illegal for them, even if
> they'd like use OMI instead.
>

Understood. That clarifies the case for not filtering out 320 MHz, even when a
VHT opmode notification is present.

On Thu, Jul 3, 2025 at 8:11 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> n/m, it just did that quite explicitly. I really want to get rid of all
> that 5/10 MHz code, but we still have S1G so that might still happen
> anyway, and I expect for S1G VHT operating mode notification frames
> _are_ invalid.

To address this, I plan to reject the set of channel widths that are not valid
with VHT opmode. This includes all channel widths below 20 MHz, as well as
20 MHz without HT (20_NOHT), which is also incompatible.

Would the following logic for v2 be acceptable?

    /* reject channel widths not valid with VHT opmode */
    switch (width) {
    case NL80211_CHAN_WIDTH_5:
    case NL80211_CHAN_WIDTH_10:
    case NL80211_CHAN_WIDTH_1:
    case NL80211_CHAN_WIDTH_2:
    case NL80211_CHAN_WIDTH_4:
    case NL80211_CHAN_WIDTH_8:
    case NL80211_CHAN_WIDTH_16:
    case NL80211_CHAN_WIDTH_20_NOHT:
        return -EINVAL;
    default:
        break;
    }

This allows valid HT/VHT channel widths, including 20, 40, 80, 80+80, 160, and
320, to pass through while filtering out values that would otherwise trigger a
WARN_ON.

Best regards,
Moonhee
