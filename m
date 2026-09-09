Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943535C6BF
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  9 Sep 2026 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941820; cv=pass; b=DqsZhre02Rn6BO7N6K9IZaJk4Bqt7l3N4P/Sd82yKArCPU/H0CXFHt7id92wW/hfW5+7ZcFDK0GgHhI+J7JL884XLKfHIsrDVfCbcA8EC6B4UHGFvSezGeO0eBuz5YpJdxWZmli0+/6x/nW6Z/GfTsZqJCjBWoMjwAyZKLp+SLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941820; c=relaxed/simple;
	bh=RL/+hNFUOj4KbQxDutCqWOoq2PWgaMgLTb8N05pdrrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APAkk4DIWx4BKjt1q/52wLTQX7Sja/ROl8ptuelBB6mhysNsLx0ItFXWEpFcNparOUlzbWBz6yxVlAbQJWY6WVNWm+L6huheOE8gXITMUmEHqTlYbLSX8IukTNmfvhNYMKVQNPbLsKjOgawp8/T08kJ+dmXkZaFwiV22gO3b+/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSHq6FTz; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSHq6FTz"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4650773fa99so2401403fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 09 Sep 2026 01:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788941818; cv=none;
        d=google.com; s=arc-20260327;
        b=H+4sQru0/o7iFvTtr0zy2gynFtDxZXmNfjwdHMzy5nR1ZNqLGfg78fZrmf0ncqELAw
         RXjFt/AmIFikuZ29mhV2PILWDcooEN+cD/SJXiZ15zoSH1xF+2KUJbcPu1RPWOWjISrU
         9eOyim8UdgOU4WTYreA3AzUxzWnVq9FuryDY0rfKrSOoeUWug2tXBRyo0iRoEmkgtRQK
         w/siSvtD7sGtKXm6y2j+MAQQMSyWGyeRwBENfje84IzAmxLbpxK4bcmMOZ3OvO+sMVP1
         MvR7mCtieUQGd/gQ6InThRBQh4qSEutYBkVp1cwXn7oe53VS1kZjki00OehvWujSiamn
         YWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q+AMEHPfgfNjqHmUbcG8IHBJQwLJWm0A6vsCsHD9A7Q=;
        fh=Aq+AaQ9iEUWVAugv4K7Mq6+aBOjo2VNACIi/f+Sb9+Q=;
        b=Uhmg9Y27CJhjyQ9PtqeE6TKNgUq5ZwC6YVQKxS6ABVf15rimg6o6pddTlzCqr3JstT
         M0lUFj3Ak0j1fbI0C/zwoLAm9GvmODvoVWyCDctPHyjw0P+X3TEkfeLJkM5YzVmRTwEj
         BKiM4baY3n3z38cl4sPCL0RnDQ/SCnfNRkUfio9iMKhIpdAsuISNW+yiiYbGgigf+KU/
         dX7BMAwmNlX/KMLFyqV1PzNCZK59omg8nWq6bKn5cy5NPqPg7wJBJxzYvrgJfjtFASQr
         LLPrOyHKikF1aqGbB0TyrIZAaOgS4XGXqIDnjQrxAWQ/zejYoJbtJHxpiuQb7jMUgVo5
         YbEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941818; x=1789546618; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+AMEHPfgfNjqHmUbcG8IHBJQwLJWm0A6vsCsHD9A7Q=;
        b=iSHq6FTz45fJsRY/RL5uLRofPHxYlNy7GgCWFK8X2MjtQm8iLoTlGUujFv+d0dhTCt
         ikj0oEGTKYEQIxJvdXrvNA+Lia071XMPtEB1Jh3f6coVSG3NioXX8HZo3y9+YdM0jK/L
         We0ghc/YZZyDN5jC2gML+D/js0H2uuY31dFkCWoftLuKBxtTcWM5z+fzkdylqmUtNFpy
         aFHVa/f0N+/x2KAd1qIJ0/ZQUx7TfDgBzn6AjramkWMX97+aSZMly9AN/rbWWFBba4Uc
         Y+XG1PkkyFBfEK3NpnUvE0jiJUF2qN/mbekI24jTJx9ulYnDSzT1MPMQ7J5q75BJp9CT
         PcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941818; x=1789546618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+AMEHPfgfNjqHmUbcG8IHBJQwLJWm0A6vsCsHD9A7Q=;
        b=pB02DwUbOG4bMCaBU5liYvuyc5KmMzb0Wh92jvxhWzERW4+k9quj2lpAMcz06FBnfT
         JZAM5EMTjiX3gxhaWYgqlsdCpCDT7sS+Bvhthqrg8EVb9pW9VuRnA+iP2+IjeBNfRaIg
         Rqxs3aE5gEzzqF52DiM3ilfH+2e8tVp6OxCBMFiDK492jdUDoWug3J7wWfTHiQf9ETL5
         FMnYklmWdSk74R4wTDAZ2py8H/CSMOpb0Osh7iGJgsTvDzDFlIkH1YdNBFzeDzlJl/6G
         VAzyNvQ0rzCVBq0TakN9J/fGH3EIIaHNTdF5XdoTSHYoyyG6rFV4J+VzfaOXIgj9swDQ
         z1UA==
