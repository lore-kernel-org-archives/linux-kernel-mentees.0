Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D173101BF
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Aug 2026 00:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786494189; cv=pass; b=hrWKc9qDGAmBQ9VgZ5EdVcuWDANV5jNQqWsOK/p3bJh2qxxSUTKm2G8/2YqPHyx+9ogdTR4qrK/w+PVoQMzYhhZTjZxhSttxiT3ENAW5lWN8d4Qh7noe/9/thODw0hST/7cWg0do5VH81lsGHTvwfYY4ZWwOrCHFFC1r7KXG48s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786494189; c=relaxed/simple;
	bh=Kx0mEm5X0QVHJI5AbZIOT9Q+Dib7c7rN++VnaJlyeIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpD1a41oCrSai4KGHImfUG7HouGzTwBoSTksQNSLYT6nC9adjxEX0J46snWx5Fk5f9c2ZTblrGP1v3V3ILB0MkjSfkXN+wpGmgfsw7v7Tm333jYrvfNDF/1Y4k8RE0aVlRc3+xQsItoOAJ919w6tP5A7C6yyIW2wMRuek1ZfEvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqUWjnDO; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqUWjnDO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d01548ac96so935115ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 17:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786494181; cv=none;
        d=google.com; s=arc-20260327;
        b=BgF4bYZ7b32O+h9O5a0nLGFyu4Qa1ITTZH060nMwvuc1m/fIYYPFFlkCiiQbuNmaPm
         c7GCy9chaawtjemTM8n//1QlSwO42pfEypOGp9MBJM5j/0OHNPxbmf0Dg6buUV4kZIs6
         Vpsq4VufBgsixusL8TPbyhjuVOqoDdTIVhyljnm7ieRN/8yZcTsXn4I6vOujBCnn1aUf
         RrSX3Y3uNDft68lrwjh0SjhoFCNc/go/bJGqcTzf7azOtr/RCgCbuT3pRVc1kGmHcgpx
         GfxiMJxWDCve7WTlyMM8sB2ZTHW+W/jBuxz2MRqYnYQ5sEw3g/HQu2EJ7CXuUMfdm/cC
         /Flw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/HRvFMhuOk+3VI08vIpvJQGbNRD3IvCKhZ5TbbOGdyM=;
        fh=UPBNJMT5wkX4LXv4gHx3WpRmIAZ/QbYP9qpK1hmmkEQ=;
        b=YXmHK1KJBIVjLh58xwTbEQ0c0aIYDjPgSUylI1RqGeVqjWjYj7zdn1y4y/DZF+P9uQ
         f1Mb4V6awy9waQ82QmP8WWTnCMgmcdd8CScPc9tuOY2UmSZroO3lXGCTHDrIDPvGUqBx
         ys2Kt/igHjRNLZm+Uj5NKhMsa+3K1td7QbG4ZXxrQ8JVUGZB99oVN+Tn31Oktvh7MQ9f
         XqUAxO1IuN5K+z7tWUMKPeHvtP8aw5XXVXas9OJbaquNFtPYPSfFnhFOjCFtucS0ZP7g
         rOoHqO8Cw+AgU3G5haHr+UEj5XmT/JkPvCPtzBxaW+z4rvAwJgyDhjJTyCa2ZFqbVKan
         KOwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786494181; x=1787098981; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/HRvFMhuOk+3VI08vIpvJQGbNRD3IvCKhZ5TbbOGdyM=;
        b=jqUWjnDOHe3uUph+aMyltH2A/h/HkFaSz8BBbEzt4gtrjIqiYxTv+31FerMsdrNB3U
         jexBPijXV0LKq0FFJXtsH+4omdqPU5eiNZTC0SNBieMmjRPz9FzbGtxHh0KfHUuQuuDo
         Ktv+gf1tHeThy1G69/4QWmtaqFN1fVTxeVvTaTWdqnPpGXVd7xDNOpA4mlsikiXj0qYM
         Grg4bNZNsmiDATCCsFA012oHeWxGl0tD9qIwM02mAa3ETQz+Oz8u8wo47anS5GYo7xi1
         nmfacrQVObyVaujf0lEWRecbffc6E5gKaygxOYMKqBVd7uB+CHuW1Z/MCOHp4Wji8rjw
         O2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786494181; x=1787098981;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/HRvFMhuOk+3VI08vIpvJQGbNRD3IvCKhZ5TbbOGdyM=;
        b=lIyyLIysvO3w2OPrEV0G7lF91gsHRmL8UI8KdNDlFUuYYQb33C+DQchP9roUCUN0Ls
         IIKLnzgJw44kc49it+TAqV98vZaI2As+ruIEjcHYYusA3uBBjLj064hR+HcJcyOI7ssz
         WHwRHMNfw9cgkyFHV8anp4Pk7JcmGp2Ik9Evz4GqSIzgO/Vahdraz1sQGcZdpUptteYv
         7O+VbKIwOFCcYCqJVE7gDWijknn2ordbkAX6aXFpw93J4L8zrFLvrHpP7AiFb7fwCWn7
         ZJv1mlubz6Ma+urXDVTyw4RLjN8qzxu5EUcC/RECHuZgR/VlGH20XwlhfEOV8oOeOgKm
         8f6A==
