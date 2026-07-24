Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E91B18DB2A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Jul 2026 01:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784858209; cv=pass; b=YU7+idCORdUBg7Kfg/l3bGJ27F3l4f1Vl4zJjWId349v6iFdTIEJ1P588AMXPBLeZmoAQQKEDVg6MVeBplolJ5zd3OUCUFaY0QRn6UvweixKjoYv0eSlEfLob/11T//ptRNp0ZOHYp1+GgufacU4Pjm+kZlkdslC/7uAmi6vuXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784858209; c=relaxed/simple;
	bh=iP84btfrOhWAIb+P8k8wn0gRS7J9zVaBuXHX22GBgQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3BzKN0ZbdP9ElFA0sQA6BD844krUOMhnDreN2kwkM0baEQRCUPabi/bKA+WEQuczQIzz09q0vS33r/6fvyajiX6qckC164vRL2cM3DeeAMwHlGGoKOtYXhYdeE75dt3UesqP8Rc+4G1U20VZ4IbfENk8CfAK6Lh7oO8E7K3NjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPOCWbul; arc=pass smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPOCWbul"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e533aacf2so69075085a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 18:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784858207; cv=none;
        d=google.com; s=arc-20260327;
        b=Vik/vJP66mgUun+buHWIF0hmI1a1lSUQwGByRSEAxCJx0ejJa1WWzpG9XYKv4UmAeE
         xEv8f14nmNufDYxoE+d0+9wPMAZ0asgGe9/dl6nb52YavGr4leCk+SE6o1LHWUgkgOxo
         fa1AZT3YgggP2VFTo3zWahnp6owqe2FO+fyAZnkcEAcfCl5bmjszCCL0Ue2cpiGVqEw4
         Y0g7EuesuyDLmU0/lL3tpP/0rIQZ5Ig9UoAmQ559Qlmjy3/S7Zwdc2UADCl4a4aj25A/
         jUh2D4gJhAQura/n5iBln/4bkjv+drX1ajCyE80qlEz/Fsva1+p6Z2V5kijKrAZeg4zU
         M8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iP84btfrOhWAIb+P8k8wn0gRS7J9zVaBuXHX22GBgQA=;
        fh=oc1XJzqIJlbPA8gcUYiHcczZRevh+9I7v7tIGrSWMCY=;
        b=nrWNwXnlsDbdVAkoOl3muMq7dBRZGjujkVvE+XsYu9mfzyEQfo0E85Bn0+PfFowpN/
         cypD1+NDW3vwSJ0Gb8saiQ25KMkBROCtJ4bX11Bz63EcfFo59kiQhdLQAec8mrRBziBT
         bRQqi5lHg/h3DeWifKgOl/Bp4ABAFNrG3J1BH+8rNNNm0k0mQYDwCBYshCgvMrRbKIkY
         xXMeWGbCwBuPHaYn29bLwI9R02k+V9tXPjJIVmScbKTq/gs8vImU7Yj68gHUgvywQ1qj
         Z1JIsRwyAFbW4YWjA2s2kTaTseB29J8HId+XPQyb5oJyBhpmVYM5nRum1jpVb2imEYsQ
         8gjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784858207; x=1785463007; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP84btfrOhWAIb+P8k8wn0gRS7J9zVaBuXHX22GBgQA=;
        b=VPOCWbulq5rs/QjbZjG4yzJeMuluKcwKehxD4UXx1v1QjZb0p2p4IoKv+rouKaHTfq
         omKpwLvNVGAeJPqJWtC7ZpnKrSbJSgVkrVeMBf0DPtjpzYfWa1Igf/b3o0+JLu04i64z
         wjkr9/MLD+YniJ+EVSGxHOzGBhTbLY4w/WDfFFJUG045eSVO2YuvC6WXRS09UVKdBFit
         Ngtj0tYl91D7qj7ZZCuESiU16BUZ80DE2S8OjU2aS9d7SV8wj7lrMDhk0kLGvxbbvIbn
         tldpKZZKbxi52cp6abBcC7D8xwcCeps9nwS+r7BSU9LnY1LhI/IRNcf5r+H+QFDnS7VN
         4neQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784858207; x=1785463007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iP84btfrOhWAIb+P8k8wn0gRS7J9zVaBuXHX22GBgQA=;
        b=KVMhkmsG8Ot3bAXoxNILw/Ed0gaY0V3rMjaC/20Fd9YqKIbI8QfwlrjkeWFsf2QVnQ
         Trj3qVhehPXpOtU85mdapR+g9OvFmH+ck9Cwy3SBDYesJL7ipgK/Z5vU+O0onmU1jkph
         E+GHCXsaHFKL5+Y2FUJUz2Y4zU6qK5XOnD67RI0yxnV3RXac95Lq46s4T7fIkM8R9pal
         tCTaw7x3AXMDPwmYCLjhiEMV2wqZ8hXm+Ka5mjLaZtNvOpqFu4jnFnXMOkZ+qnGcav3/
         D/v8EbcTBjrQxBBln4iIl3Xn/uOAau3EDzhWDCtEh10gOFmEzho6nQ7yi/zlLjO37qir
         xU2w==
