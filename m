Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B511A26B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 00:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753834521; cv=none; b=JEbUXQ1BUFSuw30lP2E3C11afuUhcLZWcHl0QtQ+s89l3znxnLsR3A3D51TC9GlUHRKhbI8D0lPWwOK4yWtStMkAHcaCpeAnxr3txBqdUJdO4sXaKZCX8D1rUgM9WLMBi1o62XbbHN5TtApgZiWJwqQDMZ/eJHy0gH0DQOSQ+b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753834521; c=relaxed/simple;
	bh=B7mZ4nEVKbGQGNfr6ook2ZXrLnFiuRpQgXmMMoue3C0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=R/wTpXlDcKAdSLdgqXiHcrXScJD6S0w1tySCH62+QgJNqE7acj17jP9eMtqCs9k11vCXEe7a0cQkINlZ3ZppkODvPgewRbVNGcGINOEFsORXFAVBKsiMXWJOXIG5TvkUmUlAhaoNfk8j+xpT4q7I0ddf2vj75plavFpDtTZBmTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Kzt96u5B; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Kzt96u5B"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24009eeb2a7so27274135ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 17:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753834519; x=1754439319; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7mZ4nEVKbGQGNfr6ook2ZXrLnFiuRpQgXmMMoue3C0=;
        b=Kzt96u5BDBPJmW6vXtBQA2ZUWv0YKE+m3fdyCHYhgckUefnUQS3H+x7O6rieUkP3AQ
         goHqKY9i3PQDtgeglXXv1bPcw+l4g/RdLC7hW2wtpkQ1uZODBXdzJI9vk5e1P6reUutb
         extajjceU3qXmGsc0DeZAJnqdOy7zPknfoYby+9yR7G9YtQJ5+vltteKtbizr5SmCZjV
         NYe4VcffalBWVNeNeY8a4KTjp9FAq209fbpFhA6qDtTwH5AQGKZkVCOP0WlunsST1LAT
         aCUEaWdGPtwEM8vACKBTN1GlouQwJTMizaxJCumBbBD8ZENON889BuJlnKsENzoJshvT
         hOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753834519; x=1754439319;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7mZ4nEVKbGQGNfr6ook2ZXrLnFiuRpQgXmMMoue3C0=;
        b=oPioK0ooHETF+0Smn3fGNuNO8X576f2NBeezmslL/kai1Jd4Me8WTSBbz9Dt9mWQEJ
         zwrxNHXwyRSpT9GCFbWDeHcjTdiq18UxXo6Sccn6DTDfXqUhBP4SuQL/VJPxNvwtMuo4
         JpAjiittDpZSyZCD6AXEHmKfABJryP2ViixTjJZr1qCt1FCb3LrEEgAkdW+6UimDRGyt
         oVygffECNcaYehK1B69HRSshlDZQUkHBBxBS5mWYQNrJtqM/PPegYd2XK29kQvHRFQNB
         JCQg5KfLk7XCRkZcp6wl17dq7q1Klmd6MtwK0sNjkYjIivBLlZXWQBA07W5NOYnuYUyy
         9R6w==
X-Forwarded-Encrypted: i=1; AJvYcCVIiaoui4p863tnetHE8AEFQGk3/rC5QzD8nDKJxDFz6Nn8L0VXuopZVIQK8tOSpBKKlJW5Pbzomhcmrky5CSD0tUQsnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoebpXBqV//LXzD0qniJVmZc+DteWIKMwBZyI/Xl61ih2wfYP8
	mN2HrhCYcks9JLcPbus7Tz2MuN6/5k5RLL9GuwaZxSlxbR2jQnkp44rOxjdyFPDkmG4=
X-Gm-Gg: ASbGncvCVaUZoopwVTioF9KyXjQJnwLz06TScTc+3lE9ZbeU4Kr+0YDh/C4FXSQi7YG
	sCiCcyPVhDdXHRe0+7Hs8ped7wH7vADMNvze/C8KaOba9U86MO+VGnv0jjgOuj4h14KJwXwQK7M
	03XMdBeW6s9rJMQtrob5DEIc2x9DzmjwR6QBmi0cLyKTJuL6Y2ukbayU2qfLMsN3IJuEsO+HIW9
	PuBUIpDX/FI0mNFzoNHY4PErGMnDAOxzXXTJ+F3SGjUtQKmAcJ18uaW2SQtJR992aWwfMxUi3cU
	At5eNtqScFa0JSJ6L2WrFi11GhRGyUnfFZ6KdTAZCI25vzrZMwIYWX6V0iDIG1kuI2DVwQ5xij5
	3YTU3ZVOj6Xncd29E9lY=
X-Google-Smtp-Source: AGHT+IFtzt5MEl0tZciB3F8o6Fc5SKFZqY4YzGuLSUPsSrha4wOb+FYTYjRMuNTxbhYmOUlCfsVqRQ==
X-Received: by 2002:a17:903:3b8b:b0:23f:cf96:3071 with SMTP id d9443c01a7336-24096b48bfcmr17839525ad.49.1753834519151;
        Tue, 29 Jul 2025 17:15:19 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ff7044135sm69618295ad.71.2025.07.29.17.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 17:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 18:15:17 -0600
Message-Id: <DBOYG6B6WLDT.Z096YHZGRXDS@brighamcampbell.com>
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] drm: Add MIPI support function and macros
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250729054435.1209156-1-me@brighamcampbell.com>
 <20250729054435.1209156-3-me@brighamcampbell.com>
 <CAD=FV=VLoMenu22F_VeoHyfXwRO7JfXL8peQLEpkqeZ1tDOmEQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VLoMenu22F_VeoHyfXwRO7JfXL8peQLEpkqeZ1tDOmEQ@mail.gmail.com>

On Tue Jul 29, 2025 at 3:34 PM MDT, Doug Anderson wrote:
>> +/**
>> + * mipi_dsi_generic_write_var_seq_multi - transmit non-static data usin=
g a
>> + * generic write packet
>
> nit: "non-constant", not "non-static"
>
> From the caller's point of view the difference is that the data is
> compile-time constant in one case and not compile-time constant in the
> other case. It happens that means you can _store_ it in a "static
> const" in one case and not in the other case, but that doesn't make
> the parameters "static".

Good point. The storage class is an important implementation detail
within drm_mipi_dsi.h, but just that from the perspective of a panel
driver author: an implementation detail. I'll go ahead and address this
and other feedback in v3.

Thanks,
Brigham
