Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152A31CEADB
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529675; cv=none; b=aXi0n9+82rr4wz1GPKvO/2B5Q1yaGfkpZidK++J6ZvSTlsZfuKTuo9lGblY1+cBzuRzKVLheRCjZIkyHWy09dqmuBNXmZV0xmZtwojYmk6XSQ3p/7i39jYz5fuvON90acy7C+0nLQpeB1ORMuq5Bz4kEsNpt4bAt+4uvIVlW2AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529675; c=relaxed/simple;
	bh=V9Y2NIs0QY+zYv8H9yC29XGZyfNuVxgSGOBvL77XYk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxYA1HuBXyHWN6jZVWtUxYeR6U2Q6gMzt8iRJKpxv3Tf4d+Xzc9J86SriX0LdHu3cw+E+4Q2T/u8Aam83RuSG1WDm99L8BQaz6q+tQg/0aLRfDx0yfvvnid32Kot4U6zeeIIcMG1rEPOrdaTR4XKP2WsqVAGg4fWV2/xnpi4vC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GuoIvnI3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GuoIvnI3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2352400344aso44560915ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 14:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752529670; x=1753134470; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHUobGGDL83F/rNDnQcpYA+2CpRw+ILTCJaorukvyyU=;
        b=GuoIvnI3TzirPwrQleKvT2j69IR6ZvC9WqErF5kDby7EPoD33OymDct/H2n/5SDtrs
         u5Jba7G9TXQ5XmzYaHWKbUn8UYQBRowZS7YtHVjhRh3vXQ2iPNrLFBAM4TqDRXtzCVgm
         Wo6qSczG5VzNTSOey31Cbw1LQNWPUcSWXKxTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752529670; x=1753134470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHUobGGDL83F/rNDnQcpYA+2CpRw+ILTCJaorukvyyU=;
        b=cxs+QXktNvoHgwXk39JTQ9iTJku9VOo2hA+Vf4c2e7n8g0iel+Nc3ollS2mFCyXK4N
         OQjeOx9X+vTahJBRpEmYVfRQzM5EyFfi+BvRaJ3YgMJtR0WCuMT+QgycMNDi2mvHwbLD
         wA6YYFyVA4ltrG1T03gyycGj8SePT7nKEWx2I3K/bhVXrLr3pUXfC6Ag8ovCP/kT8aak
         BiXXMrkMoSRTJZrrMsEed+6IbITVuZkLHggvSxyPZHEPNxUaqFMntSBmreI0GtgFJjQp
         qFFA5Lk+TQiWFSwK82LQ7njhVuuDRBeAOzqUHRXdNc15hnMAxEFyTr44KopAnwtZ5J0p
         4vrA==
X-Forwarded-Encrypted: i=1; AJvYcCWVbVvg/6PMZ7BHlSpEUGOyRvhepfalDlraRlN31hqofBymC6eQmEnPWqv16GxfneQT4fs34UAOyv2+K2SDPVNGmWlg8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSKUks7D0Lg0rMNWc/kwS402wtwjP2FRQi7Wfh52lYas4CbqZf
	AQ6mziuZMrC5bePNyjVL2/0lTi25vfcjvVrPFJmK3n1mJrW/moUV145vjyfJyY9bfPNzx+O0/P/
	1AVU=
X-Gm-Gg: ASbGncsFYLaW7J+ONzP0ma//s1EXXFxw+C0Q2FZ+yI40zQ3JwZ8VE5QW8ntc7aSVZTX
	h74c0PQsVFrKeHQ/e4NmlMPgHlKvV/H7Q9FZ8GyV1ESw2cJw5V+TehF9DTx/ZYZ1jIuwe5QH6ff
	kmqth9jNGNsCekFw497r/Quh1pDW5+krZnNxtNfZ0/RNKT6AsjTVabTPH9yRR/NeqRCRxCOdw0U
	/Xmp7wZMSGlbwEkfdFiFm/i+D+9Hkh5GIcXVo//6tIH5V9p+Td/RYQq4iEa1I84Zf3SodbxNSpc
	Gv8L6kUwJPNMmledzu98p/IdXP/hKEd2uHU4+rIdarrvui7+3fDa5kMsKOlOVlJqHPxjxH67dCX
	+H14O/ABUOdu8C8M950vPxVO4n6/r8YQtNkJtdC7LAe7tv7xNxMmQp3q8xxG7yA==
X-Google-Smtp-Source: AGHT+IFHTPR2RZxyb6f6W6qMFcAb4uHvOGM55W6sBWkO9xX7rargEE3dirAwc+ShbWzrz1JE4Yrbmg==
X-Received: by 2002:a17:902:e88c:b0:238:d19:864b with SMTP id d9443c01a7336-23df093eba5mr232638475ad.41.1752529670169;
        Mon, 14 Jul 2025 14:47:50 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435baccsm97945295ad.227.2025.07.14.14.47.43
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 14:47:47 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so3907743a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 14:47:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUe4a+T8KuVssaeHoR6c6m5e3J1WPJ/SpDbWhuCDgrg7apraW8xOF8ieZLz9VvXWzVZyyspCAO9qJXLZubHoCQS20u6oA==@lists.linux.dev
X-Received: by 2002:a17:90b:2f03:b0:312:e90b:419e with SMTP id
 98e67ed59e1d1-31c50d7b487mr22879682a91.12.1752529663338; Mon, 14 Jul 2025
 14:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250708073901.90027-1-me@brighamcampbell.com> <20250708073901.90027-4-me@brighamcampbell.com>
In-Reply-To: <20250708073901.90027-4-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 14:47:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJ8yqzyivLTrVCzjtNOH1Y8BUOS_U80es8vJGBt3AdCg@mail.gmail.com>
X-Gm-Features: Ac12FXwFl16Z6-RJd6zYJ2xS_PM42hpyLDaAqwQv40cOctjOMerkyA2E6guYjpo
Message-ID: <CAD=FV=XJ8yqzyivLTrVCzjtNOH1Y8BUOS_U80es8vJGBt3AdCg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm: docs: Update task from drm TODO list
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Update TODO item from drm documentation to contain more applicable
> information regarding the removal of deprecated MIPI DSI functions and
> no longer reference functions which have already been removed from the
> kernel.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  Documentation/gpu/todo.rst | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
