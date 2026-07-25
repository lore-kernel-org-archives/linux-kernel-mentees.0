Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF0734B1AD
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 25 Jul 2026 08:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784966451; cv=pass; b=m5g5pvwiA/bWu76F6IA3VkmRoDjbPdYx/6XUecYgz8wnRGU1nrD8UrYF9oAoDQdXSB82zunSrxzVdk70bTYvahNx1EhTgOMGa4qdY6Se3tgvxDHaL2hAHk44gCeXr/jhavpksuP4YCz5/Y7Uz83dNRNBsSo69W5H3s2e0osLAO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784966451; c=relaxed/simple;
	bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1pDhwg5aWLqBmZJkatWF+9BxLytEXIKJogUozrDx3npSlfVNY14ts5fOlyXGzo2G0K868qLYEjjbf0apah0CyHYWvsL1TnjKz/4/AzOnBgSRjIiyJ1SKZVn9lfmKL6MuEoR0LYZ6O0mpzfCRrZA6a4ckL3j0paTauqlAi78kU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4CRQrjy; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4CRQrjy"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e57a753f9so109189185a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 25 Jul 2026 01:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784966449; cv=none;
        d=google.com; s=arc-20260327;
        b=r11hPOFvI/Tj427uROX6uriMLniGxzYL42W/SqKQ8dPlQXeynbvfsnBxO2jxH7vRSs
         uYJbXF59S188pRG4GzyPb1Ou1Gu5rLsY4HQXS0ab3DjLycu2aKsbqHrdT9YxOQlxtjz0
         BKjKvGuggiDJTUYakLK966QNZfaFLeb5gckHBoYdOSugQHq5XxXdCmWJusx0oCMM2bgT
         PXCTtXc/0GDcBXDz6llCbGbnXGJ2C8sI/9zjO3+DUdKcn8U/2vJl5McB4kOZR/KwY3M7
         2AfBTqTcUtZ2Q1x2cGz9sOASoDXrlUq59H4HgNUOqtwI7lfK5N81bO7VMEURYeDg1zWt
         Av8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
        fh=5QCNMB2ij1HStQn8+JpDGSbNzTXK7cxQJq5PeCu5s0I=;
        b=Jqd6hcR51Jq2i8kDneV476JvEMWxPB5OgDyu7XHij2FQqQzFnPC08cogwByjGOau0J
         evuFXdPf20fLtfuVu4jDO3WUv0jF3+RHCJygxY6l/On3a4ZO6+gUeyH8m1sxS1Uh2w6I
         ND9314th6waVxdas5y/aDkB3H/Ej1r3DJ9DrfJicXLIYHK66JlMTA6sRPpDS+H3a3RZU
         fqR196KHER1BR7W/tR6DTj8RTMiHueC/cqfcg9+eAHQtYpH83WFF/Hf3NHM5E65Qk73p
         Qs53PXhhE8Ki+JgQ//hPIvihoHCFM7cIEKrHetzO46DgqiM76r1BDYIpth8JNKol77sD
         IwnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784966449; x=1785571249; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
        b=Z4CRQrjyLKFIbhO3S5rMnTCIHPh8sYGc3RvmW2i8o3H2wBXHDPFOAOmL1fF7ld9R+t
         oHzgqdydX4luRhbVgoOuTFJG9+i3znhIw+56ySYU5NDyTDGp38nR7vATZs2L+RTHRkT7
         Oe5aYwrNQBTUpD1W9kUeIH2JmG/vHoDdfRj+1gxq2hqpisMtuVRq4NCM8r0TFZ7yS/a3
         m7hDBBsgD6zwN/TakS8hvkHK5I7k+0O/5TFByMmxZYiVCL0glVM3xB3XRQ37X3h/ZP6h
         lVcl2Q4Bm+sq50rWL30FL4WfWP+3G7svJf/qHcwNOQh6BwQa5Ba0HwLmpMJLfPGjuEgn
         emHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784966449; x=1785571249;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
        b=PERaJ0r7arUbQOnl5JzFWcmxFXjGNT2wftBpIzWN0pM51i9Q3EZnnc9LqPNZBC5dA3
         zaWs0EdLLkBmqK6UYJM7MFBcZctQL7T9d2R78UYp798x7ae2A/1ocoU96HZFtc4vOMmv
         S9Zg9kn/6YH+sw6I3puQ/2/o7m8T7PdC11w5JTL8+wpRZyUdFTGfa124J7z2+Vn+3l4/
         VRPx67NPWCz6yZlT4xQYYyuTHucX+FKQAKOf/6a93F5Z6n3kQxOxqG9fNJ631qjELrgJ
         2It+oocW6akUKPLvCVPFq8C9xxi/pTucbag91+aIlC5QclB+Lr2s/FlpV0SnvZmkqpvB
         ptow==
X-Forwarded-Encrypted: i=1; AHgh+RoLkEFfsZxBBVAFMefnWPDjijtimf3iVcIfdB56fsS/wIGLhM2ktaT9jl11Ss/oOL5VQwYYGDZvTqpwkufl3lWIvLHALg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZIRFX1uvdi+0lNSLc9/4t3/rJmfDWeYoU2LrWmL4inwbqau+m
	0qeuJ9MDl0UdI/+yTD4uJ9nmQTtPTPq1Huvh2oyKH/FbeuMZtVyIkA/e+bzq8RbL9KqejKUnwkw
	W8qxnhWgtVG7XTIJZQyDoUGA9MVBgjOc=
X-Gm-Gg: AR+sD11BVdm3Lq8cNPLo+XK1UHdLSHigx4upUMgW4zaypvqp9hHrVBvS/8G2s2v5C5n
	TiA/WXLM4UEriBT7sIigEexO4yabDFmUA6HwIC5LELJVImk703GGTH/4CiW3Xy/UyaQjbdYNST0
	BF9dTIpkDEq3GUreAzVNnMzIqC4gIWKRNiCJE7GpLicVnwYK0RIDEmff+2r/xCaUvSic6YgHyRW
	lQDAQ/k7Ei0wUsn5s0dAPNlv19xRmOqDgt/Zu4Rokwo/BPLaksJbsQ8XzCOTU+MiygaPqX4phvq
	eTTC99wtG6myVtw22Jyv5/Vtr+BPcLrLqLl103odehmymlEXnOR4AvUckSboRf8=
X-Received: by 2002:a05:620a:2681:b0:930:dd19:11ba with SMTP id
 af79cd13be357-932df6f0f30mr100360085a.92.1784966449572; Sat, 25 Jul 2026
 01:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724111548.2109-1-tharitt97@gmail.com> <amOO86K_3wuTd_92@lizhi-Precision-Tower-5810>
In-Reply-To: <amOO86K_3wuTd_92@lizhi-Precision-Tower-5810>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Sat, 25 Jul 2026 15:00:37 +0700
X-Gm-Features: AUfX_mzCV0IN9fI_10kkKdi3HsilTau4VYjXeApWLMbv2AYQ88l9nYF0tHwG8Pk
Message-ID: <CACak8wNJsmVKm3m+JwYPSxqfa26MVFRo3jE3YrppJPi5SBBAUg@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: release runtime resources when device_run fails
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> Mix use runtime pm and clock is not good.
>
> You can put clk_bulk_enable() into runtime pm resume call back
> and clk_bulk_disable() into runtime pm suspend call back.
>
> Frank

Hi Frank,

Thanks for the suggestion. I will inspect the hantro pm_runtime call
sites and let me implement your suggestion into v3.

Best,
Tharit
