Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3765B1A0711
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 17 Aug 2025 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755447949; cv=none; b=aoZUwYntFrmWhF4tcSuA4zrpWJ/MYDBzzTYVs/m6luBjX3f4/KHRGky5iGKPl4YerXbETaZT7a8jGC3Ry04Rrf4lYOV6IWZVWwJcQdpjBbuCwQZd31A4fVtZVSHXCG86gzsR4ZJvOst4EBRwSo4zxcTLiO7DqrjLsIeeersXFO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755447949; c=relaxed/simple;
	bh=zmiACXqLpLkcT3ZhmjWahajC8NaTI8Ja3caQeOvtDWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AT8L/cHf91QseE4BDxxiGOTd7ZOH/lsQ0wJtPrvu05eiTRwtvHfA5Pbj0F+NwzG+fw8ZN2ZwikB2WS6cktv6HzXxJQqrf8UDtvd5OQudK5+RFJeQh5qPDABnBIjR1pfftdKmXHDk1QNScRtNb6gOqF1bps9VP/BQM4pqr+dR3fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EChHVgRV; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EChHVgRV"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71d603a269cso27036527b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 17 Aug 2025 09:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755447947; x=1756052747; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmiACXqLpLkcT3ZhmjWahajC8NaTI8Ja3caQeOvtDWY=;
        b=EChHVgRV8Yauqbnn7KLgrJmtdJY8xswjK3whRwSPj98Sq4ihQwKgySEzynH63FUM+/
         fXBbLx2sBeJ0RUfMwK1Jq2Pt5UeS+G/F46NCTmXEvdxK/XPfWuMc6gb+u1BA/vV4gnBH
         Epx1Js+eQ8DDQlVlEHxUNs70nRPsh1mUyusVUT7eyhHT32WMChHvOl8wHhE/dKzmXiq8
         z4RfvUkIJ+jUYGAbwvEPNXxvXQnBGa+3rYLxTLL2zsWrtzKQ8xZJJUEl3RvEoRUOe9PU
         JzxseGlZIVsl6byGUR306ku+vwyDSOzig8CEoY4UtF0nnAlTWIiOwfP2DkM+taYnVXnE
         u+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755447947; x=1756052747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmiACXqLpLkcT3ZhmjWahajC8NaTI8Ja3caQeOvtDWY=;
        b=ECr4sz2tZMDOdHuKh3ToPEpF8gdZCPn8WI8YotJ2ZN7cSB3Jn0GcHI5PA2cBnVK+It
         BdD99DFJywkHSgupIiEPZJElKge3egUNjMJZeEPkiNkvEmq8WLh3juTAJAHOVLk3L/V0
         FUL9bpDmU2Js6IkqcQGgMIpZuhrUmmDt+d1QxnDf/xSfYLy9ewpceEUQrkYeKl5hhBbn
         uHicPHr2XiFnPxdVIUZnZuK0fzWLln7k1k4j7buaUyUDOinfnGduczVt1yrus8ntOXNw
         /Key6ACpySEItqP/aOi5GbhGrAa0aaVzQq6kcHRVNlHov9rxq4JzDT7TN3qJ8hllsqDI
         DDSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfridVaUSrTdCZgnbOeehYz8qBXumrPoEc6gc+kMhxdZRkb5d52q9oEKy9crJKu/MyqRk838aq5HAAXmSnMLbZBK09WA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAlGm1na4BxbZxFLWIoe2ZmXH0IQV78c24V0pPkSQzAekgfxn2
	E5V9HyDN60lR17mrS0ATmzhXdwieyYjnYxjyNWVCsU6qVRAaseX5twy/8cCJZl5auhlEj/hB8a2
	vNpHdCq9TYT8WsTBL9v9GlQrALnIl7Zw=
X-Gm-Gg: ASbGncsKtHexwsar/+HoWliEgiyMBnX1UArOnq3GWUdIT+tGvKcWJQsJPDWD8cay7Aw
	jmnzj1s6D4wFeD426A5D1fnn46xrmgFq/TMTu7g9QgrhPmnEm8X0ZY8NczHplFlz25IDjKAtA6n
	m6g/1Qy5CJ0049x49sOJzRI6qlscjnpWJ5iywDE0pxdoF+5SyiBk1KrtAwnhYkBZY5soK9mH4ya
	OC6Wc+Hr9Z/IXjk6zVoIjUsFF/Lh7Xj+5iutsqZ
X-Google-Smtp-Source: AGHT+IG+xBo5puS93TVrmC1TKc+zOuhMMdsgJpXZZxuJXTb0uV6MEJVnYxgB27wUJ/b7OyNuQ8Rh1qY/ThIH3sFXqO0=
X-Received: by 2002:a05:690c:4444:b0:719:5664:87fd with SMTP id
 00721157ae682-71e6de4b18amr115322427b3.37.1755447947121; Sun, 17 Aug 2025
 09:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250816133757.98624-1-chandramohan.explore@gmail.com> <20250817153209.560334f5@jic23-huawei>
In-Reply-To: <20250817153209.560334f5@jic23-huawei>
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Date: Sun, 17 Aug 2025 21:55:35 +0530
X-Gm-Features: Ac12FXwfM2kzUpoPyep62s0T0zr3M4VQZhgbIggOLeBRS8_h9-EeAJ_Vuv6Sdpc
Message-ID: <CADBJw5Y=79nc3Hq+g0i6VokkiOuShrJYCXr-CGcTojj+xZ0QfQ@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: ad7768-1: Remove logically dead code
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	shuah@kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 8:02=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
> > Fixes: fb1d3b24ebf5c ("iio: adc: ad7768-1: add filter type and oversamp=
ling ratio attributes")
> Applied but dropped the fixes tag. No need to encourage people to backpor=
t
> this.
Thanks Jonathan.

Regards,
Chandra Mohan Sundar
