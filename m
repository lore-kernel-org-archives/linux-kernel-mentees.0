Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B6232AACB
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229503; cv=none; b=qufi6SO+4VwJOF3slpxW4wcZJiWCdSEnZgdt7rgz8JYP9dEVuiZHe56ACLmJH8KO380u9I+OjSrTSnMZNiccjxseaZbo/5XKLVoQWW0BRLchzMieYrXfSXZcgBPHOi8oNRbwGOayyFtX9jSaxD2lakDX20Cht6j7h5VV0KbHsWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229503; c=relaxed/simple;
	bh=3jJe3/TFyxxkrvAPG05/Jjbc6EONurj1AmkQ2D7bhZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mz5oALgzeiMYS24/AU8Sk/ggxW2P6xQC83UPvz77iDs9xvB5BAWOk1kaUqfg+bGeyZzurvw90Tg7Y52pxhfZ2DlMsrTLBAOJ0bpmaLGS+3RoiuRXaaoV1bDTf9LHG6/RrsJnxFKzKKnksCnVqXWpsxiEQkOpDA6V6QtbucIRd3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPhFy9lj; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPhFy9lj"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33ba5d8f3bfso767735a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761229501; x=1761834301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf/H8hwwjXHOcfEd9IHK/0BwkuvQECWP59//+xIoOuY=;
        b=XPhFy9ljB9D15zJ+amBT2zbJ4FWWEuWmNeLy/6A/eXKWVFwz25pCoWM7JwbZkLPNRk
         RrPp0Bk46HRhectmKZJWWuKW+pndTeGenzNgaCHM5XZU/lpoqNva7rExtygurFCBZ/bO
         tBbdYZol5MPvPX7t7rDId9WUPfe/1+K5nX+XrfiRLwZLX4kER4ikXTZb4sBU/VkPKBp8
         EFj7Zt2kvOoI+3w4TLT8dAWPEyhpsgocM7J9fYrpciFnGW8NFE8lVs0ulklDCPQD9dU6
         npnEb8hQht6hHN6oQ39FywQpV4UdaCGhaMqLkOx3yRlNvl0lqJ2ELkTo6OeGLlhmuB5g
         KCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761229501; x=1761834301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf/H8hwwjXHOcfEd9IHK/0BwkuvQECWP59//+xIoOuY=;
        b=Pktkd2abICgPo3M9n9cCR3zSo71MmpCH+AJWGfGEmbAydWv+uzd4H59bBn0HTDGd2Z
         bmX0p4obnPwXpfyQgVmIDVhruOPRzKFe2hHby3C6VzClK8dAN7fM7UKY1WTHIkncyFsp
         jYRJI+ewdOSlz+Qrrnli/Utjevq4WK+4crbNLY0fV9vtR6YXCcJYOtgoltTiiEv0MAyA
         1fidFbEGH5Esv/+meCqeBZUqgSbNRfR40MdvWqElM0/PjNk5I+hMIdRU5bMnZ1cLga2D
         WyiMYECTnLE4k4mJt3Nonj1cNf7lh+/WUGLxl94+zHUtr8eZGYHu2Y07QziJWZ2M6SdB
         nVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWEsk8G/V6IHTb0sysj07u+Aw5bTKMO5u43ztyhqvQir8FixQgNgPj6cw/utWB3d6IZyJ8sOuiIxfDaT4eih4HVRIXow==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6i+wyV1UZkAuaCmh+xcdo8U1PyEFjuQqcQs7Gf9ey/PNjfKWc
	RAFua/F3zWh9jVmA7hpvvBDkX9FQ4mBgerTH+HSqCAW4ga+GiCV6brWo
X-Gm-Gg: ASbGncu78TD+DildIKipUP9gRpDu8SIJm+by8hmzq6FxenNfQlvn04GAg6ulEL56elM
	1HKpngNvnwJ8nUlyOasQ2YdBAMkuhLyJ24ovj+zZp6ui4AORmWON4dxKWNPZ44nXP78u+anRSG2
	qV2F9wDc+R6W6Rz3xi30H6gZ1jszcISNDlQyF0dBEGNlh3YU8XM24mlvim5W3PVxy3XzVQeWSGI
	1sJWZSvT7ih1PnVoVWU8TITH9+M2FZxS7V2EMbqT9ThB8iyMMh/VK+QsqXba8H5u7/1/e2ySruL
	EPH+uBs09TjE92E+d8jzhaAgfiQ2hQ30AVhDMfj9AqBwmbTYBdgWxB51gC/9fzKvsnaZawl8tst
	qLHBZ+vUSB/DWjyUartHwPeWK8PaB73KaHwmDhzuv0PfAtSathFaj+0dZcH1QPIe550zD9fnn9V
	FLHYAL9WwqhnYQiYfoUA==
X-Google-Smtp-Source: AGHT+IGe4BeM9/pmyB243lXYseQKK0oQC2Kow3UQh2Om045EVbmJQKLCQhmwXMTvnHHyQoLOWJ+UeA==
X-Received: by 2002:a17:90b:2d8b:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-33bcf8e4a07mr30935358a91.23.1761229500703;
        Thu, 23 Oct 2025 07:25:00 -0700 (PDT)
Received: from rakuram-MSI.. ([2409:40f4:2040:16ed:f15f:ed0a:f0b7:34d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb0191b1dsm2585682a91.18.2025.10.23.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:25:00 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: lorenzo@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	dan.carpenter@linaro.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lkp@intel.com,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	rakuram.e96@gmail.com,
	rex.lu@mediatek.com,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] wifi: mt76: mt7996: remove redundant NULL check in mt7996_msdu_page_get_from_cache()
Date: Thu, 23 Oct 2025 19:54:47 +0530
Message-ID: <20251023142449.117936-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: aPoqiioo6kUZ0kbY@lore-desk
References: <aPoqiioo6kUZ0kbY@lore-desk>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 23 Oct 2025 at 18:45, Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> > Smatch reported a warning that the NULL check on `p` in
> > `mt7996_msdu_page_get_from_cache()` is redundant:
> >
> >   drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1651
> >   mt7996_msdu_page_get_from_cache() warn: can 'p' even be NULL?
> >
> > The function first checks `list_empty(&dev->wed_rro.page_cache)` before
> > calling `list_first_entry()`. When the list is not empty,
> > `list_first_entry()` always returns a valid pointer and can never be NULL.
> >
> > Hence, the `if (p)` condition is unnecessary. Removing it cleans up the
> > code.
>
> Hi Rakuram,
>
> this issue has been already fixed here:
> https://patchwork.kernel.org/project/linux-wireless/patch/20251014-mt7996_msdu_page_get_from_cache-remove-null-ptr-check-v1-1-fbeb7881e192@kernel.org/
>
> Regards,
> Lorenzo
>

Hello Lorenzo,

Thank you for the information. I did check both linus-mainline and linux-next
branches before sending the patch. 

From next time, I’ll make sure to also check the subsystem-specific branches as well.

Thanks again for pointing it out.

Best regards,
Rakuram
