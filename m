Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A42DA55
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 31 Jul 2025 00:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753922987; cv=none; b=d6t2dtmoZ7k3w6QDnbr6Y3g5BI5nBjs1Fgh4aCJIg7JO3IpCwc/Y4bp5SRb2Xaufv0b8FD3MskBMZVhZ+pOekClg0zY/uU9r90vWvmcIBZHPS8D+ry4Ds0/Ldyc6spZYqAyRkD+oLIrmunYXwRhNVd0XKIU35Uh/0f4aQ7SUOMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753922987; c=relaxed/simple;
	bh=vJDt2FYYLu2qEDdCbjucML8LgrSLjpCS+v7eTHCd5u4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=UgAj8aMfqbcQy8LJT0Qj7A9PsCSYMym/IzV+M07hK6tuTafokhdtwRit4G5CxnmojgV3LKUxJmF8P4a5WXWy0Q6p6xh++hno/C2g14IPx25ygKFp1ucnURlnzJXPFH3xKAR1LANoyjZBQceg40uFZ6WK0Gsw1sGfuJ/I0fy2LUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=ZC8HaGUN; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="ZC8HaGUN"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso362588a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 17:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753922985; x=1754527785; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJDt2FYYLu2qEDdCbjucML8LgrSLjpCS+v7eTHCd5u4=;
        b=ZC8HaGUN5Pk/FF6PMWbqs6obYdQTUbUS9P/7eXaTCLQ8Wrm+R24LGvjWgz7BzPziG9
         uknexgZjm7+qU8LBWrpOaNT6pwnJZf+29DrtWRGbY5i0cMMzdgYIUJzFQuouCu7BmHMn
         IqvOvKu2NE+yTuE2D9YUmCZF1aaOmo+RQWJ9fhf1SRiw7s6Mk4igXJj1AEpFagzYMH4M
         qpss/ZZjCyCaRYgRIrlhnhLbW2+5R6Nz0aeHvAL16BcLTgAtj525fzZZgT7yu7JbqGwa
         YzJFxXyvk7UWQVJhkMotqeNrbXVcIMXp1pdHEoqdqZ6SeFc0NWrAyhKelOKNXN5iOi2y
         oo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753922985; x=1754527785;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vJDt2FYYLu2qEDdCbjucML8LgrSLjpCS+v7eTHCd5u4=;
        b=p0vrq+XBGePl/vOSuZT9xFV1g7uRQA0JYIuXF3DJMs4En8bdW689tM60N7OdI+SpWs
         bNprDEtr9h5hq6TLU8KKdhwzweIpR/1k8+c9dHboYVORGIBgKbfXABYvclMRLsFIVpbL
         SdYghN7IvfMbzxFt9hcczBomhl3s1JlE06eKm4rdtDCs0jUM887beURachxDWN01DxuL
         /eHoXJN2y8a9Ybzimm0X3EjDKYcKebmahXH7JQ6owVZurRpA1BCJ3bR1b8Mi0X+T9qjW
         eALJO+mKxCr58ZCAGY0BzckCWhKRopwDM43LyLyUxGa3CYY1qEDj09/+yPoP9ESkypAF
         78Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUYIWtI1KYBmpljcBhH1wVdxrURk74GujELCR6sd1vOxtYA8Z6cUoWomi9uH+8576nG00VXAwbFgSWDV+Vt9CQvrNqFYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZoli9Xh9DoVF0XtnScgplQgwP7kpG81lik5TesOBU7XAOrJo5
	drz80vgV1JIvwyRJU6Dx1CYp0HG7lfrnOXnDqAD4OGRJ/YNfLR5jM5QD6E7GJNFOEiuBqpRuqAF
	b1IAAn3TaDA==
X-Gm-Gg: ASbGncsWSvvwkk6epw2VA6TBYL8BXIMMAOQ18BiqVV8xVrGYAcQQdZiKEnoa/D0F3n/
	2XoZse2Ylvkj0r0rOEm9rqSqNEJJfdUk/rEYTgCtNj0Mt2sd9yffHO6/uJjvMHmw54FT0JIrrb3
	HX5Z8DEZz0ESsHWwJcvF5sUaXthXKC0Wm9+QBR9oEry4jpWmRSkh0tpBYz2g41+lMis5T7G+p/s
	ghewQl8Gn989g5RY2yFbFVO5NVjC4SkQv9P7fdRslg2anNHy/2hnspD3ELmLrzX1bMZ2SStidnO
	Z67zKOhv7JGNFMGffz06b07AHsYAd0WSoxaT0FFSpwjzrzaC0rhQWAwvl8Psha7SRIuBKON7j2i
	+Yp7tH72SmFAatlYfEVE=
X-Google-Smtp-Source: AGHT+IFRg4d14fwyDbWfm6s1XgJ9O3YqeFegbjebAyJ4PNp/hfmIOJ7UPSuIb8lsRamTPF40s9y5Jg==
X-Received: by 2002:a17:903:238c:b0:240:150e:57ba with SMTP id d9443c01a7336-24096a72ffcmr57849285ad.3.1753922985361;
        Wed, 30 Jul 2025 17:49:45 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e81dsm2897185ad.46.2025.07.30.17.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 17:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Jul 2025 18:49:42 -0600
Message-Id: <DBPTT2WUK2CH.1V1KX11EJPIFB@brighamcampbell.com>
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] drm: Add MIPI read_multi func and two write
 macros
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250730061748.1227643-1-me@brighamcampbell.com>
 <20250730061748.1227643-3-me@brighamcampbell.com>
 <CAD=FV=WpbU-iuEDVRuMm87H48PKQ3pz5aBwTRyedguFQA3dvTQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WpbU-iuEDVRuMm87H48PKQ3pz5aBwTRyedguFQA3dvTQ@mail.gmail.com>

On Wed Jul 30, 2025 at 9:56 AM MDT, Doug Anderson wrote:
>> +/**
>> + * mipi_dsi_dcs_write_var_seq_multi - transmit a DCS command with non-s=
tatic
>> + * payload
>
> I should have been explicit, but the above "non-static" should also be
> "non-constant". ;-)
>
> I could probably fix that when applying, or you could send a v4. Up to yo=
u.

Oops. This obviously needed to change as well, but I tunnel-visioned
hard. I'll go ahead and fix it in v4.

Naturally, I wouldn't be at all opposed to you or any other maintainer
making such a small change to one of my patches as it heads upstream,
but I'd rather not ask you to remember to make that change after a long
vacation and a busy merge window. There's no need for me to add even a
little more cognitive load to your job than what's necessary.

> Speaking of applying this, I'll be on vacation next week, so I won't
> be able to apply the patches until the week after. That will also give
> anyone else on the list a chance to comment if they want...

Awesome! I'll plan to sit tight and act on whatever feedback I get on
v4.

If you happen to be flying over northern Utah to get to your
destination, look out the window. I'll wave as you go by.

Cheers,
Brigham
