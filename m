Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961A6313529
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764179199; cv=none; b=J7HH2rJ1hwpELOiBL+5sllgmBkh8J6eZ2YqOrjuO4ByWou0hNzISRDM8jvA8QmYtPsApjSNolLIMOmIms2RaqU1nyN7M6wnd1/xmoaUZ4/aGHRyX1KQjJ/ucJu/LL+qk4Nic/uObcJragnk0HRhexMebYy0dOobjA4dtxoNlb/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764179199; c=relaxed/simple;
	bh=Am+osK7vayhOko5hQTbEIu04oq+zoOyklk3hpxkh/08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPopczr16gi2A7Y5ZTqzKifRpT/0SMINHy/HXYKx1ThK0/ujLoA+jKM5/ioN22OR1oTuPqrZY8o6kY8WgP+y3rKG/3/Xal2+RSoL4R23iL0wR5EXUx4BpOFnPcg1A1cr9jltIVG+CNTvMqVJIOUkf/Jo9Z/gGpQWP7NRUeRupxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuO7HanN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuO7HanN"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7ba92341f83so9945277b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 09:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764179197; x=1764783997; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssuEpobEWlhQQAerzIq0kI7Vt1bdlYPe67OtsIpvbek=;
        b=SuO7HanNoLkJr1vAuY0DIgzKZpQ0CfKnpmcLZ0KqUEX5GYYUWmuwOTY5LcCyRa7IKj
         D/Djm4lckH1gkw/wY1Yw23Up2PuG18H0yYIUoYvN94i3NwtkRsBzBOFuGEWFpmsSN2Hb
         7ZwH7CAijcp3H471N1k6838cZVHQgjkycfLPnkFdjXOQH7+beUKAZIuOWCTgnPez0DsM
         /Tlwi2J51mjm7MZADtyXElvCItRGdKbyg0jgEkUT2IdylbQ7c00E+WLMtjrdGSFIu/XZ
         filhSMy9WgbmGPxLAadjiwM2xWOKGk6NYaDwrQhSYr8A2hucob2s8U+8ahk9dsV72IaM
         XCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764179197; x=1764783997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssuEpobEWlhQQAerzIq0kI7Vt1bdlYPe67OtsIpvbek=;
        b=PN0cqoCkH7SpUUQvLznLMfkMj9pYi/MDTWp/gKk+HCR488oOn/3sBlbC3woEciVyOj
         3cnsI9mUD4euSxfUofCj9ZdNilN/XdRaNCQ2WcxlFKIaRux31OdYkw74Jjp78ce05SJL
         UiVYG3HojhQwaGj2DWslFCzbVcTbsHSg7SI2xOT6b2iUQIJWmb6NNNF3ai5WZ+/tJIBk
         jx/bOb+JMwuXlIunpTlS2QcO8orgxa/+KyxMvX35z9S7fLG6hO5xifRdMWUmNQfGp+Kl
         csxFLrBnyxKw/2bIfRAWpGzQejghW0rx0NPlUtpcDyqBdEfTe1rxuJSTDP78mR1cIucK
         eo0g==
X-Forwarded-Encrypted: i=1; AJvYcCUZhTZaYh6QPv2vKvOtLn3Yysx6P5ejrMCE73O0L5n4PzogQdtBgu1HlL4zq5SCeBJcu3lsDWiP9+rhSpLeGBwBowt2Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+0WfNpHxDYWlbE/JuS4jzUkTPT7Eb5SwunWhAoKXqrGkQeFVm
	dBFmCOAVK10DyenYyGRahNz0EHJ3+FPXRldiYHkIwhyod1IvLaXLzrow
X-Gm-Gg: ASbGncvBWEl1hC5FBJPNuYBgPsU3M3SfTo9ZAhb2VgTAImSW3NLuR9PWTWKtP2d62Xo
	xAfDgc18h/FMY7lf9bcfk3qqYPMNiRyGsu3HWrHZbKcW7XGILIXp1FNJaeUIJu975Zv2Rg61u2w
	ILGV9DjFiFjy+3s61Pg9D5klXN1oPGLQfsZpbm1RxVJVgdmgvfxkYDf5uH0l+/E/ET4z7sMLyDJ
	UqQzFJPYmq53Ey/mSn70I1iEdmbVpivzzIssicZNOANBma9WY31xxYGE8YTkGyp4zEB1NsZZxmT
	g6sh4CR3veMhhD0O5utkbXPoKzzA3xiVOmwi9DxK2Ll+PWQW2fzTZykBkTkxwZEu7GZ/Ehl+P4+
	QqAobBNvIR5rvQfqKT4Ksyh5OYvpM1OKBHJH02rxZJLijORkYXOsmotdikWNRSQh0t5P83WYFhv
	C6fMs=
X-Google-Smtp-Source: AGHT+IGVmmEGqnMT/AUh6Nucf4OUy8xYPKuRcAkg4DrSYqB9z9GxZOOKvBLoKzrqr9xxyCnllV5M5Q==
X-Received: by 2002:a05:6a00:4b4d:b0:7a2:7a93:f8c9 with SMTP id d2e1a72fcca58-7ca89a6c1d3mr7478347b3a.27.1764179196837;
        Wed, 26 Nov 2025 09:46:36 -0800 (PST)
Received: from essd ([49.37.219.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f024b7d2sm21669323b3a.40.2025.11.26.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:46:35 -0800 (PST)
Date: Wed, 26 Nov 2025 23:16:28 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: ssrane_b23@ee.vjti.ac.in
Cc: Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com, khalid@kernel.org, 
	syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] media: radio-keene: fix memory leak in error path
Message-ID: <tm5swq4u2t4lkvbk7b6qt3mstecmvypspbbbjir6pyha7ao52w@7g2ychpstnv6>
References: <20251126063000.28493-1-ssranevjti@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126063000.28493-1-ssranevjti@gmail.com>

On Wed, Nov 26, 2025 at 12:00:00PM +0530, ssrane_b23@ee.vjti.ac.in wrote:
> Fix a memory leak in usb_keene_probe() when v4l2_device_register()
> fails. The v4l2 control handler was initialized and controls were
> added, but if v4l2_device_register() failed, the handler was never
> freed, leaking the allocated memory for the handler buckets and
> control structures.
> 
> Consolidate the error handling by adding an err_hdl label that
> ensures v4l2_ctrl_handler_free() is called for all error paths
> after the handler is initialized.
> 
> ---
> v2:
>   - Simplified fix: call v4l2_ctrl_handler_free() inline before goto
>     instead of adding a new error label, avoiding unused label warning
>     reported by Media CI.

v4l2_ctrl_handler_free() has to be called in the last error path also
(the one after the v4l2_device_register() call).

Your v1 patch was correct and also better because it avoided repeated
calls to v4l2_ctrl_handler_free() in different error paths.

To fix the unused label warning just use err_v4l2 itself instead of
introducing err_hdl, because both error path that goes to err_v4l2
needs to call v4l2_ctrl_handler_free() to fix the memory leak.

Regards,
Nihaal
