Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF393A6B8D
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Jul 2026 05:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785304778; cv=pass; b=isT9odKG0SUmlOFSqiprOcxS5XdbE2txQYCNwGm5rn619ZmjEq6dXsfTKeHQI7p97M1G3hqNUex/ut0Bn4SYR51dhp3M/3pYoVWH8Nai1jdCvhLhAq2VYVzSL15BifitCq1ukdQbrXQoADg3ggGWrpe6sSiQZen+vDqeH6qUpss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785304778; c=relaxed/simple;
	bh=zhXBz4WAC575BvE7Vbqo971rsQ7lB6pJ8jeY23ztt2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEvJh7SStxm4fVRP1oStC3m9bWXvMnXZtOCZIh33PFqH/VsRMTDcKFMzkic+lvl1BeSrNQMFyshJsv/4XZuXY2WySDomZMslGJjILXalXi13ygetpsS2842oFEEy2riYZorWbDYjtBie5/EcXXc0Al0h77g7n6VVtkMA70G8dL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/wLDT93; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/wLDT93"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92edb12cdf2so43889685a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 22:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785304776; cv=none;
        d=google.com; s=arc-20260327;
        b=GXy0GvEdLdMtINF0TeFQ7Jo7zwVmnNWVZ3z2j+mmoCBDxdM5WwMYZxUHE4M9GpPw8e
         9pxQqx+F2u4Un01IHMqhYLmmYfs2Ww8fuCyJqjs4GroBcLpVFilhbsTtyKNiVm8RT+AI
         US/GODL3l24oTVw/dL8eB7T231lwm46FRRRqwsovA5Hn2kGtjqNFkH9AmVwzfTIwo9WM
         xnY2pSEa3wnSh0ZIZ0YC84WFIdMBCKsLumJmOivFsZGMBvAok+YuH8XhQpGLoX6lbQdY
         Ubr2KvaL2Bd4fqSeQ4HF0VvbN4hg3CodBWUOtP72zCWwlnXjHhSIT4+1x2vUzcDn9iGR
         CqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zhXBz4WAC575BvE7Vbqo971rsQ7lB6pJ8jeY23ztt2M=;
        fh=hWU5xasaZxgIA7I1LLF9IaXWMT5Phzatv4VZQ9LrAac=;
        b=rsiJzdV55KSC3mufLnPYYQ8UjUVl+l3PAAfBjCzMtRchVQeq52s8dR+qeYKbJZZZ8Z
         2Yz2xlzm2raxIRZYQV4n9Tv2rSauKMOcNDwpvjm3hkCLBvo7gBxr1apMEHTwOfvT8zwI
         fpyJCoqCazwmaF1P9m0UZZUvB+eq80Diw8NkayCUtC2EfTQKrooe8WtMeCRQ2Q/gfHlk
         mvmcBieQ8Xcz062npSb3B8QPKMZWSAnKX40bZbEctJD61p0CTlkTxC+raFJumPkZZLKy
         r8uU/o5R8zW6zeCDAo0VwDNPiQfxXvufjZ+UlfXWuUcMH+lG5e8/W14+n1CCYzvDS7e+
         BNWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785304776; x=1785909576; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhXBz4WAC575BvE7Vbqo971rsQ7lB6pJ8jeY23ztt2M=;
        b=F/wLDT93qKV/xmBVGPrmZxYfmhcVKYW2vckuc2Kf74MeBwklYiwhd4L/I+9ib6kdEk
         ETM0e/q1fvgQ6BQSwjGAemi92+1dAP+HFy310b3m+1bNGyDI0kO3+8qukgbF3y+4FYz5
         /HiStZ6XQb+XpGz7xfMjXkLrOPlH/iniaPjT6ZoDjzAysld70D/V30n2Iw/4FxikYrSJ
         S916oM4U1Fb5HLhzVO0JdywffKdlWnvUMXfTmxzxBw6ipoE1nfrpBkR/vzIxzlVFT4qi
         X8e1ZA1TXiN0cPdVdewNGdlZa6bnm5WbZLiUmr9ew6FEpGKWZoHKzAdWlalhUNgTscGB
         r92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785304776; x=1785909576;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zhXBz4WAC575BvE7Vbqo971rsQ7lB6pJ8jeY23ztt2M=;
        b=CWcDYpKnzq6RKJ8PWVCuUC5ljyyMKBGUXx4hzNqC3sOUOt70JSmg1JJ20UFQ7R80Bt
         zHubSBVvsCqVtV6RQJcJyNsf4d3/yMntZz5iswoB1CXoRQ4dXXDcFJtcJ5FI0GPSqCCv
         VHEyPC//IBicuuPq9wFl5/ovrpYiC/A3QIQHbdq5EnNMcWBqoKzz33Ta3UfUtkRElYzX
         hVhEGhCVLnrvIQTqWRCk0eRjJgJa/x+8bnhIntaKinopj5Ze/ScEe6j3uY+srmqN+21b
         /aFPbzdaoEkk+pR38ktHRDsZvSt9o3Bd+13jVlW/VTgetCjLqqlFSxjBHQ47WGMIKHp1
         HHJw==
