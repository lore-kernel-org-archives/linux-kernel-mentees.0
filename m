Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B160A39989D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127755; cv=none; b=ugAIHSF7liyYF/6tbIRVjkqXpw0cj0/pv2BHcMSezUziQDNVQGAGguxF0gfHILsmIsuN5sHTq9IJK16fb0jSpqWkw//4GiVoEhayiDXYa6akKn8EJFT2ku8cyk031sW5HabNbmMJ6UwqMJG6y9m3nZ4qJX5H+LOZna6HQd19dHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127755; c=relaxed/simple;
	bh=CQ5iRuASP/6zaZHbr6pg/X1qLK2SKrbm3fI/MPK5v3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uv3T4x6RMxJmsgR8Oq5lB2MrPD/bFTHa5Tnrmv6whr2uZDk7FB2eSTHJ7WblqNakrTTHRiJoiJf6IYuW9S+mJys5ZONCs7vWJ3z29ZEo8UkDJWaNjCTKyrNjbQQO0ELgcJJbstg5mf2XH4z744M93nvUkFByeqv0MTkOQHEQvuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUn1e7Is; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUn1e7Is"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b9d265355so2249565a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782127754; x=1782732554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbU20Bb7VsxF0bOTSg6979laICbrtwC64LAcDXqiOZI=;
        b=gUn1e7IsyyB4qM4INHYpAveOZrnXiyqWpeKdWn5RFyO7MVc0q1/LnQgX1ksVesrErb
         TYSUSscxP/biQGdMyve/JSGaRZVpEFVLXcEtfX2nwmY6hgI4k1KmUIKUrp80BO8E0RK6
         aAFRAw4ZANj1w02a99jZqcArjzcOUWXfgAikfChrfqvayR90sfFzSRNxgtNDDn6z7tCp
         5kJdSIQgLhKlxDUDsbAYYBSVys4WIB/RahWKZpB1VDcj2xg+WhzDMO6syoo/G0MFgclq
         GGBBmWutdHT8rDTXUlLXIkelu3lC7m++f056y5c020XB0SNGVeIFfhonovbdJb/kxtSr
         s6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782127754; x=1782732554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mbU20Bb7VsxF0bOTSg6979laICbrtwC64LAcDXqiOZI=;
        b=TI/LV7r6OYwVnreddaPfc213fgzl7AXyEii3HbxaOGuv7SSqh00NB5mqOm4egPnbEU
         vPvEqOc4YiIKNxugdP/IOgUYX/3Od4GbtGsI9MwPRIAo82nnelDvEuwnDkR46n2pso1Q
         0g4ifZ3lcNp4YII5F4wa39M5M63BYfpCdUVqwII020lRW/3FiB4S1pZMVKShIBxXe8Nx
         hyjEiD0U0A75jBBsmBxxA8fCUZiwnlPitGr3fN/vRASi3NrUAJsL6PUOANVVWhyLy8JS
         Sk/dB+/dTugibXe6HKWKHMGGjABjguyQj/HlHIYJK8rg6tnh86cFB+gErbL87b6xF1YR
         14EA==
X-Forwarded-Encrypted: i=1; AHgh+RpsXE53+9bxIMwZ7m7NkSca8GqcOCHnxx4MHgJtW7rUYbluuuBbALId3Bq/ZPRb8i4qf/iB6IyV3laGw7YIa2nGf/ZEig==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBH7oUaclssya55RlTvMT/Y+8EtC4oywTnywyjz5XGis7UEcOI
	Fs2z+EgwlsiRR0WXVoOeDUlJpx5qWXgfT28d+MEQ8lq4lL3yrXl1F8rI
X-Gm-Gg: AfdE7cnwI0rCPHaPZEpfDyevMVMkJ81iQ5f33nfGaI0YFHYyWDcBvs8mnQfIE1l9E0l
	B7gx3qmE4vJV29IMJ5n5WjxhUBm89oabLFtCpc15Bwpl3/KqFfWEnDXR9xqb3hB4fTidIZPq52X
	iHxxcLeT6qwEadzv1yTRkXZhfovw+Drm5aPUphFySRQhIWHwmSHhotQeUv8D6ULtadHNlVziiSo
	Jzdqi9RwZgR6mc9qrFwFCnRYQWA23npVrPogVGvXOZgmZJPKHO1syp7RUWccPJyHCKrEumSzjgP
	4eQz/z4be+IpeZaZooz14fsQai0Xbo0psd+49vaZ1qJyKnbgDdRHj/iHr47MOP6gCWSQNwenHL9
	4tVylixHpULFV2mIWqo8BN5dcokVaQ26e63Ofl6f68PN7inxBQDzl47MmaLgkktNwdof9sOega1
	T4gZAjfj2RBZWKhw==
X-Received: by 2002:a17:90a:fc43:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-37d160055ecmr13971819a91.4.1782127753871;
        Mon, 22 Jun 2026 04:29:13 -0700 (PDT)
Received: from fedora ([106.219.196.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d135e2031sm9898801a91.0.2026.06.22.04.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 04:29:13 -0700 (PDT)
From: Sajal Gupta <sajal2005gupta@gmail.com>
To: error27@gmail.com
Cc: linux-raid@vger.kernel.org,
	song@kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] md/raid5-ppl: convert pending_flushes from atomic_t to refcount_t
Date: Mon, 22 Jun 2026 16:58:55 +0530
Message-ID: <20260622112855.42685-1-sajal2005gupta@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ajkVDGAdveCH_urr@stanley.mountain>
References: <ajkVDGAdveCH_urr@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Heh.  Yeah...  There is not a chance I would merge a patch like this
> without testing.

> It also really feels like an AI patch and you're supposed to say when you
> use AI to generate patches.

I wrote the code myself. I did use Grammarly to help with my grammar and
phrasing.

I'll send a v2 with just the break fix.

Thanks,
Sajal