X-Forwarded-Encrypted: i=1; AHgh+Rpf5cNlSL625mQM1kqY/5eFISfjRRxdGWjZh51ur+QRRG7VZBG710cje9EnzS5ZdCWd/UVCQoS4xXNAIvs0cuEnVq8PWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YykK0rLmODOTlkk+JyE7Z/y1NOEXI1sZE7B6Od15/TuTf01qiMu
	hFPugheF8uyP5TWVQvoTt0D6AqftmSph7z0m91eaRO/UCazqp6n+JKvoE1m58xcvcMl9jKj4Ycg
	Esk5T3JUBJdiJXdEr71iLoRfUmtFVrdY=
X-Gm-Gg: AR+sD11roW4jzfCiC+SRL69pmAlUASVnjjAsXa6Iiv69XyBmvGjOy4f28d4RlnxFMnS
	KQCwp/JgjwxNFNgK1Gk2jCfiuo4TdveENYMIKjxfoBNvpwyc04r7MHfd0OlBh9hAhztQsAuEeM1
	tyDsU7jjSkPIZ0GRJvOsByFqCKlkbhVwxB5Rdg88CN6m7K/c64vpsluWq4M9B6qv0Bc6kykjssg
	MOzzTK6RL+9YYGz6OJZkFYA10F/wGAkJHiRqS0uJNB5RoZC9Doy5cTe8rMEGvSvdopEv65ZxthN
	Nf4GQ82CLWLl7sX3V14r64WSBFWhATjriU/Q4FoAoeI=
X-Received: by 2002:a05:6a00:929a:b0:84e:d541:6402 with SMTP id
 d2e1a72fcca58-84fb549e66fmr759614b3a.2.1786494180585; Tue, 11 Aug 2026
 17:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
 <20260808090026.34187-2-adinata.softwareengineer@gmail.com> <20260810010943.014d8db1@jic23-huawei>
In-Reply-To: <20260810010943.014d8db1@jic23-huawei>
From: Adinata Tan <adinatatan99@gmail.com>
Date: Wed, 12 Aug 2026 08:22:48 +0800
X-Gm-Features: AUfX_mwrrryz6I5WKRMN5uOXhp8xlN4BudeZxWVyCRL38f_V_T8YeYoNNAN7wn8
Message-ID: <CAG442=sRDMfdVZB5GY+f6Wud7Vx8xR3ORN0GWVRVV8NKLVX29Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] iio: humidity: hts221: report available values via read_avail()
To: Jonathan Cameron <jic23@kernel.org>
Cc: lorenzo@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thanks for the feedback. I have checked with what Sachiko is saying is correct.
The custom attribute was in_humidity_oversampling_ratio_available while
the current on is in_humidityrelative_oversampling_ratio_available because in
industrial_core.c only has [IIO_HUMIDITYRELATIVE] = "humidityrelative".

For this humidity case in particular, would it be better to keep the legacy
implementation while adding the new read_avail()?

The other case declaration will remain changed.

> > Replace the custom oversampling_ratio_available sysfs attributes with
> > the standard IIO read_avail() callback. This lets the IIO core create
> > and format *_available attributes and exposes the lists to
> > in-kernel consumers.
>
> Sashiko points out that there is an ABI change in here as oddly
> the driver uses
> in_humidity_oversampling_ratio_available rather than
> in_humidityrelative_oversampling_ratio_available
>
> Which makes this an ABI fix.  Therefore this should have a fixes
> tag and be moved to the start of the set.  Please check that logic
> though as maybe I'm missing something.