X-Forwarded-Encrypted: i=1; AHgh+RrydCsjwyoQT0FDKv6rli/7pACN+MC51BS8xhzY4n7zmG5cqeM82v8muSaMihnBAxxx09KW09GfUHdc8d1ZblCUrLknJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1HXyIg+xyC+GISpRNQr3EHLCM6xFZoGON7JAxbyu1gPoOi5gO
	TzmJ9IpSCguiWIfCND281U4d9gL4PuABU0C8lwJjMH8Fo7yxWJY4v7iocAqkERL2Bu69Kkmta/D
	/RYwZcaVQZc5BFTxAH/NF2qolI1Dvk7U=
X-Gm-Gg: AR+sD12q3vfTQvgeOccPl0HQqUuJi6X1KnSgG1DptFH94M2E7JGjLySkbXXCqbCwnqM
	4b8l9t68Gif5N76V3oc+8/0UcaSev98zCRMk5rKvg1HJHhi/GCMb3j6QEaifZk8LRcV5j1gO0Fc
	djRyLOIZN8b7ms9IoY+Nfw2puVOnsYkksdkLIhIzruCC7VRWEh4HWc1pgUj+rOUAXDH04wupt7S
	CfN6lOpjxWXvMtxovg+wwMJZ2+qyQ/GcyqGGt0XIgkIquKPlps64j5byS6qNL6QMxt6NvNGqpWd
	4y1ldPa4r1SjBZohDx/0OahzVX+V+JKQHEK+a2Qsx0DHrjtZ9UVnTqlvdgkn9+AY7/Xx6DRAEdM
	CLSpgUFrkXJkDerM/edLMKA5JqDYJq+FRh7CK
X-Received: by 2002:a05:620a:3727:b0:932:de52:319e with SMTP id
 af79cd13be357-9330266599fmr539914385a.23.1785304776005; Tue, 28 Jul 2026
 22:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724131208.2315-1-tharitt97@gmail.com> <20260726024243.730-1-tharitt97@gmail.com>
 <amjQafSHo5cjCTnW@SMW015318>
In-Reply-To: <amjQafSHo5cjCTnW@SMW015318>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Wed, 29 Jul 2026 12:59:23 +0700
X-Gm-Features: AUfX_mxSFTIscdoxIwMB9WODihAf5JMiVEABEJSCWkuwnn3lbw2GW_-l9aNNhSk
Message-ID: <CACak8wPrYOmHKCBP2R7udaFyx0mW1z3f_A9ivaGb5ATNgqujhQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: hantro: release runtime resources when
 device_run fails
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> You need sperate patch to remove this. simple remove this here may cause
> build error or warning at NO CONFIG_PM config
>
> I suggest use following patch do below thing
>
> 1. Remove CONFIG_PM
>
> 2. Use DEFINE_RUNTIME_DEV_PM_OP()
>
> 3, Need update
>
> .pm = pm_ptr(&hantro_pm_ops),
>
> Frank

Thanks for the suggestion and the patience walking me through. I will
send the v5 series as suggested.

Best,
Tharit