X-Forwarded-Encrypted: i=1; AKwUvBz7Jb3hqm/rlueS7qtckVx6Lk5vLUm6VnKAQm34MsTrKQd7SNFRXJlhS1Avm2kBwhz0RKlcc7KKZZOPvZmv21SvZ4WWvg==@lists.linux.dev
X-Gm-Message-State: AFuF++naTq1JCuWFEOBi1yknUthqgKuaM4rGDdPUdD7LMWvsArhEN/IY
	HSxDaVmGXlXwUvSytddqPDtnAtPJxkGQRRFBq+SzPlOQyMX2LvE2DwykRtP5HKLtmmx8yFi61u+
	bIJE13OYzhV0mjyS00bwOUgY67wgtCWE=
X-Gm-Gg: AYBFou0kQGQ67/7fEtusiXZdHGfPe0+tYv8JggMqflU+IsOHPgH/go7cxLBCxnjlGOe
	7/SFbl3k7wl7gNBvukOcCZTLKyUQEODDXyFtO1E3vOTLrkl1P8Dn1i8gBo3BY44sGs2Lo4vcdtg
	i3n9eGcthNeVmgOz3qZHdvpLv9YVg3Dzunf0/TbhXD9jV/eSYwVOwU3eWr8DfpjCWUx9EqM18Hl
	rKErPx9UnpHfdcmuNfgX0Mcg/0WBrolezS9lQUi1ao9CZpLQhLuUZV7U6UicXO2y47Q0OFBazmf
	nxjBlEOAfcYWlD6YDgA5m9x+CzDF4auz1bQVFOk2d/bdnZa2dkhcsA==
X-Received: by 2002:a05:687c:418e:20b0:456:bebb:a894 with SMTP id
 586e51a60fabf-47801f0fcfcmr13266895fac.8.1788941817673; Wed, 09 Sep 2026
 01:16:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828150227.1062217-1-khurana.ridham222@gmail.com>
In-Reply-To: <20260828150227.1062217-1-khurana.ridham222@gmail.com>
From: Ridham Khurana <khurana.ridham222@gmail.com>
Date: Wed, 9 Sep 2026 13:46:46 +0530
X-Gm-Features: AcwNN1WCK5pqFslicnAE2Tiwfm5AldxOvhq7qzmoOZmdii5H4B6WhszyAfNnHIA
Message-ID: <CAOu+XQJjYeeRUc+9rj1ckLQ6+UcEtFJzM9Pv_8-v8t+_qbKVVQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7915: validate default EEPROM firmware size
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Brigham Campbell <me@brighamcampbell.com>, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I sent this patch on 2026-08-28, during the 7.3 merge window, so it may
well have got lost in the noise.

Do you have any feedback for me?  Is there anything I should change, or
would you prefer a v2 rebased on the current tree?

Thanks,
Ridham Khurana