X-Forwarded-Encrypted: i=1; AHgh+RpCHyDZZvcW0WBLKZI0nUJCroVABsF1Fnz+fT38r640MTKcw9iWNgnlRBI33OiJpbxRIczgM0W++jqnQkwPpOVNly2DMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3PvAfSGNzDMmrpVvZJ2ltqTAihjVeu4RR2mYobyIY6ZwJdJxE
	2UiKzfo0IvFE6dEWCyQsiDQxxq3q9OPxTfBGcwg3YDY45rTNIaPvRYwmUXVN7pJQWe69W2qpUQw
	+w7YS+CRY3+fRxCEVJxouM/Vlg+seM50=
X-Gm-Gg: AR+sD13JLsnoH74bK1i1p4p84nv43+IHlQxlfi6DDHR8PTWpS0NsyvTHSd6L/V3iE37
	1vIyHyrYqhqWdahL3VD2Ecm44uMQSeMCbIjD/Z2znmyKExo9iEyO5pPdGT2o2ecUjmslD+SQirg
	EeigT1bQjdBdcB6rz4HFjY009MXBwIOhuD7oOXCvoNzE2/mISUmq+YPidYraYd9m3qTEzOfq172
	+9ZfaZ3x7MxEFE4aL9wUT/hk0Wl86jip9Y+/HcmO5/fn8JqZkClR85rRJzx06QIytZit6y7r0dC
	l2HXYoQhOaLtE8cXS3dlupU+b5zjELg12y1/06gvDlL104qdGDqI
X-Received: by 2002:a05:620a:3704:b0:915:5cbd:1d96 with SMTP id
 af79cd13be357-9310360605fmr579615785a.33.1784858207478; Thu, 23 Jul 2026
 18:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723153656.2167-1-tharitt97@gmail.com> <62e3c0b4-831b-45bb-a7b0-b97be2cb3722@collabora.com>
In-Reply-To: <62e3c0b4-831b-45bb-a7b0-b97be2cb3722@collabora.com>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Fri, 24 Jul 2026 08:56:35 +0700
X-Gm-Features: AUfX_mylVmcRprTv6Y3jwq5H-M0MI4OBIkB2IESI7RL04jZ1Mp4z8XxWhgRJCvQ
Message-ID: <CACak8wPMt9Qp6xSs6AATLRjH3pHgFvvT0xxGHQY3q_WQWNO_BA@mail.gmail.com>
Subject: Re: [PATCH] media: verisilicon: vp9: do not arm watchdog on
 preparation failure
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcamplbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> Nack.
> First it schedules a software timer not an hardware timer, which led after
> timeout to call hantro_job_finish_no_pm() with VB2_BUF_STATE_ERROR parameter.
> We need this call to complete v4l2_m2m job.
>
> If you want to stop the task before the timeout you need to add something like
> hantro_end_prepare_run_with_error() where you do the correct sequence.
>
> Regards,
> Benjamin

Hi Benjamin,

Understood. Thanks for the review and pointing out my misunderstanding.

Best,
Tharit
