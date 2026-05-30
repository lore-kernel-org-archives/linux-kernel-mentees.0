Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849783AA517
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780144802; cv=pass; b=oXNJL2KnqNL3ZljnYqntSy8qYc0OVFgXdhUUh+ryTtObpOF2w2nuwdhmfMZzlflTWqP56gQjQgLW08xlOejY1IMEX2eNb2OK0Uj8QFpU62a9gerhy8gQTYlYdU2ilwTJAvxmYylmqXESf1HCDmlL1wIoG28FMHvNdyGQP+djAwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780144802; c=relaxed/simple;
	bh=mCFQYPb0hER5/YK01K9/AMjW2Ofy75QWLf9PsPmXl1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVqnwBxKZrtl7RL8UlRpXqojCNb0ubz4u43gy6higu1Q9YpDIymceB0QxJeyEaedOmPBZkow+N1GoA4f3owtYgHWqQStF8Xu7jO7sshGFRP8TCYbp89JVDa+zd+Wmu+sVErmT8JxQ2AjwxJR+ZYriHirOLODS1Zv3At1n3M8TB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkkJQtnf; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkkJQtnf"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-be4344dde59so428197266b.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 05:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780144800; cv=none;
        d=google.com; s=arc-20240605;
        b=SVBvLFwg6GNTKoPZl0dcdrrPNh8Pi2fY1IpyNgZdLREyXSOxQNAmQuKBxuFZTfw1mZ
         Gf++L5pgZHCB6HAqWcLKMhqrE/7YOuU7euaMRt9VB96+2/SoJyKYtajdCGHnLBIac9Rn
         3kX8H5P14w+DYXB6PsjaLMdF33hPPv4hKHOvH2xZ9z03vNpwYjJCUG84XdhmgNhdb+vh
         tlxM3WUvUKMVMVEJOuTSMyZcgmMvn9X8E00w+dOFmPQqcyDNJZFEusRbHEJoa2HGbXQI
         8WUqey4BZZmMJJs6BrtZP21pRfQeXMgFgAXVltmyGBCKzS7dTP4LrigiFAt7vy3f5woW
         46iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCFQYPb0hER5/YK01K9/AMjW2Ofy75QWLf9PsPmXl1w=;
        fh=uGb71+esOcaK4rRn1jSmnES0iYOoWSmvB2bIwxKUqwo=;
        b=AkeC8vG4liWM2mjocoBF946hjPQpK9s0CYKROA6Yim3xM3NTCfMaQI0nJHZfzn7xdV
         G36pwwxYTS/+HrMGq6yJ4OD+OcjTLSLYZNbwBOwfokWuQauO9l6IGOZ5xv+mEQPWxxYL
         GK7VCAXjUqYxN25tB3AfrgFOVKC6iwnGd1HEy5D/EOBKvYT9iAHLQ8CUg/c/4VAARlVj
         zIdpdVLSvCr6cte1c7zOeiphGU8AG48+mWLprNIJxeJxgboKRXwAgk5a+eMA48rYURaO
         B3TA5wnzNsIa62+e5ObQkUTrL6bAOZ8wvbeE8r8aJF9oj3jetCWGaCSLryzsC+niZQj1
         peGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780144800; x=1780749600; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCFQYPb0hER5/YK01K9/AMjW2Ofy75QWLf9PsPmXl1w=;
        b=KkkJQtnfTJTfz4N4tJcqYmOKPvG1WzV5bGfj4RbbdKZNBGRzjn5fQuDHXp0tkFoHPo
         Cla+JguU0+kv9g9HFfi84aNOinkWOGFLgdg86vjHF5jyp+Eiwvo3oTdBoYKIYGnEiKIL
         6yewudjvC859H5eWts+8TMvcHSLYveOUem+3cCYuBUF3jo8So10rZRxCYGEKPjUFLcuw
         SrHW+L7bpo147YWCICPjKCnyNPB0/3DiN14H1JtCKJpPKXwNLpTmR52PePsC3xvtt3hX
         H6NHifJU1w95yJ7P8v/fPnrnFIhPNqApNYXXm4FdevjGVa/wuqvwPXDopBFe8PLHECuK
         R7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780144800; x=1780749600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mCFQYPb0hER5/YK01K9/AMjW2Ofy75QWLf9PsPmXl1w=;
        b=g+DgiqlByC2xdvCWT7MtHR1HF+WctcZU9UEWvy0NKYuFit5ArThDdwBmmT7Bn7ghC+
         UKUKT0kEmd5JtiS5LgSTjivEnLVOLDG2kBLSUds4wkwkKGSQIQGOYP6eOLbX5al3yvV7
         oQJNryFkVi45cAoivVyAh1xzBbzoyMDlvJfiBqIqBZeDdC0ux3+sLXSC5G8vyblkc3oz
         oYAX8e2ZgmK+e0dW/MoMwXDt7mBZCQXd2GJrYoBrXRe85XrAMEg7TiIhJeb9HxxiF4wl
         vbtAvIPfkPER+QUziuAsfQrEqhlPIVxWWY/w6NzWhtV2EGQMarHXweqj88Rl1OKxaRTN
         OHAw==
