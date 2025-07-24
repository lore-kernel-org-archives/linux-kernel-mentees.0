Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E37B21771C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 07:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753343350; cv=none; b=Zc+MxAqKgKzDIVWI9hOpPCAUuUAXg8ZSj1KZqHYkwfk4glOqtbuFeu3LNnh2tJebtDjBfz8K17o3EK4w9kTfP/vbNCpovoHVkr9dKkr+s7yhoW2rgZ+sZ/X9RThVOhtKjVE//mNpwsYHyOOKBFEWdMaGvY9d9jJm7yT82UPnfO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753343350; c=relaxed/simple;
	bh=d/8QVK8y6ws/QbHuiFBL8hVTd/dAilTt+zbJtKU4EAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXBe8h5ECnICLEwSB2S5Xt1V6mQDdJz0orhonxx7rN12FYsR+764uguu2gW30gCqsw5eBLwOPAqWck0r7vQo974ENlDM8wjUvUfUAOPU7W9MrlRgJtoaR7yxpEniAi6O6beF4vEKpgsnGlI8zWJ/UJDwOOvQXbMcgeBWBfYITFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCRijVcJ; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCRijVcJ"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8bd3fbd9f7so498356276.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753343347; x=1753948147; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/8QVK8y6ws/QbHuiFBL8hVTd/dAilTt+zbJtKU4EAs=;
        b=iCRijVcJQrdlIG3E1BcurT2Efudqk8+8DG7dUUEKV3MZVvxgnRQBLi7t11qWXIxxPY
         7F0FODSiSZiUu9ZD10FNEqbWgN03DlY3FJGNqK51oeXbYStBGmdkqrLD05/g9fpqKDOX
         fBp2Avjz9h81JndsHQv8Rm2wUubetXMT5wIXENg+HDiYFCEtbmm8LnG0da2xrq6O1+6r
         jAoH+7WcpHL+U0t9sNRW5GiRDcD8V5ifq117OzMVmGGVw4tw3tOpKk/8iDYkT5Q7VOoO
         WoCtHlcTqGmgApgodfds2S6VaWcwoChkUr0RhkY1gpWQTE43QKHUYxNeSjsI8hMA8ude
         KAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753343347; x=1753948147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/8QVK8y6ws/QbHuiFBL8hVTd/dAilTt+zbJtKU4EAs=;
        b=c+pYLWWRtM9+4KGX+LoD8ujG8e22tTsxrjECznz8rNAwnqz7CPwg2wS6jCYm2YuNMl
         q5AKbl5MnhSaDN+k/wIrmCULkODaSjKqjFWHyn0EZzyIWd3e/rvM+7aPyUAjjiTTCW0Z
         iJJ4IWGCFFW6OTXf4w6VcUcRFZSdEBFCiCMW0N3rbjBinbVT89hqUtJSeR+sT4VETcdt
         uXL7lkLZQMylMroky3SZYvJp4MkEm5oMacIOgPFx4WnarJutVHxY7sFG6RPBIl17J5IZ
         E3CsSbs8JQiqbCzQ39f3nt0KM5CniTdCFD0UPyyVvFI1CVZ5smjnsphVdzou6kPN7WUA
         ZNlA==
X-Forwarded-Encrypted: i=1; AJvYcCUmSkNd4mjRFPopp6QstzQRkjMmF+50ef2PsuqbFiNjpf8IGsHDHuKRua+4koRbkuT+aHzpbS52jR+7IaXXGqzBwBoutQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5Joa91fP1C13ZJipohcWgflwfdLV+b8LxU9mXG4R04tc6BPBi
	wKBjWvoTrpdBPO0n+ltC2a/7pG1LM7icTMZuwO3bjNybEAY8/5+MrUsE8njkOPrgi0LPN2Mb0gB
	6tAQkU1yIdds1sF2a8fN3UCHcLwf+4SBIXUTzUKA=
X-Gm-Gg: ASbGncsQEXlcqoW3rVEf1Mxw/3Ap+sbaNWNHMXUBhj+ASxUnvWOmafqQy61CR0dNBAF
	CHfHBIBdlMlx+yIjYAKVLM3gzcts/c6aOsEaSZAnbzlxRP2eq9Ck6Nb089FnGVK82OvlI85Xi/p
	EFDU1uGW3nVQcteW1JGBKlI2Wk44wtn0ryParx0M+g1iACTZy0MPFNde7+ic4alY+kVNO0HeWa3
	8EZpZ40
X-Google-Smtp-Source: AGHT+IH7A4sB9RjOrAs7qrdWDTw5qFH4C3xm7jLLxKBplQo6vBecYXyV1xeaYMiKq9tnqtcJInBRTdVLgmoBF+xv2UY=
X-Received: by 2002:a05:6902:18d6:b0:e89:83ee:3bf with SMTP id
 3f1490d57ef6-e8dc5862cc7mr7840966276.13.1753343347605; Thu, 24 Jul 2025
 00:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724071555.442634-2-moonhee.lee.ca@gmail.com> <b81013d8f7cccb19ab126aebc7bc442c641d0f4a.camel@sipsolutions.net>
In-Reply-To: <b81013d8f7cccb19ab126aebc7bc442c641d0f4a.camel@sipsolutions.net>
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
Date: Thu, 24 Jul 2025 00:48:56 -0700
X-Gm-Features: Ac12FXxmJH-eMjOV40LUbD_GpkxkzA2LCDE6kmfZUjiuahwQV2PQa_PqdwVCFZA
Message-ID: <CAF3JpA5vCOK72Ojy4FTa_MVGz=yYnJ5=vd8x6prMiC7UxBGWuQ@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mac80211: fix use-after-free risk in
 sta debugfs removal
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, 
	syzbot+d6ccd49ae046542a0641@syzkaller.appspotmail.com, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 12:18=E2=80=AFAM Johannes Berg
<johannes@sipsolutions.net> wrote:
> Maybe so, but it really looks like a bandaid?! Why are we trying to
> remove it twice in the first place?

Thanks, Johannes. I agree this patch is only defensive and does not
address the root cause.

I am currently tracing the sta_info_destroy flow to determine whether
this is caused by a duplicate free or an unsynchronized access to
sta->debugfs_dir. If the race is confirmed, I will follow up with a
more complete fix that properly handles the lifecycle.
