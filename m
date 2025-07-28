Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17A22905
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 00:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753663697; cv=none; b=J5CtIYKSNRxQmvENl9irZGKeKuYOl25hWrimQYuue901pKntypO85vulj3GYnkNkyb/V0UQAdSbkYoDdSW4GYtRFIqrCTYyZY4qZFf+kcBPxe+zLIPnChUifwSMYp7Zb5zXvFL5LdzNlVF99rr354x8gmjaEsHoNV1riApBx7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753663697; c=relaxed/simple;
	bh=iIX49tiYzPNTP8eihaWpW/U0hIgo3vaKHykOa9R9yFE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Fhrhpqoh8x8CWtpwmMycxMnqMTlBwSkQcEwkrkKkgpYhPbLDZ8ZiLOl/UzlbPH0W3dDLNJe4qIHrXWr+/CI6z8G8eY84m82Fl2CKYmgTPlHf4VsUM5++rhGerGawMdQz4h4k8nNrn6TMIiX+O3/hK1qNWWKIyY91tx8VRlg80g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Cw1siGEL; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Cw1siGEL"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235e1d710d8so51268765ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 17:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753663695; x=1754268495; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/m2yLXtAPbsmvVSwdPJxGHPEjPAoGD9mowpJ03FJoE=;
        b=Cw1siGELM0BIbeFs+axZGE7reNGTN3SRXYfHfqnkZFC6PBhefi0Op0/11EswxQ87h2
         qLEwVrgVu+mkyTN2NFnK4dlkMCR/f1eAdYzx7fO4FhuP0LgaLUHoMj7PIHkXwpu5zf8v
         X2JrUoTgHsPZIzUhilAWRQaJvKjVczAXfWAuicWmtAho6rbX5kCNfTQwtPrpch17tw7w
         m2H7L/47wXNqa0mBj0ntM4M5WlFvy5iomebW5qkKpiB8QKMxOfTSux9mrkfode0ipVLv
         Jkb5QIC5VKD7t/Yxc6fuN0QKv5t+NMheyE38mK8C5FQOEx4zkyn40hEN28C6EcBhGwa+
         KKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753663695; x=1754268495;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/m2yLXtAPbsmvVSwdPJxGHPEjPAoGD9mowpJ03FJoE=;
        b=haj8Lz5AS9fBPWrKq17JQsba3x0aAABTNfAbq+wggwm57MbM68hQan6OKUZjzvkPmO
         f5SDhTDyGwhXOM11DnylgyMY1v0B1KacDBXOUe1jHrp1BNS0wf9SPFI+S9QPjSCh0E9W
         9d9EEWlNk+9qE2y0kD+eHjgt3y8gSZpOYwjUZj89gvRMXSbtlj14xjCWkEg8gAjmp2vQ
         Kbot1kPfOJMpujYPqOic7nHqPI+FwySv9P3bgKqzFG/VBsP2k184ZK51DJntbQZhPtcf
         ob2xq9iU180eWTPDF33XotvSGc1XJn6vc5/uSvbgOzV61RouMnGQCDcwBYajIEsNscbA
         10Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWfz2Jf8TqUA8cLAhp/uoIU49oH5AZ1vDvuqejZYR74gzqDZsdMXsvDTYNkt9oMJ8LzeGWdhI48mBnV1LQy0OzOj2S2sA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgyorCjmhqglDWUFNw6GL9Ua1fuyWJ2jbz7jTyR6HoKQJpkEr9
	NXs2sDJcxbcVCXuaTNc5xGrouXSWuMDfUJ3F/GhZH6R6Wk/bgBN1EANxaAWGdpQhdog=
X-Gm-Gg: ASbGnctwixs54ZaBfecYF7SETKW+Ay9xgB+xskvhvXX2Hpjsmv0JFEUBUpnCkGyfeU+
	FWbY+U7D9SITa0zUzjbZMf5P1H3GsoZKz7oLxw9D8QUfbY+Nvu/cGdXNAw7X2lpRTzer+qLssf6
	AK/qP3nEJQj++IonGWcEM7pkxqkKKW1VO6pWZaOX/JymK1M2n7nZ66ifdpR3fJda0IJEYiXp0FD
	ZciSef9kNiQ1inWsSxEIKzPUFSmIZlQNX6HwpjVTdvaeEKMkNp8c3BR0L6KnfG4HyKUjZaHi7XL
	QTEPx7Zuj3pdLqUyKAHiKBWzcSkyVKdBauiJV6uLTuN/0iD4qWtQ/T9fgV9WJQI1N84WX65pPx2
	Q/HSTRIu4x3h8xCKHZ/I=
X-Google-Smtp-Source: AGHT+IGpUSWz2rXiHT5Ls8XtgdyXyLyQSY2jYkIIzKTp7aIQYL/oUdeBjK25CLIA8d4piIBSPhy18A==
X-Received: by 2002:a17:902:f54f:b0:240:1ed3:fc1f with SMTP id d9443c01a7336-2401ed3ff16mr35964315ad.12.1753663694957;
        Sun, 27 Jul 2025 17:48:14 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe536e4asm40996105ad.163.2025.07.27.17.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 17:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Jul 2025 18:48:10 -0600
Message-Id: <DBN9W9SJU6MX.F5UH2D1QCJNC@brighamcampbell.com>
Subject: Re: [PATCH 1/2] drm: Create mipi_dsi_dcs_read_multi()
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250724202338.648499-1-me@brighamcampbell.com>
 <20250724202338.648499-2-me@brighamcampbell.com>
 <CAD=FV=UZqzWd+Ke2sU-z86jnhKhUo8v0ChyKYnGpmx+s7n0stQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UZqzWd+Ke2sU-z86jnhKhUo8v0ChyKYnGpmx+s7n0stQ@mail.gmail.com>

On Fri Jul 25, 2025 at 3:16 PM MDT, Doug Anderson wrote:
>> +               dev_err(dev, "transferring dcs message %xh failed: %d\n"=
, cmd,
>
> Format code "%xh" is probably not exactly what you want. If the error
> code is 0x10 it will print 10h, which is not very standard. You
> probably copied it from the write routine which uses "%*ph". There the
> "h" means something. See Documentation/core-api/printk-formats.rst.
> Probably you want "%#x".

Ah yes, I had based this change off the "%*ph" format specifier and I
had mistakenly assumed that the 'h' was a literal 'h'. I'll fix that in
v2.

> I'd probably also say "dcs read with cmd" rather than "transferring
> dcs message".

Yes, this sounds more accurate. I'll include this in v2 as well.

Thanks for the review,
Brigham