X-Forwarded-Encrypted: i=1; AFNElJ8lzxSEs1fNCT8FUI5NsTBRhQNW7UZ1Xj0/AqVtBe+66Ircgw49NlI8DfBw3eVIcG4l1NPEZG3bwlyvsfM14w6liX16nw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0976qW/EBLr+o4TFU0oX8OatanaRyCGOO3YrecHCRUE6v2evs
	qzENerTL+bs5mjwtx4u1P2QyEXaeHt6/KLryGuy/LrN9/HyHDHReyBBXat0xCTNllCZbpbTaXJA
	gLRPClgODpi3ln77sGPcZ0sQsiKzjFQ8=
X-Gm-Gg: Acq92OGY1GShrCMP1c8xEckiZW+M1UgUSogFRaR3Cv0nVYLqyBwnHvB91gB6e21gkj9
	MpxyxVgVgrFMmuEsEIyK2iUy1IXHTcWpcDvObK7XL/ZMpdmjgcWZIIwwUKl00Fzoh+6gdremVJc
	gs33UEDoVIX8ACsI7nPqfT7mOJswjuHmfyYUYpmxRM8wUwt9/5lR+YWDNUDxVb4fS46oMDTVri7
	aGWzy3eZV5zDEaL+P1wlX6rTLcyZLdCG6XMlYCDxIuh7aTr5LHgbf+u49QxPW3MLOxD51RyMSrp
	AC8WNxo8gR09Koxb/svftAA5aG8nFcAlVLCXptGIQN9YcM9scKSQBdzoy3v5ViC8PFdUQwqErAV
	+FKpL4hciAi8izuw4CB3uXL7oOn2XXmPI4/KmRz8eqXfDiyBbtvwA1R+mcSWmPjRssOTQOZIgjL
	BRWUP1
X-Received: by 2002:a17:907:3da0:b0:bda:25eb:1893 with SMTP id
 a640c23a62f3a-beab52314c4mr187958966b.20.1780144799547; Sat, 30 May 2026
 05:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-4-suunj1331@gmail.com>
In-Reply-To: <20260530113938.171540-4-suunj1331@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 May 2026 14:39:23 +0200
X-Gm-Features: AVHnY4Lmuhtu-KybdV7Y84jYr1jUSp6SdCGizBZhIGhDG0mK6WX9DgW9jdLlhgs
Message-ID: <CAHp75VdMZ-HdJXA0SLpFrs7AZw90v+VRpbHgoiugwooG62cbhw@mail.gmail.com>
Subject: Re: [PATCH 3/4] iio: pressure: mpl3115: generalize interrupt pin routing
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, apokusinski01@gmail.com, 
	me@brighamcampbell.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 1:40=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> Write CTRL_REG5 explicitly for both INT1 and INT2 rather than
> relying on power-on defaults when INT2 is selected.
>
> This avoids incorrect interrupt routing after a suspend/resume
> cycle where the register may not return to its default state.
>
> Route both DRDY and FIFO interrupts to the selected pin. The
> FIFO routing is not yet used but is required by the hardware
> FIFO support added in the following patch.
>
> Consolidate polarity configuration into a single code path
> that handles both interrupt pins uniformly.

> No functional change intended.

All the same issues in the commit message as with the previous change.

--=20
With Best Regards,
Andy Shevchenko
