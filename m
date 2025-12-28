Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DF723505E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Dec 2025 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766924761; cv=none; b=Hs07saqylVPd6SMuX62EFgVaQQxLDB2o5K3iTozt4tB1T3h2Zr3uwQQjWjkkYr3y6BXiSizLDxmuWEunbrN7oNTlhzaPl8FqM4eLnbK5tMLMqzK+qFX0usbW5jg9bhF4kkNQkxhL4D7zDHW6tGN7v19d9UFvyCK1LK8K3uGrA30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766924761; c=relaxed/simple;
	bh=G4boSPsx+1D6wjYp5milfCokWQ5weUbdbMpukLYySAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YI7kB8RfBUdKnAhhXVEuAKp5HjV+yztY3dxA4H+FUR/a96wSjjl54CVJuvD7OQ1mSxuJUiKsroNijXbN88UzWqr/zUyuObQQO4geyOTwjAKzl4wPn4mWrv7r1bS0rEKG59nxfIEH8otEzU7t4NzpMYODlRBVCj08wOS69vpofuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4SkQOTW; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4SkQOTW"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94130b88642so5691304241.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Dec 2025 04:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766924758; x=1767529558; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+a1v114P45+IznmNMYx8GEEeFQqpPr7hAYNZbfcmeE=;
        b=f4SkQOTWLg+UvCrfkYL89UvmMI2Zn3wNKN84e756BtQB+tyah+7kUZzdlkiqNSHj9a
         CTKmS/HFQ52SzfnJI6gB5lSuB0z/X1ZA1guLh0i7CvDyVRQVDHZ8mXYtSTbeeP4hAGFV
         NRePl3R1ZCoZjul0gplzxcm3RPEh5EzLY6CMI5LDLNW+YUWUbwPQ9MaWlNbwWKE0K/na
         I3Rg19no+eV31B/3RfHhEFyt1Bmqb2InKgwDvMnnMS4XP1qepMfQY0zuJ6K5SSsul9NI
         McPgbwTnQLjdrrkWJKWc4+R5tud8K+4lUrlNxUojeqmYCYKd1Nv5SjTgq1T9Ab7AwBQ8
         5BdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766924758; x=1767529558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+a1v114P45+IznmNMYx8GEEeFQqpPr7hAYNZbfcmeE=;
        b=ZFLWlyGWbvpRDql9bBj5bds4/9Adz7KwitL4HGHOvFIcuT5f8wYPnZ5nCWzd4Zf0qf
         qnN/0x08PTkxIS+vkNCTSipWZUSLI2eYfRn2JuCBV0V6m2wV6vubKp6hgU9H6PI26beE
         BKh9tjzkXMSlyVBrd4yiGxQ0LnWg/LWUoe9YLDucQfz7E8Dju7QiYhBARrkVpn43sdIs
         X8TVn0aJkY/EXoKlTAtTRmOv8q30N1KQNuWypVVaOcCXe1p2QzTDW4/KOrArheSCvSA5
         D68QJIVjwMP3GrzlTEvDRNplvzKSLkMxqLx9L5nH4PwlP3phOvvhzXIa6+uN7xbYn4NW
         M8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy9727z2mjmOvJUWv+7iJQfDo5ap1nMPeC79fndStTF6nQVojd07CNDO/urzP2uHpbvKbbqZcB5nWm3Fy5SAUobJfKsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZrytvlByEkLw6UGLG9PH3kbfPVZMMpmZNzYBe9Am+j4lBi6+W
	AFi4g8XztMq6NosJ8br1rNstWnTXofdVovBrXOBcz+9SSjtUw273dPr27/0ilRBBHEYpol5uDFP
	zID8188kE3rX6mm8w5jg7jjA6e+pSUK0=
X-Gm-Gg: AY/fxX46/iC9MBG/ubtW4LWF5wvLtiU1N4STWha/8KM/uGiuz2SvcsQtoP15iEzJQk4
	xJLyZfuuhqRKV9yXcuYdp5aTBO+CQ/MBkcotiM2c4K9kw2pHz29HaTloLx6s/IyOsDqaYMIzwiA
	N/t796IZZmrf44j9hcLWfusMD8yi3xVi2mBQUZ4eBshGY7DiCmalMTVSB6THm1PhTAtzy6jHW/T
	QbWuH88rEBiLUoBSVoEWvDqcKeqgkNOgP2za4RqqkSS3xWLTG4QHAWNwcvLjIH3b7ZAf3upE8HH
	WtjYYOICu1VS/9Fg1oheL3VL167Bc34C17fgGefsWWHSW+sKzcy6etNVvg==
X-Google-Smtp-Source: AGHT+IH+84cyhwzRs97FLAAf2r8S5NDGBAdGmh1lgG7MxAKEttWsXtbWFaQRvJrCvF2s7/bpiJ9ZfVZPG6XaIksmQYM=
X-Received: by 2002:a05:6102:2d05:b0:5df:c1ac:8ad4 with SMTP id
 ada2fe7eead31-5eb1a41d4eemr9551477137.0.1766924758388; Sun, 28 Dec 2025
 04:25:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251211181044.4098689-1-kubik.bartlomiej@gmail.com>
In-Reply-To: <20251211181044.4098689-1-kubik.bartlomiej@gmail.com>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Sun, 28 Dec 2025 13:25:46 +0100
X-Gm-Features: AQt7F2olCrKb_Xm353XZx31KYSm38qC_y4hMqLe-E3cVNgsEcUfEuk9b7jKGnqE
Message-ID: <CAPqLRf1ZN3PWg3mzy5zV_2wfdk76-No4frkx_LTJN4tcyou0GA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix kernel-doc warnings for vmwgfx_fence
To: zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, 
	david.hunter.linux@gmail.com, skhan@linuxfoundation.org, khalid@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I submitted this patch about two weeks ago but haven't received any
feedback yet.
I wanted to check if there are any concerns with the patch or if any
changes are needed.

Please let me know if you need any additional information.

Best regards
Bart=C5=82omiej Kubik

On Thu, 11 Dec 2025 at 19:11, Bartlomiej Kubik
<kubik.bartlomiej@gmail.com> wrote:
>
> Add missing descriptions for vmw_event_fence_action_seq_passed.
>
> This fixes the following warnings:
> drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:526 function parameter 'f'
>         not described in 'vmw_event_fence_action_seq_passed'
> drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:526 function parameter 'cb'
>         not described in 'vmw_event_fence_action_seq_passed'
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507040807.jKTxWGVQ-lkp@i=
ntel.com/
>
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_fence.c
> index 00be92da5509..85795082fef9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -515,12 +515,12 @@ int vmw_fence_obj_unref_ioctl(struct drm_device *de=
v, void *data,
>  /**
>   * vmw_event_fence_action_seq_passed
>   *
> - * @action: The struct vmw_fence_action embedded in a struct
> - * vmw_event_fence_action.
> + * @f: The struct dma_fence which provides timestamp for the action even=
t
> + * @cb: The struct dma_fence_cb callback for the action event.
>   *
> - * This function is called when the seqno of the fence where @action is
> - * attached has passed. It queues the event on the submitter's event lis=
t.
> - * This function is always called from atomic context.
> + * This function is called when the seqno of the fence has passed
> + * and it is always called from atomic context.
> + * It queues the event on the submitter's event list.
>   */
>  static void vmw_event_fence_action_seq_passed(struct dma_fence *f,
>                                               struct dma_fence_cb *cb)
> --
> 2.39.5
>
