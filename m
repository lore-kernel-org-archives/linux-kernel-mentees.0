Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F69B38DE9
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745244415; cv=none; b=ivAKtQlUDM4V+9KHeBjES3SA1nZDMaOGctuWvAdVcRyTtxtQqMdFB8g2I8nNq90lo6pNVMOjmQgK6pw35IXdLO7tYbiYb7UKzV59vtRgsJZQ1VIoX0XM/OKllqugmNe6DZDgBdBVBMhwKq5qeO8Y7YR5BJEV5EiMbrGY/j+9Ob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745244415; c=relaxed/simple;
	bh=eJSvP6WoW1OnCWuj048isT9pN6rXqEQM0rSV660pM4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDYRo/WUVboykM4Q2EuTnECH25WrA8gPbWFz0A+DYZvQFlQu84BZliEMAzsIa0O0VKvYB4Rr9VCXZVkdfW0CPRlmvu7PGI5JQCXFh2lCEmLEW2FZ3qBdi+Xq1sV5nlbgJPeULWp+x+pl6nTGq6VTjoZSVX4ewe+Lk3FTO/F1DOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZIGH7KR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZIGH7KR"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-308702998fbso3621394a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 07:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745244413; x=1745849213; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eJSvP6WoW1OnCWuj048isT9pN6rXqEQM0rSV660pM4c=;
        b=dZIGH7KRmwDBDyUODaot+GLcghcnlWuynvWcSxks9PAwHGUgfiNv/CTOCkpTw7WBuT
         BZr9rwst+frwti1+fgtWp0RtAW9eVvLSYpu4hykaNNUmveJh8Mq3tAu2d8t58sEDObz0
         Qcy/gqD1f9ry8EF2E85QPrd6xXBPKzW6zYLaH8UxUPU/piMFWGpsmwMiHiS7sHYl0sly
         hCreoMndSijNicgYPmRUHLTpty9mHQFehbovBqJkS53aO0Ou9U0Qat8gSyV4lkR2DhLv
         rkLmeZyPE+gwq4KX+5o+Ltrbpouulh9o/yfZZIDjrS1Ae3L4Mpp/cAGW2uQJ+/zdP+pz
         g8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745244413; x=1745849213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJSvP6WoW1OnCWuj048isT9pN6rXqEQM0rSV660pM4c=;
        b=HiUR7a4wqxl8cp8QEy04xiEU2YeZxmyliFXmbGK1x/rLBNTK9BqJr9VjlR9wCYwVar
         A5eogSh8l7WtY057MmoY65muW6veOiZSPxtqcE7+0cIu20/mdYsmtVtRfHas3n2EaQ5g
         BQzPgu/4Cbk7fy3Uqo68+aHpr0Jtnl9XL9ztB7WiFAe5CfSq6G5Ld7HBJIoiGknpoko+
         KgoNsBzKmfJ1JZeYi6F3NLEnNcOzup6Hbwu93QUIceFwJKNSGdgtFoUTNK72bD2lcY+/
         Aekl3zyUgKPvz/hk5Fnd380eUEJEGiUWdMdsTQOOUmNrsIreRz5XPpzAxxoHaZRaIv8+
         kehQ==
X-Forwarded-Encrypted: i=1; AJvYcCXITqPtwhkYkWrp/qUkq4GAUl0SvZVUhNhH8l+yp74GrTm3kWvnPTG4a3OgXXz+bhI86NtDWitDN5r4iu+KzVEOS5K3xg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCRGAxCZuY/CQtCS9XAjwLMs1zA4QlPNbsoSzYYNVB6It67Nf+
	BwIIRr/RMoZDUJFDP3pC7sVTJj8+ED+07usfMcC1D8dM5Vly3xa8
X-Gm-Gg: ASbGnctPE42G4xqLTspBpbPjtY/qFZOQqukAmeyWcoN8b8EY+z9nYTyxx1XNFVqAEe2
	br6BjuPH4zWc/0DrVQGUc/SQCM01VBW6gYANbDicF6pm4FnT6i2fx+tNLCZxL70lSdLTz8SDTZ5
	y149bWz3EJznY5igUsSFmaU1fFz0hBKQBaJ8x7/xuyhW2R5WSzF7A1TOBJjJEw18M8MLDGGsdNg
	IGbN467k/eGggFvg475lkSH587THHU8qy84l4PGXWag5OEujaNWGEkOMntJPYN+XLYKQQ4L+gyB
	2ro68fQUjsvJmnPXwWCubBXKMiMKd5t9l5YQhab9uPPZTGHxP7giXvH1Mg==
X-Google-Smtp-Source: AGHT+IEMWH811QnX8SwzsqnyFjLTQnfz+ENu2Dko3yepmQHf59RoumB8vWB9UmZwjeYORmMPBWW/mg==
X-Received: by 2002:a17:90a:c887:b0:2fa:15ab:4df5 with SMTP id 98e67ed59e1d1-3087bccb042mr14746550a91.34.1745244412669;
        Mon, 21 Apr 2025 07:06:52 -0700 (PDT)
Received: from localhost ([2804:30c:90e:1e00:5265:5254:2e32:7e5])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c50fdf1e6sm65418065ad.224.2025.04.21.07.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:06:52 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:08:05 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] iio: adis16201: Correct inclinometer channel resolution
Message-ID: <aAZRRfO1AmiHs4Bf@debian-BULLSEYE-live-builder-AMD64>
References: <20250421124915.32a18d36@jic23-huawei>
 <20250421131539.912966-1-gshahrouzi@gmail.com>
 <aAZNCEUejrTgy_yZ@debian-BULLSEYE-live-builder-AMD64>
 <CAKUZ0zLEacGg5cD4wGmFz80e4FQ9A=JsVyrzGAHkKEeOT=CU2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKUZ0zLEacGg5cD4wGmFz80e4FQ9A=JsVyrzGAHkKEeOT=CU2A@mail.gmail.com>

On 04/21, Gabriel Shahrouzi wrote:
> On Mon, Apr 21, 2025 at 9:48 AM Marcelo Schmitt
> <marcelo.schmitt1@gmail.com> wrote:
> >
> > On 04/21, Gabriel Shahrouzi wrote:
> > > The inclinometer channels were previously defined with 14 realbits.
> > > However, the ADIS16201 datasheet states the resolution for these output
> > > channels is 12 bits (Page 14, text description; Page 15, table 7).
> > >
> > > Correct the realbits value to 12 to accurately reflect the hardware.
> > >
> > > Fixes: f7fe1d1dd5a5 ("staging: iio: new adis16201 driver")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> >
> > Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Should I have included the reviewed-by tag on the latest patch sent in
> this thread since there were no changes to the code?

Not sure I had given a review tag for this.
Hard to find the previous versrion because it doesn't seem to contain adis16201
in the subject name :/
Anyway, good thing the fix should be added to IIO now.

Regards,
Marcelo
