Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE623D544
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758700987; cv=none; b=dHaM0Dl+G2l1N9eyeWx0ROsesH9u0v1lO0uftU+ktjh+Q3gc1X0KVqOMbae8cFf8l2awVOhtGjwl7jgB8mazVx7Ae+qAuR0NiP4iqIO9vFVu46dFOSeUdBjaBFNMGLrFPR2cnpeNGLcYTYtQPXhv2BWHgAcVun3xwFvQ0mv3QQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758700987; c=relaxed/simple;
	bh=gZYO00dsgw1/sZf16O3pqxqviKudSlUhSQE7SGYKT4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I30kTpD2vQudZ0zhYD/Z22UfHNlvARv3nXO0+lcgF2hdkKdOslwYcmoHeCvU7JyQpenrkbCn5zR0olmrkcvYrF7xckq6AqjWZMktITN+QRo7jLq/rzy1IHAJr4vSfV4aVrCCNrAYfG8Ar3uWjdXoXkjBVjKBhUP5+m6kEckzhsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMK+HFEn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMK+HFEn"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62f4a8dfadcso7861369a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758700984; x=1759305784; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ehfc7lW7bxLwmLG05CxRKvZLBCPLLvWLd72j5jVN5N8=;
        b=PMK+HFEnn/Q/NHm9iZ2OShshSzzfMEiJsWbAxXIzH+SYXyYHmNUtw2vGYOJJ4suvQx
         Ibtx7P4SQN97Wsf9ulvN3+dbAogiHS+YR4NTweJXp9u6Xk+tPm/aJkKQPYVmY/NM2JjY
         YfcLKHVCn6WIUHi4tSfMm0vzMkOzFzAsI5c5M4i6+w6+NRKhD3ZEKcSjyr6mz1ZyYmIx
         gixOdOzsP5LLx++nSq6Ouiw/IYVMsnfA6M2/tW7BZFOihwTJOWDa3lN/V+xBBswuuHnt
         1eIhlk5U0xNkuioQ6N9egmWWF8NuYy0TakNTbD7u2HXKCu/aX/rm2S233YacCvy6xRB7
         7FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700984; x=1759305784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ehfc7lW7bxLwmLG05CxRKvZLBCPLLvWLd72j5jVN5N8=;
        b=i2XS+VLBC+EiI4fI4IT5DEhiXZALvEp8MDUxnC3SaXbYJU7vZptJhZSsMYekuKFmw7
         PIv/Zf+PfpL9Pnundy3V5hGGdjTjNdCZDoVVRmj++IGYW20esPOOz2qKl2VWSy5J6hU3
         rZ4K7em6ERN49Y3poDbaJcLOprQEGHw9fQ9hT777dg4OaZF2xENmf2xxr0exFhLSCIVL
         vu50C7RMAS3m+87uA1tjdZBXO7KH/+MYiAWQMnT0VQVa4xguNfej8Qaup4RoZvLDPkyZ
         4fRR2TaE+O1ImK8NMoOuM4JhzD9FmIMvjJSnEqwhjT5G1iKDt4EvMNczOQR0jNcblHbK
         n7tg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3rl/ai+r3vYyxUMaiBHoQLcVDrizSO7jHksSE7d7t55I+vges4oZwMJcDa/JBdZuF8eiomaCVHp7+fGHj5gPHnchtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxS8S0F+ACABNoYE1A5XsCbUDAZ193Au3RQzr9Sp57zyd6mmDlw
	mJDtI6NYhikeoGBQJn67VUK8j5oOTFz8MsqTWYZ/wG+6MwOaiq+QyZ+HGMynrkQj704Nec8uK5u
	R+DdOygq8UAddSlOUJpqKjSP6hYYo6lY=
X-Gm-Gg: ASbGncve1jtJ/n4RgnuZQuHDceA6tktNHuhitzjL+jlHR20R4nl3rke67zPFZSpiwEh
	lyZsRqlZZUL4/YwAmTzxz2UaWEEompF+8n3oaQXy3ygdD/zw9W6GsTKKpYjg2kKF2dHwPKUE5E3
	5+8i5pphAjTQenujczxaSBvhV1+cq4Qn1xQYc2y+zeSQ5+VKjEFvYVQWPqw2s8ael9xKM1SFzqF
	1TI6XxQJjLN+LvFRdqclLcM3Okm3Iw9aKsWpytTTkrNofsi8ibNIQ==
X-Google-Smtp-Source: AGHT+IFxLHXew9N/JexqdNTfDfR/A0LfnbXCLzDT8ABYFnADQGfGxHrMbIpi3ZFG4X939kYRjpoOubp/hHRjAOYou84=
X-Received: by 2002:a05:6402:254e:b0:634:4e0:836f with SMTP id
 4fb4d7f45d1cf-63467795097mr4196054a12.1.1758700983944; Wed, 24 Sep 2025
 01:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <83171a57-cb40-4c97-b736-0e62930b9e5c@lunn.ch> <20250920181852.18164-1-viswanathiyyappan@gmail.com>
 <20250924094741.65e12028.michal.pecio@gmail.com>
In-Reply-To: <20250924094741.65e12028.michal.pecio@gmail.com>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Wed, 24 Sep 2025 13:32:52 +0530
X-Gm-Features: AS18NWA4QzzqyxonbnUZkhNBqNGPKS9vhQ2TwPcWTvWPtTGvwTC0T-6N-mfumR8
Message-ID: <CAPrAcgMrowvfGeOqdWAo4uCZBdUztFY-WEmpwLyp-QthgYYx7A@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
To: Michal Pecio <michal.pecio@gmail.com>
Cc: andrew@lunn.ch, andrew+netdev@lunn.ch, davem@davemloft.net, 
	david.hunter.linux@gmail.com, edumazet@google.com, kuba@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	petkan@nucleusys.com, skhan@linuxfoundation.org, 
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 13:17, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> It's not freeing which matters but URB completion in the USB subsystem.

Does URB completion include both successful and failed completions? I
decided to go
with "free urb" because I wasn't sure of that.

> I think this description is needlessly complex, the essence is:
>
> rtl8150_start_xmit() {
>         netif_stop_queue();
>         usb_submit_urb(dev->tx_urb);
> }
>
> rtl8150_set_multicast() {
>         netif_stop_queue();
>         netif_wake_queue();  <-- wakes up TX queue before URB is done
> }
>
> rtl8150_start_xmit() {
>         netif_stop_queue();
>         usb_submit_urb(dev->tx_urb);    <-- double submission
> }

I wasn't sure how to describe the flow of execution in a multi threaded program.
I will resubmit a v3 with this version of the execution flow

> > Reported-and-tested-by: syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=78cae3f37c62ad092caa
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
>

> Tested-by: Michal Pecio <michal.pecio@gmail.com>

Thanks,
Viswanath
